settlements = {}

-- switch for debugging
settlements.debug = false

-- Minimum distance between settlements
settlements.min_dist_settlements = tonumber(minetest.settings:get("settlements_minimum_distance_between_settlements")) or 500
-- maximum allowed difference in height for building a settlement
settlements.max_height_difference = tonumber(minetest.settings:get("settlements_maximum_height_difference")) or 10

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/const.lua")
dofile(modpath.."/utils.lua")
dofile(modpath.."/foundation.lua")
dofile(modpath.."/buildings.lua")
dofile(modpath.."/paths.lua")

local half_map_chunk_size = settlements.half_map_chunk_size

--
-- load settlements on server
--
-------------------------------------------------------------------------------
-- load list of generated settlements
-------------------------------------------------------------------------------
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
--
-- register inhabitants
--
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
--
-- on map generation, try to build a settlement
--

local generate_settlement = function(minp, maxp)
	local vm = minetest.get_voxel_manip()
	local emin, emax = vm:read_from_map(minp, maxp)
	local va = VoxelArea:new{
		MinEdge = emin,
		MaxEdge = emax
	}
	local data = vm:get_data()
	
	local settlement_info = settlements.create_site_plan(maxp, minp, data, va)
	if not settlement_info
	then
		return
	end
	--
	-- evaluate settlement_info and prepare terrain
	--
	settlements.terraform(data, va, settlement_info)

	--
	-- evaluate settlement_info and build paths between buildings
	--
	settlements.paths(minp, data, va, settlement_info)
	--
	-- evaluate settlement_info and place schematics
	--
	vm:set_data(data)
	settlements.place_schematics(vm, settlement_info)
	vm:write_to_map(true)
	--
	-- evaluate settlement_info and initialize furnaces and chests
	--
	settlements.initialize_nodes(settlement_info)
end


minetest.register_on_generated(function(minp, maxp)
	--
	-- needed for manual and automated settlement building
	--
	local heightmap = minetest.get_mapgen_object("heightmap")
	--
	-- randomly try to build settlements
	-- 
	if math.random(1,10)>6 then
		return
	end
	--
	-- don't build settlement underground
	--
	if maxp.y < 0 then 
		return 
	end
	--
	-- don't build settlements too close to each other
	--
	local center_of_chunk = { 
		x=maxp.x-half_map_chunk_size, 
		y=maxp.y-half_map_chunk_size, 
		z=maxp.z-half_map_chunk_size
	} 
	local dist_ok = settlements.check_distance_other_settlements(center_of_chunk)
	if dist_ok == false 
	then
		return
	end
	--
	-- don't build settlements on (too) uneven terrain
	--
	local height_difference = settlements.evaluate_heightmap(heightmap)
	if height_difference > settlements.max_height_difference 
	then
		return
	end
	-- 
	-- if no hard showstoppers prevent the settlement -> try to do it (check for suitable terrain)
	
	-- waiting necessary for chunk to load, otherwise, townhall is not in the middle, no map found behind townhall
	minetest.after(3, function()
		generate_settlement(minp, maxp)
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

			generate_settlement(minp, maxp)

			local end_time = os.time()
			minetest.chat_send_all("Zeit ".. end_time - start_time)
		end
	end
})

--settlements.mts_save()