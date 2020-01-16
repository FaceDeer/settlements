-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-----------------------------------------------------------------------------
-- Admin tools

local half_map_chunk_size = settlements.half_map_chunk_size

-- manually place buildings, for debugging only
minetest.register_craftitem("settlements:settlement_tool", {
	description = S("Settlements build tool"),
	inventory_image = "settlements_settlement_marker.png",
	-- build settlement
	on_use = function(itemstack, placer, pointed_thing)
		local player_name = placer:get_player_name()
		if not minetest.check_player_privs(placer, "server") then
			minetest.chat_send_player(player_name, S("You need the server privilege to use this tool."))
			return
		end	

		local center_surface = pointed_thing.under
		if center_surface then
			local minp = vector.subtract(center_surface, half_map_chunk_size)
			local maxp = vector.add(center_surface, half_map_chunk_size)
			if settlements.generate_settlement(vector.subtract(minp,16), vector.add(maxp,16)) then -- add borders to simulate mapgen borders
				minetest.chat_send_player(player_name, S("Created new settlement at @1", minetest.pos_to_string(center_surface)))
			else
				minetest.chat_send_player(player_name, S("Unable to create new settlement at @1", minetest.pos_to_string(center_surface)))
			end
		end
	end,
})

local debug_building_index = 0
local c_dirt_with_grass	= minetest.get_content_id("default:dirt_with_grass")
local all_schematics
local function get_next_debug_building()
	if not all_schematics then
		all_schematics = {}
		for _, settlement_def in pairs(settlements.settlement_defs) do
			for _, building_info in ipairs(settlement_def.schematics) do
				table.insert(all_schematics, building_info)
			end
		end
	end
	debug_building_index = debug_building_index + 1
	if debug_building_index > #all_schematics then
		debug_building_index = 1
	end
	return all_schematics[debug_building_index]
end

minetest.register_craftitem("settlements:single_building_tool", {
	description = S("Settlements single building tool"),
	inventory_image = "settlements_building_marker.png",
	-- build single house
	on_use = function(itemstack, placer, pointed_thing)
		if not minetest.check_player_privs(placer, "server") then
			minetest.chat_send_player(placer:get_player_name(), S("You need the server privilege to use this tool."))
			return
		end	
	
		local center_surface = pointed_thing.under
		if center_surface then
			local selected_building = get_next_debug_building()
			local built_house = {}
			built_house.schematic_info = selected_building
			built_house.center_pos = center_surface -- we're not terraforming so this doesn't matter
			built_house.build_pos_min = center_surface
			built_house.rotation = "0"
			built_house.surface_mat = c_dirt_with_grass
			
			local vm = minetest.get_voxel_manip()
			local maxp = vector.add(center_surface, selected_building.schematic.size)
			local emin, emax = vm:read_from_map(center_surface, maxp)

			settlements.place_building(vm, built_house, {def={}})
			minetest.chat_send_player(placer:get_player_name(), S("Built @1", selected_building.name))
			vm:write_to_map()
		end
	end,
})
