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

local source_texts = {
	modpath.."/sourcetexts/gulliver.txt",
	modpath.."/sourcetexts/caveregionsoftheozarksandblackhills.txt",
}

local function fill_shelf(pos, author)
	local inv = minetest.get_inventory( {type="node", pos=pos} )
	for i = 1, math.random(2, 8) do
		local source_text = source_texts[math.random(1, #source_texts)]
		local title = settlements.generate_line(source_text, math.random(3, 6))
		title = title:lower():gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end) -- capitalization
		local book = settlements.generate_book(source_text, title, author)
		inv:add_item("books", book)
	end
end

local initialize_node = function(pos, node, node_def, settlement_info)
	if settlement_info.name and node.name == "default:sign_wall_steel" then
		local meta = minetest.get_meta(pos)
		meta:set_string("text", settlement_info.name .. " Town Hall")
		meta:set_string("infotext", settlement_info.name .. " Town Hall")
	end
				-- when chest is found -> fill with stuff
	if node.name == "default:chest" then
		fill_chest(pos)
	end
	if node.name == "default:bookshelf" then
		fill_shelf(pos, "a resident of " .. settlement_info.name)
	end
	if minetest.get_item_group(node.name, "plant") > 0 then
		minetest.get_node_timer(pos):start(1000) -- start crops growing
	end
end

----------------------------------------------------------------------------------------

if minetest.get_modpath("namegen") then
	namegen.parse_lines(io.lines(modpath.."/namegen_towns.cfg"))
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
		replace_nodes = true, -- If true, default:cobble will be replaced with a random wall material
		initialize_node = initialize_node, -- allows additional post-creation actions to be executed on schematic nodes once they're constructed
	},
	{
		name = "well",
		schematic = dofile(schem_path.."well.lua"),
		hsize = 11,
		max_num = 0.045,
		replace_nodes = false,
	},
	{
		name = "hut",
		schematic = dofile(schem_path.."hut.lua"),
		hsize = 11,
		max_num = 0.9,
		replace_nodes = true,
		initialize_node = initialize_node,
	},
	{
		name = "garden",
		schematic = dofile(schem_path.."garden.lua"),
		hsize = 11,
		max_num = 0.1,
		replace_nodes = false,
		initialize_node = initialize_node,
	},
	{
		name = "lamp",
		schematic = dofile(schem_path.."lamp.lua"),
		hsize = 10,
		max_num = 0.05,
		replace_nodes = false,
	},
	{
		name = "tower",
		schematic = dofile(schem_path.."tower.lua"),
		hsize = 11,
		max_num = 0.055,
		replace_nodes = false,
	},
	{
		name = "church",
		schematic = dofile(schem_path.."church.lua"),
		hsize = 15,
		max_num = 0.075,
		replace_nodes = false,
	},
	{
		name = "blacksmith",
		schematic = dofile(schem_path.."blacksmith.lua"),
		hsize = 11,
		max_num = 0.050,
		replace_nodes = false,
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
		replace_nodes = true, -- If true, default:cobble will be replaced with a random wall material
		initialize_node = initialize_node,
	})
	table.insert(schematic_table,
	{
		name = "nightmarket",
		schematic = dofile(schem_path.."nightmarket.lua"),
		hsize = 11,
		max_num = 0.025,
		replace_nodes = true,
		initialize_node = initialize_node,
	})
end

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
	replacements = {
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
	
	building_count_min = 5,
	building_count_max = 25,
	
	altitude_min = 1,
	altitude_max = 300,
	
	generate_name = function(pos)
		if minetest.get_modpath("namegen") then
			return namegen.generate("settlement_towns")
		end
		return "Town"
	end,
}

settlements.register_settlement("medieval", medieval_settlements)

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
	
--	altitude_min = 1,
--	altitude_max = 300,
	
	schematics = {
		{
			name = "igloo",
			schematic = dofile(schem_path.."igloo.lua"),
			hsize = 9,
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
