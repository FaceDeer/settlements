local worldpath = minetest.get_worldpath()
local areastore_filename = worldpath.."/settlements_areastore.txt"

-- internationalization boilerplate
local S, NS = settlements.S, settlements.NS

-- needed due to circular dependency - this mod gets loaded before settlements_medieval does
local delayed_medieval_village_rename = function()
	local settlement_def = settlements.registered_settlements["medieval"]
	if not settlement_def then
		return
	end
	local settlement_list = settlements.settlements_in_world:get_areas_in_area(
		{x=-32000, y=-32000, z=-32000}, {x=32000, y=32000, z=32000}, true, true, true)
	for id, settlement in pairs(settlement_list) do
		local data = minetest.deserialize(settlement.data)
		if data.settlement_type == "medieval" then
			local pos = settlement.min
			local oldname = data.name
			data.name = settlement_def.generate_name(pos)
			minetest.log("action", "[settlements] Renamed " .. oldname .. " to " .. data.name)
			settlements.settlements_in_world:remove_area(id)
			settlements.settlements_in_world:insert_area(pos, pos, minetest.serialize(data), id)
		end
		settlements.settlements_save()
		settlements.remove_all_hud_markers()
	end
end

-- load list of generated settlements
local function settlements_load()
	local area_file = io.open(areastore_filename, "r")

	-- Compatibility with old versions
	local old_file = io.open(worldpath.."/settlements.txt", "r")
	if old_file and not area_file then
		local settlements = minetest.deserialize(old_file:read("*all"))
		if type(settlements) == "table" then
			local areastore = AreaStore()
			for _, pos in ipairs(settlements) do
				pos = vector.add(pos, {x=5, y=0, z=5}) -- Shift it over to put it in the center of town hall
				local name = S("Town")
				local discovered_by = {}
				local settlement_type = "medieval"
				areastore:insert_area(pos, pos, minetest.serialize({name=name, discovered_by=discovered_by,settlement_type=settlement_type}))
			end
			minetest.after(5, delayed_medieval_village_rename)
			return areastore
		end
	end
	------------------------------------
	--end compatibility block
	local areastore = AreaStore()
	if not area_file then
		return areastore
	end
	areastore:from_file(areastore_filename)
	return areastore
end
settlements.settlements_in_world = settlements_load()

-- save list of generated settlements
function settlements.settlements_save()
	settlements.settlements_in_world:to_file(areastore_filename)
end
