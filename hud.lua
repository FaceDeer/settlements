if not minetest.settings:get_bool("settlements_show_in_hud", true) then
	return
end

local requires_mappingkit = minetest.settings:get_bool("settlements_hud_requires_mapping_kit", true)
	and minetest.registered_items["map:mapping_kit"] -- rather than test for the map modpath, test whether the mapping_kit has been registered.

local discovery_range = tonumber(minetest.settings:get("settlements_discovery_range")) or 30
local visual_range = tonumber(minetest.settings:get("settlements_visibility_range")) or 600
local test_interval = 5 -- check every test_interval seconds

local player_huds = {}
-- Each player will have a table of [position_hash] = hud_id pairs in here

local add_hud_marker = function(player, player_name, pos, label)
	local waypoints = player_huds[player_name] or {}
	player_huds[player_name] = waypoints
	local pos_hash = minetest.hash_node_position(pos)
	if waypoints[pos_hash] then
		return
	end	
	local hud_id = player:hud_add({
		hud_elem_type = "waypoint",
		name = label,
		text = "m",
		number = 0xFFFFFF,
		world_pos = pos})
	waypoints[pos_hash] = hud_id
end

local remove_distant_hud_markers = function()
	local players_to_remove = {}
	for player_name, waypoints in pairs(player_huds) do
		local player = minetest.get_player_by_name(player_name)
		if player then
			local has_map = (not requires_mappingkit) or (player:get_inventory():contains_item("main", "map:mapping_kit"))
			local player_pos = player:get_pos()
			local waypoints_to_remove = {}
			for pos_hash, hud_id in pairs(waypoints) do
				local pos = minetest.get_position_from_hash(pos_hash)
				if (not has_map) or vector.distance(pos, player_pos) > visual_range then
					table.insert(waypoints_to_remove, pos_hash)
					player:hud_remove(hud_id)
				end
			end
			for _, pos_hash in ipairs(waypoints_to_remove) do
				waypoints[pos_hash] = nil
			end
			if not next(waypoints) then -- player's waypoint list is empty, remove it
				table.insert(players_to_remove, player_name)
			end
		else
			table.insert(players_to_remove, player_name)
		end
	end
	for _, player_name in ipairs(players_to_remove) do
		player_huds[player_name] = nil
	end
end

local elapsed = 0
minetest.register_globalstep(function(dtime)
	elapsed = elapsed + dtime
	if elapsed < test_interval then
		return
	end
	elapsed = 0
	
	local connected_players = minetest.get_connected_players()
	local new_discovery = false
	for _, player in ipairs(connected_players) do
		local player_pos = player:get_pos()
		local player_name = player:get_player_name()
		
		local min_visual_edge = vector.subtract(player_pos, visual_range)
		local max_visual_edge = vector.add(player_pos, visual_range)
		local visual_settlements = settlements.settlements_in_world:get_areas_in_area(min_visual_edge, max_visual_edge, true, true, true)		
		for id, settlement in pairs(visual_settlements) do
		
			local data = minetest.deserialize(settlement.data)
			local distance = vector.distance(player_pos, settlement.min)
			local discovered_by = data.discovered_by
			local settlement_pos = vector.add(settlement.min, {x=0, y=2, z=0})
	
			if distance < discovery_range and not discovered_by[player_name] then
				-- Update areastore
				data.discovered_by[player_name] = true
				settlements.settlements_in_world:remove_area(id)
				settlements.settlements_in_world:insert_area(settlement.min, settlement.min, minetest.serialize(data), id)
				
				-- Mark that we'll need to save settlements
				new_discovery = true
				
				-- Notify player of their find
				local note_name = data.name or "a settlement"
				local discovery_note = "You've discovered " .. note_name .. "!"
				local formspec = "size[4,1]" ..
					"label[1.0,0.0;" .. minetest.formspec_escape(discovery_note) ..
					"]button_exit[0.5,0.75;3,0.5;btn_ok;".. "OK" .."]"				
				minetest.show_formspec(player_name, "settlements:discovery_popup",
					formspec)
				minetest.chat_send_player(player_name, discovery_note)
				minetest.log("action", "[settlements] " .. player_name .. " discovered " .. note_name)
				minetest.sound_play({name = "settlements_chime01", gain = 0.25}, {to_player=player_name})
			end

			local has_map = (not requires_mappingkit) or (player:get_inventory():contains_item("main", "map:mapping_kit"))
			if has_map and distance < visual_range and discovered_by[player_name] then
				local settlement_name = data.name or "Town"
				add_hud_marker(player, player_name, settlement_pos, settlement_name)
			end
		end
	end
	remove_distant_hud_markers()

	if new_discovery then
		settlements.settlements_save()
	end
end)

----------------------------------------------------------------------------------------------------------
-- Name-related chat commands

