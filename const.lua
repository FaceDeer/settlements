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

--
-- switch for debugging
--
settlements.debug = false
--
-- timer between creation of two settlements
--
settlements.last_settlement = os.time()
settlements.min_timer = 20
--
--
-- material to replace cobblestone with
--
settlements.wallmaterial = {
	"default:junglewood", 
	"default:pine_wood", 
	"default:wood", 
	"default:aspen_wood", 
	"default:acacia_wood",	 
	"default:stonebrick", 
	"default:cobble", 
	"default:desert_stonebrick", 
	"default:desert_cobble", 
	"default:sandstone"
}

function Set (list)
	local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
end

--
-- possible surfaces where buildings can be built
--
settlements.surface_mat = Set({
	"default:dirt_with_grass",
	"default:dry_dirt_with_grass",
	"default:dirt_with_snow",
	"default:dirt_with_dry_grass",
	"default:dirt_with_coniferous_litter",
	"default:sand",
	"default:silver_sand",
	"default:desert_sand",
	"default:snow_block"
})

--
-- path to schematics
--
local schem_path = modpath.."/schematics/"
--
-- list of schematics
--
settlements.schematic_table = {
	{
		name = "townhall",
		schematic = dofile(schem_path.."kingsmarket.lua"),
		hwidth = 11, hdepth = 11, hheight = 10, hsize = 15,
		max_num = 0, -- This times the number of buildings in a settlement gives the maximum number of these buildings in a settlement.
					-- So for example, 0.1 means at most 1 of these buildings in a 10-building settlement and 2 in a 20-building settlement.
		replace_wall = false -- If true, default:cobble will be replaced with a random wall material
	},
	{
		name = "well",
		schematic = dofile(schem_path.."well.lua"),
		hwidth = 5, hdepth = 5, hheight = 13, hsize = 11,
		max_num = 0.045,
		replace_wall = false
	},
	{
		name = "hut",
		schematic = dofile(schem_path.."hut.lua"),
		hwidth = 7, hdepth = 7, hheight = 13, hsize = 11,
		max_num = 0.9,
		replace_wall = true
	},
	{
		name = "garden",
		schematic = dofile(schem_path.."garden.lua"),
		hwidth = 7, hdepth = 7, hheight = 13, hsize = 11,
		max_num = 0.1,
		replace_wall = false
	},
	{
		name = "lamp",
		schematic = dofile(schem_path.."lamp.lua"),
		hwidth = 3, hdepth = 3, hheight = 13, hsize = 10,
		max_num = 0.1,
		replace_wall = false
	},
	{
		name = "tower",
		schematic = dofile(schem_path.."tower.lua"),
		hwidth = 7, hdepth = 7, hheight = 13, hsize = 11,
		max_num = 0.055,
		replace_wall = false
	},
	{
		name = "church",
		schematic = dofile(schem_path.."church.lua"),
		hwidth = 7, hdepth = 10, hheight = 13, hsize = 17,
		max_num = 0.050,
		replace_wall = false
	},
	{
		name = "blacksmith",
		schematic = dofile(schem_path.."blacksmith.lua"),
		hwidth = 7, hdepth = 7, hheight = 13, hsize = 11,
		max_num = 0.050,
		replace_wall = false
	},
}

--
-- list of settlements, load on server start up
--
settlements.settlements_in_world = {}
--
-- min_distance between settlements
--
settlements.min_dist_settlements = 500
if settlements.debug == true 
then
	settlements.min_dist_settlements = 200
end
--
-- maximum allowed difference in height for building a sttlement
--
settlements.max_height_difference = 10

settlements.half_map_chunk_size = 40
