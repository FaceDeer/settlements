local modpath = minetest.get_modpath(minetest.get_current_modname())

-- internationalization boilerplate
local S, NS = dofile(modpath.."/intllib.lua")

dofile(modpath.."/bookgen.lua")

----------------------------------------------------------------------------------------------------------------

local function fill_chest(pos)
	-- fill chest
	local inv = minetest.get_inventory( {type="node", pos=pos} )
	-- always
	inv:add_item("main", "default:apple "..math.random(1,3))
	-- low value items
	if math.random(0,1) < 1 then
		inv:add_item("main", "farming:bread "..math.random(0,3))
		inv:add_item("main", "default:steel_ingot "..math.random(0,3))
		-- additional fillings when farming mod enabled
		if minetest.get_modpath("farming") ~= nil and farming.mod == "redo" then
			if math.random(0,1) < 1 then
				inv:add_item("main", "farming:melon_slice "..math.random(0,3))
				inv:add_item("main", "farming:carrot "..math.random(0,3))
				inv:add_item("main", "farming:corn "..math.random(0,3))
			end
		end
	end
	-- medium value items
	if math.random(0,3) < 1 then
		inv:add_item("main", "default:pick_steel "..math.random(0,1))
		inv:add_item("main", "default:pick_bronze "..math.random(0,1))
		inv:add_item("main", "fire:flint_and_steel "..math.random(0,1))
		inv:add_item("main", "bucket:bucket_empty "..math.random(0,1))
		inv:add_item("main", "default:sword_steel "..math.random(0,1))
	end
end