minetest.register_chatcommand("settlements_list", {
	description = "List the settlements you know about",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local player_pos = player:get_pos()
		
		local settlement_list = settlements.settlements_in_world:get_areas_in_area(
			{x=-32000, y=-32000, z=-32000}, {x=32000, y=32000, z=32000}, true, true, true)
		
		for _, settlement in pairs(settlement_list) do
			local data = minetest.deserialize(settlement.data)
			if data.discovered_by[name] then
				local pos = settlement.min
				local distance = math.floor(vector.distance(player_pos, pos))
				local settlement_name = data.name or "Town"
				minetest.chat_send_player(name, 
					settlement_name	.. " is located " .. distance ..
					"m away at " .. minetest.pos_to_string(pos))
			end
		end
	end,
})

local function set_all_discovered(player_name, state)
	local settlement_list = settlements.settlements_in_world:get_areas_in_area(
		{x=-32000, y=-32000, z=-32000}, {x=32000, y=32000, z=32000}, true, true, true)
	for id, settlement in pairs(settlement_list) do
		local data = minetest.deserialize(settlement.data)
		data.discovered_by[player_name] = state
		settlements.settlements_in_world:remove_area(id)
		settlements.settlements_in_world:insert_area(settlement.min, settlement.min, minetest.serialize(data), id)
	end
	settlements.settlements_save()
end

minetest.register_chatcommand("settlements_discover_all", {
	description = "Set all settlements as known",
	param = "player_name, or nothing for yourself",
	privs = {["server"]=true},
	func = function(name, param)
		if param ~= "" then
			name = param
		end
		set_all_discovered(name, true)
	end,
})

minetest.register_chatcommand("settlements_undiscover_all", {
	description = "Set all settlements as unknown to you or another player",
	param = "player_name, or nothing for yourself",
	privs = {["server"]=true},
	func = function(name, param)
		if param ~= "" then
			name = param
		end
		set_all_discovered(name, nil)
	end,
})

minetest.register_chatcommand("settlements_rename_nearest", {
	description = "Change the name of the nearest settlement within visible range",
	param = "The new name for this settlement, or nothing to generate a new random name",
	privs = {["server"]=true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local player_pos = player:get_pos()
		
		local min_visual_edge = vector.subtract(player_pos, visual_range)
		local max_visual_edge = vector.add(player_pos, visual_range)
		local visual_settlements = settlements.settlements_in_world:get_areas_in_area(min_visual_edge, max_visual_edge, true, true, true)
		
		local min_dist = visual_range + 1 -- start with number beyond range
		local min_id = nil
		local min_data = nil
		local min_pos = nil
		for id, settlement in pairs(visual_settlements) do
			local data = minetest.deserialize(settlement.data)
			local distance = vector.distance(player_pos, settlement.min)
			if distance < min_dist and data.discovered_by[name] then
				min_dist = distance
				min_id = id	
				min_data = data
				min_pos = settlement.min
			end
		end
		
		if min_id ~= nil then
			if param == "" then
				local def = settlements.settlement_defs[min_data.settlement_type]
				if not def then
					minetest.chat_send_player(name, "Missing settlement definition for " .. min_data.settlement_type)
					return
				end
				param = def.generate_name(min_pos)
			end
			local oldname = min_data.name
			min_data.name = param
			settlements.settlements_in_world:remove_area(min_id)
			settlements.settlements_in_world:insert_area(min_pos, min_pos, minetest.serialize(min_data), min_id)
			settlements.settlements_save()
			minetest.log("action", "[settlements] Renamed " .. oldname .. " to " .. param)
			minetest.chat_send_player(name, "Settlement successfully renamed from " .. oldname .. " to " .. param .. "."
				.." Existing HUD waypoints for nearby players won't update until they go out of range and the"
				.." waypoint is recreated again.")
			return
		end
		
		minetest.chat_send_player(name, "No known settlements within visual distance found.")
	end,
})

minetest.register_chatcommand("settlements_regenerate_names_for_type", {
	description = "Regenerate the names for all settments of a particular type",
	param = "The settlement type",
	privs = {["server"]=true},
	func = function(name, param)
		if param == "" then
			minetest.chat_send_player(name, "A non-empty parameter is required")
			return
		end
		local settlement_def = settlements.settlement_defs[param]
		if not settlement_def then
			minetest.chat_send_player(name, "Unrecognized settlement type")
			return
		end

		local settlement_list = settlements.settlements_in_world:get_areas_in_area(
			{x=-32000, y=-32000, z=-32000}, {x=32000, y=32000, z=32000}, true, true, true)
		for id, settlement in pairs(settlement_list) do
			local data = minetest.deserialize(settlement.data)
			if data.settlement_type == param then
				local pos = settlement.min
				local oldname = data.name
				data.name = settlement_def.generate_name(pos)
				local announcement = "Renamed " .. oldname .. " to " .. data.name
				minetest.chat_send_player(name, announcement)
				minetest.log("action", "[settlements] " .. announcement)
				settlements.settlements_in_world:remove_area(id)
				settlements.settlements_in_world:insert_area(pos, pos, minetest.serialize(data), id)
			end
		end
		settlements.settlements_save()
	end,
})