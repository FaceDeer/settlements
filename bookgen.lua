-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- values taken from default's craftitems.lua
local max_text_size = 10000
local max_title_size = 80
local short_title_size = 35
local lpp = 14

local generate_book = function(title, owner, text)
	local book = ItemStack("default:book_written")
	local meta = book:get_meta()
	
	meta:set_string("title", title:sub(1, max_title_size))
	meta:set_string("owner", owner)
	local short_title = title
	-- Don't bother trimming the title if the trailing dots would make it longer
	if #short_title > short_title_size + 3 then
		short_title = short_title:sub(1, short_title_size) .. "..."
	end
	meta:set_string("description", S("@1 by @2", short_title, owner))
	text = text:sub(1, max_text_size)
	text = text:gsub("\r\n", "\n"):gsub("\r", "\n")
	meta:set_string("text", text)
	meta:set_int("page", 1)
	meta:set_int("page_max", math.ceil((#text:gsub("[^\n]", "") + 1) / lpp))
	
	return book
end

---------------------------------------------------------------------------
-- Commoditymarket ledgers

if minetest.get_modpath("commoditymarket") then
--{item=item, quantity=quantity, price=price, purchaser=purchaser, seller=seller, timestamp = minetest.get_gametime()}
local log_to_string = function(log_entry, market)
	local anonymous = market.def.anonymous
	local purchaser = log_entry.purchaser
	local seller = log_entry.seller
	local purchaser_name
	if purchaser == seller then
		purchaser_name = S("themself")
	elseif anonymous then
		purchaser_name = S("someone")
	else
		purchaser_name = purchaser.name
	end
	local seller_name
	if anonymous then
		seller_name = S("someone")
	else
		seller_name = seller.name
	end
	
	local itemname = log_entry.item
	local item_def = minetest.registered_items[log_entry.item]
	if item_def then
		itemname = item_def.description:gsub("\n", " ")
	end

	return S("On day @1 @2 sold @3 @4 to @5 at @6@7 each for a total of @6@8.",
		math.ceil(log_entry.timestamp/86400), seller_name, log_entry.quantity, itemname,
		purchaser_name, market.def.currency_symbol, log_entry.price, log_entry.quantity*log_entry.price)
end

local get_log_strings = function(market, quantity)
	local accounts = market.player_accounts
	local all_logs = {}
	for player_name, account in pairs(accounts) do
		for _, log_entry in pairs(account.log) do
			table.insert(all_logs, log_entry)
		end
	end
	if #all_logs == 0 then
		return
	end
	table.sort(all_logs, function(log1, log2) return log1.timestamp > log2.timestamp end)
	local start_range = math.max(#all_logs, #all_logs - quantity)
	local start_point = math.random(start_range)
	local end_point = math.min(start_point+quantity, #all_logs)
	local out = {}
	local last_timestamp = all_logs[start_point].timestamp
	for i = start_point, end_point do
		table.insert(out, log_to_string(all_logs[i], market))
	end
	return out, last_timestamp
end

settlements.generate_ledger = function(market_name, town_name)
	local market = commoditymarket.registered_markets[market_name]
	if not market then
		return
	end
	local strings, last_timestamp = get_log_strings(market, math.random(5,15))
	if not strings then
		return
	end
	strings = table.concat(strings, "\n")
	local day = math.ceil(last_timestamp/86400)
	local title = S("@1 Ledger on Day @2", market.def.description, day)
	local author = S("@1's Clerk", town_name)
	return generate_book(title, author, strings)
end
end

--------------------------------------------------------------------------------
-- Travel guides

-- returns {pos, data}
local get_random_settlement_within_range = function(pos, range_max, range_min)
	range_min = range_min or 40 -- If no minimum provided, at least don't look within your own chunk
	if range_max <= range_min then
		return
	end
	local min_edge = vector.subtract(pos, range_max)
	local max_edge = vector.add(pos, range_max)
	local settlement_list = settlements.settlements_in_world:get_areas_in_area(min_edge, max_edge, true, true, true)
	local settlements_within_range = {}
	for id, settlement in pairs(settlement_list) do
		local target_pos = settlement.min
		local distance = vector.distance(pos, target_pos)
		if distance < range_max and distance > range_min then
			table.insert(settlements_within_range, {pos = target_pos, data = settlement.data})
		end
	end
	if #settlements_within_range == 0 then
		return
	end
	
	local target = settlements_within_range[math.random(#settlements_within_range)]
	target.data = minetest.deserialize(target.data)
	return target
end

local compass_dirs = {
    [0] = S("east"),
	S("northeast"),
    S("north"),
	S("northwest"),
    S("west"),
	S("southwest"),
    S("south"),
	S("southeast"),
}

local compass_direction = function(p1, p2)
	local dir = vector.subtract(p2, p1)
	--minetest.chat_send_all("dir " .. minetest.pos_to_string(dir))
	local angle = math.atan2(dir.z, dir.x);
	--minetest.chat_send_all("angle " .. angle)
	local octant = math.floor((8*angle/(2*math.pi)+8)%8 + 0.5)
	--minetest.chat_send_all("octant " .. octant)
	return compass_dirs[octant]
end

settlements.generate_travel_guide = function(source_pos, source_name)
	local range = math.random(1000, 5000)
	local target = get_random_settlement_within_range(source_pos, range)
	if not target then
		return
	end
	local target_name = target.data.name

	local title = S("A travel guide to @1", target_name)
	local author = S("A resident of @1", source_name)

	local dir = compass_direction(source_pos, target.pos)
	local distance = vector.distance(source_pos, target.pos)
	local kilometers = string.format("%.1f", distance/1000)
	
	local text = S("@1 kilometers to the @2 of @3 lies the settlement of @4.", kilometers, dir, source_name, target_name)
	return generate_book(title, author, text)
end