local function fill_shelf(pos, town_name)
	-- TODO: more book types
	local callbacks = {}
	table.insert(callbacks, {func = settlements.generate_travel_guide, param1=pos, param2=town_name})
	if settlements.generate_ledger then
		table.insert(callbacks, {func = settlements.generate_ledger, param1="kings", param2=town_name})
	end

	local inv = minetest.get_inventory( {type="node", pos=pos} )
	for i = 1, math.random(2, 8) do
		local callback = callbacks[math.random(#callbacks)]
		local book = callback.func(callback.param1, callback.param2)
		if book then
			inv:add_item("books", book)
		end
	end
end

local initialize_node = function(pos, node, node_def, settlement_info)
	if settlement_info.name and node.name == "default:sign_wall_steel" then
		local meta = minetest.get_meta(pos)
		meta:set_string("text", S("@1 Town Hall", settlement_info.name))
		meta:set_string("infotext", S("@1 Town Hall", settlement_info.name))
	end
	-- when chest is found -> fill with stuff
	if node.name == "default:chest" then
		fill_chest(pos)
	end
	if node.name == "default:bookshelf" then
		fill_shelf(pos, settlement_info.name)
	end
	if minetest.get_item_group(node.name, "plant") > 0 then
		minetest.get_node_timer(pos):start(1000) -- start crops growing
	end
end

local schem_path = modpath.."/schematics/"

----------------------------------------------------------------------------------------

--settlements.convert_mts_to_lua(schem_path.."filename.mts")

if minetest.settings:get_bool("settlements_medieval", true) then

if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_towns.cfg"))
end

local townhall_schematic = {
	name = "townhall",
	schematic = dofile(schem_path.."townhall.lua"),
	buffer = 2, -- buffer space around the building, footprint is treated as radius max(size.x, size.z) + buffer for spacing purposes
	max_num = 0.1, -- This times the number of buildings in a settlement gives the maximum number of these buildings in a settlement.
					-- So for example, 0.1 means at most 1 of these buildings in a 10-building settlement and 2 in a 20-building settlement.
	replace_nodes_optional = true, -- If true, default:cobble will be replaced with a random wall material
	initialize_node = initialize_node, -- allows additional post-creation actions to be executed on schematic nodes once they're constructed
}
local kingsmarket_schematic = {
	name = "kingsmarket",
	schematic = dofile(schem_path.."kingsmarket.lua"),
	buffer = 1,
	max_num = 0.1,
	replace_nodes_optional = true,
	initialize_node = initialize_node,
}

-- list of schematics
local schematic_table = {
	{
		name = "well",
		schematic = dofile(schem_path.."well.lua"),
		buffer = 2,
		max_num = 0.045,
		height_adjust = -2, -- adjusts the y axis of where the schematic is built, to allow for "basement" stuff
	},
	{
		name = "hut",
		schematic = dofile(schem_path.."hut.lua"),
		buffer = 1,
		max_num = 0.9,
		replace_nodes_optional = true,
		initialize_node = initialize_node,
	},
	{
		name = "garden",
		schematic = dofile(schem_path.."garden.lua"),
		max_num = 0.1,
		initialize_node = initialize_node,
	},
	{
		name = "lamp",
		schematic = dofile(schem_path.."lamp.lua"),
		buffer = 3,
		max_num = 0.05,
	},
	{
		name = "tower",
		schematic = dofile(schem_path.."tower.lua"),
		buffer = 3,
		max_num = 0.055,
	},
	{
		name = "church",
		schematic = dofile(schem_path.."church.lua"),
		buffer = 2,
		max_num = 0.075,
	},
	{
		name = "blacksmith",
		schematic = dofile(schem_path.."blacksmith.lua"),
		buffer = 2,
		max_num = 0.050,
	},
	kingsmarket_schematic,
	{
		name = "nightmarket",
		schematic = dofile(schem_path.."nightmarket.lua"),
		buffer = 1,
		max_num = 0.025,
		replace_nodes_optional = true,
		initialize_node = initialize_node,
	},
}

local medieval_settlements = {
	-- this settlement will be placed on nodes with this surface material type.
	surface_materials = {
		"default:dirt",
		"default:dirt_with_grass",
		"default:dry_dirt_with_dry_grass",
		"default:dirt_with_snow",
		"default:dirt_with_dry_grass",
		"default:dirt_with_coniferous_litter",
		"default:sand",
		"default:silver_sand",
		"default:snow_block",
	},
	
	-- TODO: add a biome list. The tricky part here is, what if a biome list but not a surface materials list is provided?
	-- How to find the surface, and how to know what to replace surface material nodes with in the schematic?

	-- nodes in  all schematics will be replaced with these nodes, or a randomly-selected node
	-- from a list of choices if a list is provided
	replacements = {
		["default:junglewood"] = "settlements:junglewood",
	},
	
	-- Affected by per-building replace_nodes flag
	replacements_optional = {
		["default:cobble"] = {
			"default:junglewood", 
			"default:pine_wood", 
			"default:wood", 
			"default:aspen_wood", 
			"default:acacia_wood",	 
			"default:stonebrick", 
			"default:cobble", 
			"default:desert_stonebrick", 
			"default:desert_cobble", 
			"default:sandstone",
		},
	},
	
	-- This node will be replaced with the surface material of the location the building is placed on.
	replace_with_surface_material = "default:dirt_with_grass",
	
	-- Trees often interfere with surface detection. These nodes will be ignored when detecting surface level.
	ignore_surface_materials = {
		"default:tree",
		"default:jungletree",
		"default:pine_tree",
		"default:acacia_tree",
		"default:aspen_tree",
		"default:bush_stem",
		"default:bush_leaves",
		"default:acacia_bush_stem",
		"default:acacia_bush_leaves",
		"default:pine_bush_stem",
		"default:pine_bush_needles",
		"default:blueberry_bush_leaves_with_berries",
		"default:blueberry_bush_leaves",
	},
	
	platform_shallow = "default:dirt",
	platform_deep = "default:stone",
	path_material = "default:gravel",
	
	schematics = schematic_table,
	
	-- Select one of these to form the center of town. If not defined, one will be picked from the regular schematic table
	central_schematics = {
		townhall_schematic,
		kingsmarket_schematic,
	},
	
	building_count_min = 5,
	building_count_max = 25,
	
	altitude_min = 2,
	altitude_max = 300,
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("settlement_towns")
		end
		return "Town"
	end,
}

settlements.register_settlement("medieval", medieval_settlements)

local half_map_chunk_size = settlements.half_map_chunk_size
minetest.register_abm({
    label = "Settlement book authoring",
    nodenames = {"default:bookshelf"},
    interval = 86400, -- daily
    -- Operation interval in seconds
    chance = 2,
    -- Chance of triggering `action` per-node per-interval is 1.0 / this value
    catch_up = true,
    -- If true, catch-up behaviour is enabled: The `chance` value is
    -- temporarily reduced when returning to an area to simulate time lost
    -- by the area being unattended. Note that the `chance` value can often
    -- be reduced to 1.

    action = function(pos, node, active_object_count, active_object_count_wider)
		local inv = minetest.get_inventory( {type="node", pos=pos} )
		if not inv or not inv:room_for_item("books", "default:book_written") then
			return
		end
		
		local min_edge = vector.subtract(pos, half_map_chunk_size)
		local max_edge = vector.add(pos, half_map_chunk_size)
		local settlement_list = settlements.settlements_in_world:get_areas_in_area(min_edge, max_edge, true, true, true)
		local closest_settlement
		for id, settlement in pairs(settlement_list) do
			local target_pos = settlement.min
			if not closest_settlement or vector.distance(pos, target_pos) < vector.distance(pos, closest_settlement.pos) then
				closest_settlement = {pos = target_pos, data = settlement.data}
			end
		end
		
		if not closest_settlement then
			return
		end
		local data = minetest.deserialize(closest_settlement.data)
		local town_name = data.name
		
		-- TODO: more book types
		local callbacks = {}
		table.insert(callbacks, {func = settlements.generate_travel_guide, param1=closest_settlement.pos, param2=town_name})
		if settlements.generate_ledger then
			table.insert(callbacks, {func = settlements.generate_ledger, param1="kings", param2=town_name})
		end
		
		local callback = callbacks[math.random(#callbacks)]
		local book = callback.func(callback.param1, callback.param2)
		if book then
			inv:add_item("books", book)
		end
	end,
})


end

-----------------------------------------------------------------------------------------

if minetest.settings:get_bool("settlements_igloos", true) then

if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_inuit.cfg"))
end

local inuit_settlements = {
	surface_materials = {
		"default:snowblock",
	},
	replace_with_surface_material = "default:ice",

	platform_shallow = "default:snowblock",
	platform_deep = "default:ice",
	
	building_count_min = 3,
	building_count_max = 9,
	
	altitude_min = 2,
	altitude_max = 300,
	
	schematics = {
		{
			name = "igloo",
			schematic = dofile(schem_path.."igloo.lua"),
			buffer = 2,
			max_num = 1,
			initialize_node = initialize_node,
		},
	},
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("inuit_camps")
		end	
		return "Inuit camp"
	end,
}

settlements.register_settlement("inuit", inuit_settlements)

end

-------------------------------------------------------------------------------------------

if minetest.settings:get_bool("settlements_underwater", false) then

local coralpalace = {
	name = "coralpalace",
	schematic = dofile(schem_path.."coral_palace.lua"),
	buffer = 2,
	max_num = 0.1,
	platform_clear_above = false,
}


local mer_settlements = {
	surface_materials = {
		"default:sand",
		"default:dirt",
	},
--	replace_with_surface_material = "default:ice",

	platform_shallow = "default:sand",
	platform_deep = "default:stone",
	platform_air = "default:water_source",
	
	building_count_min = 3,
	building_count_max = 12,
	
	altitude_min = -50,
	altitude_max = -10,
	
	replacements = {
		["default:coral_orange"] = {
			"default:coral_orange",
			"default:coral_brown", 
		},
	},
	
	central_schematics = {
		coralpalace,
	},
	
	schematics = {
		coralpalace,
		{
			name = "coralhut",
			schematic = dofile(schem_path.."coral_hut.lua"),
			buffer = 1,
			max_num = 1,
			platform_clear_above = false,
		},
	},
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("mer_settlements")
		end	
		return "Mer camp"
	end,
}

if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_mer.cfg"))
end
settlements.register_settlement("mer", mer_settlements)

end

----------------------------------------------------------------------------------------

if minetest.settings:get_bool("settlements_jungle", true) then

local jungle_hut_complex = {
	name = "jungle_tree_hut_complex",
	schematic = dofile(schem_path.."jungle_tree_hut_complex.lua"),
	buffer = 1,
	max_num = 0.1,
	force_place = false,
	platform_clear_above = false,
	platform_fill_below = false,
	height_adjust = 1, -- adjusts the y axis of where the schematic is built
}

local jungle_settlements = {
	surface_materials = {
		"default:dirt_with_rainforest_litter",
	},
	ignore_surface_materials = {
		"default:jungletree",
	},

	platform_shallow = "default:dirt_with_rainforest_litter",
	platform_deep = "default:stone",

	building_count_min = 3,
	building_count_max = 12,
	
	altitude_min = 2,
	altitude_max = 300,
	
	central_schematics = {
		jungle_hut_complex,
	},
	
	schematics = {
		jungle_hut_complex,
		{
			name = "jungle_tree_hut",
			schematic = dofile(schem_path.."jungle_tree_hut.lua"),
			buffer = 0,
			max_num = 1,
			force_place = false,
			platform_clear_above = false,
		},
	},
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("jungle_camps")
		end	
		return "Jungle settlement"
	end,
}

if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_jungle.cfg"))
end
settlements.register_settlement("jungle", jungle_settlements)

end

----------------------------------------------------------------------------------

if minetest.settings:get_bool("settlements_desert", true) then

local bazaar = {
	name = "desert_bazaar",
	schematic = dofile(schem_path.."desert_bazaar.lua"),
	buffer = 1,
	max_num = 0.1,
}
local desert_hut = {
	name = "desert_hut",
	schematic = dofile(schem_path.."desert_hut.lua"),
	buffer = 1,
	max_num = 0.9,
}

local desert_settlements = {
	surface_materials = {
		"default:desert_sand",
	},
	ignore_surface_materials = {
		"default:cactus",
	},

	platform_shallow = "default:desert_sand",
	platform_deep = "default:stone",
	path_material = "default:desert_sandstone",
	
	replace_with_surface_material = "default:dirt_with_grass",

	building_count_min = 3,
	building_count_max = 20,
	
	altitude_min = 2,
	altitude_max = 300,
	
	central_schematics = {
		bazaar,
		desert_hut,
	},
	
	schematics = {
		desert_hut,
		bazaar,
		{
			name = "desert_watchtower",
			schematic = dofile(schem_path.."desert_watchtower.lua"),
			buffer = 1,
			max_num = 0.15,
		},
	},
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("desert_settlement")
		end	
		return "Desert settlement"
	end,
}


if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_desert.cfg"))
end

settlements.register_settlement("desert", desert_settlements)

end