local modpath = minetest.get_modpath(minetest.get_current_modname())

-- Interconverting lua and mts formatted schematics
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


settlements.surface_materials = {}
settlements.settlement_defs = {}

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


local schem_path = modpath.."/schematics/"
--
-- list of schematics
--
local schematic_table = {
	{
		name = "townhall",
		schematic = dofile(schem_path.."townhall.lua"),
		hsize = 15, -- buffer space around the building, footprint is treated as this size for spacing purposes
		max_num = 0, -- This times the number of buildings in a settlement gives the maximum number of these buildings in a settlement.
					-- So for example, 0.1 means at most 1 of these buildings in a 10-building settlement and 2 in a 20-building settlement.
		replace_wall = true -- If true, default:cobble will be replaced with a random wall material
	},
	{
		name = "well",
		schematic = dofile(schem_path.."well.lua"),
		hsize = 11,
		max_num = 0.045,
		replace_wall = false
	},
	{
		name = "hut",
		schematic = dofile(schem_path.."hut.lua"),
		hsize = 11,
		max_num = 0.9,
		replace_wall = true
	},
	{
		name = "garden",
		schematic = dofile(schem_path.."garden.lua"),
		hsize = 11,
		max_num = 0.1,
		replace_wall = false
	},
	{
		name = "lamp",
		schematic = dofile(schem_path.."lamp.lua"),
		hsize = 10,
		max_num = 0.05,
		replace_wall = false
	},
	{
		name = "tower",
		schematic = dofile(schem_path.."tower.lua"),
		hsize = 11,
		max_num = 0.055,
		replace_wall = false
	},
	{
		name = "church",
		schematic = dofile(schem_path.."church.lua"),
		hsize = 15,
		max_num = 0.075,
		replace_wall = false
	},
	{
		name = "blacksmith",
		schematic = dofile(schem_path.."blacksmith.lua"),
		hsize = 11,
		max_num = 0.050,
		replace_wall = false
	},
}

if minetest.get_modpath("commoditymarket") then
	table.insert(schematic_table,
	{
		name = "kingsmarket",
		schematic = dofile(schem_path.."kingsmarket.lua"),
		hsize = 13, -- buffer space around the building, footprint is treated as this size for spacing purposes
		max_num = 0.1, -- This times the number of buildings in a settlement gives the maximum number of these buildings in a settlement.
					-- So for example, 0.1 means at most 1 of these buildings in a 10-building settlement and 2 in a 20-building settlement.
		replace_wall = true -- If true, default:cobble will be replaced with a random wall material
	})
	table.insert(schematic_table,
	{
		name = "nightmarket",
		schematic = dofile(schem_path.."nightmarket.lua"),
		hsize = 11,
		max_num = 0.025,
		replace_wall = true
	})
end


settlements.half_map_chunk_size = 40


local medieval_settlements = {
	-- this settlement will be placed on nodes with this surface material type.
	surface_materials = {
		"default:dirt",
		"default:dirt_with_grass",
		"default:dry_dirt_with_grass",
		"default:dirt_with_snow",
		"default:dirt_with_dry_grass",
		"default:dirt_with_coniferous_litter",
		"default:dirt_with_rainforest_litter",
		"default:sand",
		"default:silver_sand",
		"default:desert_sand",
		"default:snow_block"
	},
	
	-- TODO: add a biome list. The tricky part here is, what if a biome list but not a surface materials list is provided?
	-- How to find the surface, and how to know what to replace surface material nodes with in the schematic?

	-- nodes in schematics will be replaced with these nodes, or a randomly-selected node
	-- from a list of choices if a list is provided
	replace_general = {
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
		["default:junglewood"] = "settlements:junglewood",
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
	},
	
	platform_shallow = "default:dirt",
	platform_deep = "default:stone",
	path_material = "default:gravel",
	
	schematics = schematic_table,
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("settlement_towns")
		end
		return "Town"
	end
}

settlements.register_settlement("medieval", medieval_settlements)