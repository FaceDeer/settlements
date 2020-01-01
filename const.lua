local modpath = minetest.get_modpath(minetest.get_current_modname())

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
	{name = "townhall", mts = schem_path.."kingsmarket.mts", hwidth = 11, hdepth = 11, hheight = 10, hsize = 15, max_num = 0, rplc = "n"},
	{name = "well", mts = schem_path.."well.mts", hwidth = 5, hdepth = 5, hheight = 13, hsize = 11, max_num = 0.045, rplc = "n"},
	{name = "hut", mts = schem_path.."hut.mts", hwidth = 7, hdepth = 7, hheight = 13, hsize = 11, max_num = 0.9, rplc = "y"},
	{name = "garden", mts = schem_path.."garden.mts", hwidth = 7, hdepth = 7, hheight = 13, hsize = 11, max_num = 0.1, rplc = "n"},
	{name = "lamp", mts = schem_path.."lamp.mts", hwidth = 3, hdepth = 3, hheight = 13, hsize = 10, max_num = 0.1, rplc = "n"},
	{name = "tower", mts = schem_path.."tower.mts", hwidth = 7, hdepth = 7, hheight = 13, hsize = 11, max_num = 0.055, rplc = "n"},
	{name = "church", mts = schem_path.."church.mts", hwidth = 7, hdepth = 10, hheight = 13, hsize = 17, max_num = 0.050, rplc = "n"},
	{name = "blacksmith", mts = schem_path.."blacksmith.mts", hwidth = 7, hdepth = 7, hheight = 13, hsize = 11, max_num = 0.050, rplc = "n"},
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

-- Interconverting lua and mts formatted schematics
function settlements.convert_mts_to_lua()
	local building = schem_path.."townhall.mts"
	local str = minetest.serialize_schematic(building, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"
	local schematic = loadstring(str)()
	local file = io.open(schem_path.."church"..".lua", "w")
	file:write(dump(schematic))
	file:close()
print(dump(schematic))
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