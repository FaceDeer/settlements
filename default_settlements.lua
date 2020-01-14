local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/settlements_medieval.lua")

-- Various settlements' schematics depend on different mods. These paths are used to ensure settlements don't get generated
-- without the corresponding mods being enabled.
local modpath_default = minetest.get_modpath("default")
local modpath_beds = minetest.get_modpath("beds")
local modpath_doors = minetest.get_modpath("doors")
local modpath_stairs = minetest.get_modpath("stairs")

-- internationalization boilerplate
local S, NS = dofile(modpath.."/intllib.lua")

local generate_books = minetest.settings:get_bool("settlements_generate_books", true) and modpath_default -- books are defined in the default mod

dofile(modpath.."/bookgen.lua")

----------------------------------------------------------------------------------------------------------------

if generate_books then
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

local schem_path = modpath.."/schematics/"
--settlements.convert_mts_to_lua(schem_path.."filename.mts")

-----------------------------------------------------------------------------------------

if minetest.settings:get_bool("settlements_igloos", true)
	and modpath_default
	and modpath_beds
	and modpath_stairs then

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
			schematic = dofile(schem_path.."arctic_igloo.lua"),
			buffer = 2,
			max_num = 1,
			--initialize_node =, -- TODO there are chests in this schematic, fill them
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

if minetest.settings:get_bool("settlements_underwater", false)
	and modpath_default then

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

if minetest.settings:get_bool("settlements_jungle", true)
	and modpath_default
	and modpath_doors
	and modpath_beds
	and modpath_stairs then

local jungle_hut_complex = {
	name = "jungle_tree_hut_complex",
	schematic = dofile(schem_path.."jungle_tree_hut_complex.lua"),
	buffer = 1,
	max_num = 0.1,
	force_place = false,
	platform_clear_above = false,
	platform_fill_below = false,
	height_adjust = 1, -- adjusts the y axis of where the schematic is built
	-- initialize_node = , -- TODO There are chests in this schematic, fill them
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

if minetest.settings:get_bool("settlements_desert", true)
	and modpath_default
	and modpath_doors
	and modpath_beds
	and modpath_stairs then

local bazaar = {
	name = "desert_bazaar",
	schematic = dofile(schem_path.."desert_bazaar.lua"),
	buffer = 1,
	max_num = 0.1,
	-- initialize_node = , -- TODO There are chests and a bookshelf in this schematic, fill them
}
local desert_hut = {
	name = "desert_hut",
	schematic = dofile(schem_path.."desert_hut.lua"),
	buffer = 1,
	max_num = 0.9,
	-- initialize_node = , -- TODO There are chests in this schematic, fill them
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