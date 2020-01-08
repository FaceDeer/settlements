if not minetest.settings:get_bool("settlements_show_in_hud", true) then
	return
end

local discovery_range = tonumber(minetest.settings:get("settlements_discovery_range")) or 15 
local visual_range = tonumber(minetest.settings:get("settlements_visibility_range")) or 300
local test_interval = 5 -- check every test_interval seconds
local displacement = {x=5, y=3, z=5} -- needed to put the marker in the center of town hall

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

local remove_distant_hud_markers = function(visual_range)
	local players_to_remove = {}
	for player_name, waypoints in pairs(player_huds) do
		local player = minetest.get_player_by_name(player_name)
		if player then
			local player_pos = player:get_pos()
			local waypoints_to_remove = {}
			for pos_hash, hud_id in pairs(waypoints) do
				local pos = minetest.get_position_from_hash(pos_hash)
				if vector.distance(pos, player_pos) > visual_range then
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
	
	-- TODO use areastore for efficiency
	local connected_players = minetest.get_connected_players()
	local new_discovery = false
	for _, player in ipairs(connected_players) do
		local player_pos = player:get_pos()
		local player_name = player:get_player_name()
		for _, settlement in ipairs(settlements.settlements_in_world) do
			local discovered_by = settlement.discovered_by
			local settlement_pos = vector.add(settlement.pos, displacement)
			local distance = vector.distance(player_pos, settlement_pos)
			if distance < discovery_range and not discovered_by[player_name] then
				discovered_by[player_name] = true
				new_discovery = true
				local discovery_note = "You've discovered " .. (settlement.name or "a settlement") .. "!"
				local formspec = "size[4,1]" ..
					"label[1.0,0.0;" .. minetest.formspec_escape(discovery_note) ..
					"]button_exit[0.5,0.75;3,0.5;btn_ok;".. "OK" .."]"				
				minetest.show_formspec(player_name, "settlements:discovery_popup",
					formspec)
				minetest.chat_send_player(player_name, discovery_note)
				minetest.sound_play({name = "settlements_chime01", gain = 0.25}, {to_player=player_name})
			end
			if not found_visible and distance < visual_range and discovered_by[player_name] then
				local settlement_name = settlement.name or "Town"
				add_hud_marker(player, player_name, settlement_pos, settlement_name)
			end			
		end
	end
	remove_distant_hud_markers(visual_range)
	if new_discovery then
		settlements.settlements_save()
	end
end)

minetest.register_chatcommand("settlements_list", {
	decription = "List the settlements you know about",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local player_pos = player:get_pos()
		for _, settlement in ipairs(settlements.settlements_in_world) do
			if settlement.discovered_by[name] then
				local distance = math.floor(vector.distance(player_pos, settlement.pos))
				local settlement_name = settlement.name or "Town"
				minetest.chat_send_player(name, 
					settlement_name	.. " is located " .. distance ..
					"m away at " .. minetest.pos_to_string(settlement.pos))
			end
		end
	end,
})

minetest.register_chatcommand("settlements_discover", {
	decription = "Set all settlements as known",
	param = "player_name, or nothing for yourself",
	privs = {["server"]=true},
	func = function(name, param)
		if param ~= "" then
			name = param
		end
		for _, settlement in ipairs(settlements.settlements_in_world) do
			settlement.discovered_by[name] = true
		end
		settlements.settlements_save()
	end,
})

minetest.register_chatcommand("settlements_undiscover", {
	decription = "Set all settlements as unknown to you",
	param = "player_name, or nothing for yourself",
	privs = {["server"]=true},
	func = function(name, param)
		if param ~= "" then
			name = param
		end
		for _, settlement in ipairs(settlements.settlements_in_world) do
			settlement.discovered_by[name] = nil
		end
		settlements.settlements_save()
	end,
})