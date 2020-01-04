settlements = {}

-- switch for debugging
settlements.debug = false

-- Minimum distance between settlements
settlements.min_dist_settlements = tonumber(minetest.settings:get("settlements_minimum_distance_between_settlements")) or 500
-- maximum allowed difference in height for building a settlement
settlements.max_height_difference = tonumber(minetest.settings:get("settlements_maximum_height_difference")) or 10

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/const.lua")
dofile(modpath.."/buildings.lua")

local half_map_chunk_size = settlements.half_map_chunk_size
local schematic_table = settlements.schematic_table

-- load list of generated settlements
local function settlements_load()
	local file = io.open(minetest.get_worldpath().."/settlements.txt", "r")
	if file then
		local table = minetest.deserialize(file:read("*all"))
		if type(table) == "table" then
			return table
		end
	end
	return {}
end
settlements.settlements_in_world = settlements_load()

-- register block for npc spawn
local junglewood_def = minetest.registered_nodes["default:junglewood"]
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
	for i, pos in ipairs(settlements.settlements_in_world) do 
		local distance = vector.distance(center_new_chunk, pos)
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


minetest.register_on_generated(function(minp, maxp)
	-- randomly try to build settlements
	if math.random() > 0.6 then
		return
	end

	-- don't build settlement underground
	if maxp.y < 0 then 
		return 
	end

	-- don't build settlements too close to each other
	local center_of_chunk = { 
		x=maxp.x-half_map_chunk_size, 
		y=maxp.y-half_map_chunk_size, 
		z=maxp.z-half_map_chunk_size
	} 
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
	-- 
	-- if no hard showstoppers prevent the settlement -> try to do it (check for suitable terrain)
	
	-- waiting necessary for chunk to load, otherwise, townhall is not in the middle, no map found behind townhall
	minetest.after(3, function()
		settlements.generate_settlement(minp, maxp)
	end)
end)
--
-- manually place buildings, for debugging only
--
minetest.register_craftitem("settlements:tool", {
	description = "settlements build tool",
	inventory_image = "default_tool_woodshovel.png",
	--
	-- build single house
	--
--		on_use = function(itemstack, placer, pointed_thing)
--			local center_surface = pointed_thing.under
--			if center_surface then
--				local building_all_info = {name = "blacksmith", 
--					mts = schem_path.."blacksmith.mts", 
--					hsize = 13, 
--					max_num = 0.9, 
--					rplc = "n"}
--				settlements.build_schematic(center_surface, 
--					building_all_info["mts"],
--					building_all_info["rplc"], 
--					building_all_info["name"])
--			end
--		end,
	--
	-- build ssettlement
	--
	on_place = function(itemstack, placer, pointed_thing)
		-- enable debug routines
		settlements.debug = true
		local center_surface = pointed_thing.under
		if center_surface then
			local minp = {
				x=center_surface.x-half_map_chunk_size, 
				y=center_surface.y-half_map_chunk_size, 
				z=center_surface.z-half_map_chunk_size
			}
			local maxp = {
				x=center_surface.x+half_map_chunk_size, 
				y=center_surface.y+half_map_chunk_size, 
				z=center_surface.z+half_map_chunk_size
			}
			
			local start_time = os.time()

			settlements.generate_settlement(minp, maxp)

			local end_time = os.time()
			minetest.chat_send_all("Zeit ".. end_time - start_time)
		end
	end
})

--settlements.mts_save()