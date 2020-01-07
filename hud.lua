if not minetest.settings:get_bool("settlements_show_in_hud", true) then
	return
end

local discovery_range = tonumber(minetest.settings:get("settlements_discovery_range")) or 10 
local visual_range = tonumber(minetest.settings:get("settlements_visibility_range")) or 200

local player_huds = {} -- tracks only a single waypoint per player, if we want to show more will need revision
local add_hud_marker = function(player, player_name, pos, label)
	local existing_id = player_huds[player_name]
	if existing_id ~= nil then
		player:hud_change(existing_id, "name", label)
		player:hud_change(existing_id, "world_pos", pos)
	else
		local hud_id = player:hud_add({
			hud_elem_type = "waypoint",
			name = label,
			text = "m",
			number = 0xFFFFFF,
			world_pos = pos})
		player_huds[player_name] = hud_id
	end
end
local remove_hud_marker = function(player, player_name)
	local id = player_huds[player_name]
	if id ~= nil then
		player:hud_remove(id)
		player_huds[player_name] = nil
	end
end

local elapsed = 0
local displacement = {x=5, y=3, z=5}
minetest.register_globalstep(function(dtime)
	elapsed = elapsed + dtime
	if elapsed < 5 then
		return
	end
	elapsed = 0
	
	-- TODO use areastore for efficiency
	local connected_players = minetest.get_connected_players()
	local new_discovery = false
	for _, player in ipairs(connected_players) do
		local player_pos = player:get_pos()
		local player_name = player:get_player_name()
		local found_visible = false
		for _, settlement in ipairs(settlements.settlements_in_world) do
			local discovered_by = settlement.discovered_by
			local settlement_pos = vector.add(settlement.pos, displacement)
			local distance = vector.distance(player_pos, settlement_pos)
			if distance < discovery_range and not discovered_by[player_name] then
				discovered_by[player_name] = true
				new_discovery = true
			end
			if not found_visible and distance < visual_range and discovered_by[player_name] then
				local settlement_name = settlement.name or "Town"
				add_hud_marker(player, player_name, settlement_pos, settlement_name)
				found_visible = true		
			end			
		end
		if not found_visible then
			remove_hud_marker(player, player_name)
		end
	end
	if new_discovery then
		settlements.settlements_save()
	end
end)

minetest.register_chatcommand("settlements", {
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

minetest.register_chatcommand("discoversettlements", {
	decription = "Set all settlements as known to you",
	privs = {["server"]=true},
	func = function(name, param)
		for _, settlement in ipairs(settlements.settlements_in_world) do
			settlement.discovered_by[name] = true
		end
		settlements.settlements_save()
	end,
})