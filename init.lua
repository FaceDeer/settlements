settlements = {}

-- switch for debugging
settlements.debug = false

settlements.half_map_chunk_size = 40

settlements.surface_materials = {}
settlements.settlement_defs = {}

-- Minimum distance between settlements
settlements.min_dist_settlements = tonumber(minetest.settings:get("settlements_minimum_distance_between_settlements")) or 500
-- maximum allowed difference in height for building a settlement
settlements.max_height_difference = tonumber(minetest.settings:get("settlements_maximum_height_difference")) or 10

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/buildings.lua")
dofile(modpath.."/hud.lua")
dofile(modpath.."/bookgen.lua")

settlements.register_settlement = function(settlement_type_name, settlement_def)
	assert(not settlements.settlement_defs[settlement_type_name])
	settlements.settlement_defs[settlement_type_name] = settlement_def
	for _, material in ipairs(settlement_def.surface_materials) do
		local c_mat = minetest.get_content_id(material)
		local material_list = settlements.surface_materials[c_mat] or {}
		settlements.surface_materials[c_mat] = material_list
		table.insert(material_list, settlement_def)
	end
end

-- Interconverting lua and mts formatted schematics
-- Useful for modders adding existing schematics that are in mts format
function settlements.convert_mts_to_lua(schem_path)
	local str = minetest.serialize_schematic(schem_path, "lua", {lua_use_comments = true})
	local file = io.open(schem_path:sub(1,-4).."lua", "w")
	file:write(str.."\nreturn schematic")
	file:close()
end

function settlements.mts_save()

	local schematic2 = dofile(schem_path.."kingsmarket.lua")
	local seb = minetest.serialize_schematic(schematic2, "mts", {})
	local filename = schem_path .. "kingsmarket.mts"
	--filename = filename:gsub("\"", "\\\""):gsub("\\", "\\\\")
	local file, err = io.open(filename, "wb")
	if err == nil and seb then
		file:write(seb)
		file:flush()
		file:close()
	end
	print("Wrote: " .. filename)
end

dofile(modpath.."/default_settlements.lua")

----------------------------------------------------------------------------

-- load list of generated settlements
local function settlements_load()
	local file = io.open(minetest.get_worldpath().."/settlements.txt", "r")
	if file then
		local settlements = minetest.deserialize(file:read("*all"))
		if type(settlements) == "table" then
			for _, settlement in ipairs(settlements) do
				-- compatibility with older versions
				if settlement.x ~= nil then
					settlement.pos = vector.new(settlement)
					settlement.x = nil
					settlement.y = nil
					settlement.z = nil
				end
				if settlement.name == nil and minetest.get_modpath("namegen") then
					settlement.name = namegen.generate("settlement_towns")
				end
				if settlement.discovered_by == nil then
					settlement.discovered_by = {}
				end
			end
			return settlements
		end
	end
	return {}
end
settlements.settlements_in_world = settlements_load()

-- register block for npc spawn
local function deep_copy(table_in)
	local table_out = {}
	for index, value in pairs(table_in) do
		if type(value) == "table" then
			table_out[index] = deep_copy(value)
		else
			table_out[index] = value
		end
	end
	return table_out
end

local junglewood_def = deep_copy(minetest.registered_nodes["default:junglewood"])
minetest.register_node("settlements:junglewood", junglewood_def)
-- register inhabitants
if minetest.get_modpath("mobs_npc") ~= nil then
	mobs:register_spawn("mobs_npc:npc", --name
		{"settlements:junglewood"}, --nodes
		20, --max_light
		0, --min_light
		20, --chance
		2, --active_object_count
		31000, --max_height
		nil) --day_toggle
	mobs:register_spawn("mobs_npc:trader", --name
		{"settlements:junglewood"}, --nodes
		20, --max_light
		0, --min_light
		20, --chance
		2, --active_object_count
		31000, --max_height
		nil)--day_toggle
end


-------------------------------------------------------------------------------
-- check distance to other settlements
-------------------------------------------------------------------------------
local function check_distance_other_settlements(center_new_chunk)
--	local min_dist_settlements = 300
	for i, settlement in ipairs(settlements.settlements_in_world) do
		local distance = vector.distance(center_new_chunk, settlement.pos)
--		minetest.chat_send_all("dist ".. distance)
		if distance < settlements.min_dist_settlements then
			return false
		end
	end	
	return true
end

-------------------------------------------------------------------------------
-- evaluate heightmap
-------------------------------------------------------------------------------
local function evaluate_heightmap(heightmap)
	-- max height and min height, initialize with impossible values for easier first time setting
	local max_y = -50000
	local min_y = 50000
	-- only evaluate the center square of heightmap 40 x 40
	local square_start = 1621
	local square_end = 1661
	for j = 1 , 40, 1 do
		for i = square_start, square_end, 1 do
			-- skip buggy heightmaps, return high value
			if heightmap[i] == -31000 or
			heightmap[i] == 31000
			then
				return settlements.max_height_difference + 1
			end
			if heightmap[i] < min_y
			then
				min_y = heightmap[i]
			end
			if heightmap[i] > max_y
			then
				max_y = heightmap[i]
			end
		end
		-- set next line
		square_start = square_start + 80
		square_end = square_end + 80
	end
	-- return the difference between highest and lowest pos in chunk
	local height_diff = max_y - min_y
	-- filter buggy heightmaps
	if height_diff <= 1
	then
		return settlements.max_height_difference + 1
	end
	-- debug info
	if settlements.debug == true
	then
		minetest.chat_send_all("heightdiff ".. height_diff)
	end
	return height_diff
end

local half_map_chunk_size = settlements.half_map_chunk_size

minetest.register_on_generated(function(minp, maxp)
	-- don't build settlement underground
	if maxp.y < -100 then
		return
	end

	-- don't build settlements too close to each other
	local center_of_chunk = vector.subtract(maxp, half_map_chunk_size)
	local dist_ok = check_distance_other_settlements(center_of_chunk)
	if dist_ok == false
	then
		return
	end

	-- don't build settlements on (too) uneven terrain
	local heightmap = minetest.get_mapgen_object("heightmap")
	local height_difference = evaluate_heightmap(heightmap)
	if height_difference > settlements.max_height_difference
	then
		return
	end
	
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local va = VoxelArea:new{MinEdge=emin, MaxEdge=emax}

	settlements.generate_settlement_vm(vm, va, minp, maxp)
end)


local debug_building_index = 0
local c_dirt_with_grass				= minetest.get_content_id("default:dirt_with_grass")
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

-- manually place buildings, for debugging only
minetest.register_craftitem("settlements:tool", {
	description = "settlements build tool",
	inventory_image = "default_tool_woodshovel.png",
	-- build single house
	on_use = function(itemstack, placer, pointed_thing)
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
			minetest.chat_send_player(placer:get_player_name(), "Built " .. selected_building.name)
			vm:write_to_map()

		end
	end,
	-- build settlement
	on_place = function(itemstack, placer, pointed_thing)
		-- enable debug routines
		settlements.debug = true
		local center_surface = pointed_thing.under
		if center_surface then
			local minp = vector.subtract(center_surface, half_map_chunk_size)
			local maxp = vector.add(center_surface, half_map_chunk_size)
			
			local start_time = os.time()

			settlements.generate_settlement(minp, maxp)

			local end_time = os.time()
			minetest.chat_send_all("Time ".. end_time - start_time)
		end
	end
})