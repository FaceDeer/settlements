-- iterate over whole table to get all keys
--local variables for buildings
local building_all_info
local number_of_buildings
local number_built

local wallmaterial = settlements.wallmaterial
local half_map_chunk_size = settlements.half_map_chunk_size
local schematic_table = settlements.schematic_table

-------------------------------------------------------------------------------
-- initialize settlement_info 
-------------------------------------------------------------------------------
local function initialize_settlement_info()
	-- randomize number of buildings
	number_of_buildings = math.random(10,25)
	number_built = 1
	if settlements.debug == true then
		minetest.chat_send_all("settlement ".. number_of_buildings)
	end
	
	return settlement_info
end


-------------------------------------------------------------------------------
-- check distance for new building
-------------------------------------------------------------------------------
local function check_distance(building_pos, building_size, settlement_info)
	local distance
	for i, built_house in ipairs(settlement_info) do
		distance = math.sqrt(
			((building_pos.x - built_house.pos.x)*(building_pos.x - built_house.pos.x))+
			((building_pos.z - built_house.pos.z)*(building_pos.z - built_house.pos.z)))
		if distance < building_size or 
		distance < built_house.hsize
		then
			return false
		end
	end
	return true
end

-------------------------------------------------------------------------------
-- everything necessary to pick a fitting next building
-------------------------------------------------------------------------------
local function pick_next_building(pos_surface, count_buildings, settlement_info)
	local randomized_schematic_table = shuffle(schematic_table)
	-- pick schematic
	local size = #randomized_schematic_table
	for i = size, 1, -1 do
		-- already enough buildings of that type?
		local current_schematic = randomized_schematic_table[i]
		local current_schematic_name = current_schematic.name
		count_buildings[current_schematic_name] = count_buildings[current_schematic_name] or 0
		if count_buildings[current_schematic_name] < current_schematic.max_num*number_of_buildings then
			building_all_info = current_schematic
			-- check distance to other buildings
			local distance_to_other_buildings_ok = check_distance(pos_surface, 
				building_all_info.hsize,
				settlement_info)
			if distance_to_other_buildings_ok then
				-- count built houses
				count_buildings[building_all_info.name] = count_buildings[building_all_info.name] +1
				return building_all_info.schematic
			end
		end
	end
	return nil
end

-------------------------------------------------------------------------------
-- save list of generated settlements
-------------------------------------------------------------------------------
local function settlements_save()
	local file = io.open(minetest.get_worldpath().."/settlements.txt", "w")
	if file then
		file:write(minetest.serialize(settlements.settlements_in_world))
		file:close()
	end
end

-------------------------------------------------------------------------------
-- fill settlement_info with LVM
--------------------------------------------------------------------------------
function settlements.create_site_plan(maxp, minp, data, va)
	local possible_rotations = {"0", "90", "180", "270"}
	-- find center of chunk
	local center = {
		x=maxp.x-half_map_chunk_size, 
		y=maxp.y, 
		z=maxp.z-half_map_chunk_size
	} 
	-- find center_surface of chunk
	local center_surface, surface_material = settlements.find_surface(center, data, va)
	-- go build settlement around center
	if not center_surface then
		return nil
	end
	-- add settlement to list
	table.insert(settlements.settlements_in_world, 
		center_surface)
	-- save list to file
	settlements_save()

	-- initialize all settlement_info table
	initialize_settlement_info()
	local settlement_info = {}
	local count_buildings = {}
	
	-- first building is townhall in the center
	building_all_info = schematic_table[1]
	local rotation = possible_rotations[ math.random( #possible_rotations ) ]
	-- add to settlement info table
	local index = 1
	settlement_info[index] = {
		pos = center_surface, 
		name = building_all_info.name,
		hsize = building_all_info.hsize,
		rotat = rotation,
		surface_mat = surface_material
	}
	--increase index for following buildings
	index = index + 1
	-- now some buildings around in a circle, radius = size of town center
	local x, z, r = center_surface.x, center_surface.z, building_all_info.hsize
	-- draw j circles around center and increase radius by math.random(2,5)
	for j = 1,20 do
		if number_built < number_of_buildings	then 
			-- set position on imaginary circle
			for j = 0, 360, 15 do
				local angle = j * math.pi / 180
				local ptx, ptz = x + r * math.cos( angle ), z + r * math.sin( angle )
				ptx = math.floor(ptx + 0.5) -- round
				ptz = math.floor(ptz + 0.5)
				local pos1 = { x=ptx, y=center_surface.y+50, z=ptz}
				--
				local pos_surface, surface_material = settlements.find_surface(pos1, data, va)
				if pos_surface 
				then
					if pick_next_building(pos_surface, count_buildings, settlement_info) 
					then
						rotation = possible_rotations[ math.random( #possible_rotations ) ]
						number_built = number_built + 1
						settlement_info[index] = {
							pos = pos_surface, 
							name = building_all_info.name,
							hsize = building_all_info.hsize,
							rotat = rotation,
							surface_mat = surface_material
						}
						index = index + 1
						if number_of_buildings == number_built 
						then
							break
						end
					end
				else
					break
				end
			end
			r = r + math.random(2,5)
		end
	end
	if settlements.debug == true
	then
		minetest.chat_send_all("really ".. number_built)
	end
	return settlement_info
end

-------------------------------------------------------------------------------
-- evaluate settlement_info and place schematics
-------------------------------------------------------------------------------
function settlements.place_schematics(vm, settlement_info)
	for i, built_house in ipairs(settlement_info) do
		-- TODO better schematic lookup
		for j, schem in ipairs(schematic_table) do
			if settlement_info[i].name == schem.name
			then
				building_all_info = schem
				break
			end
		end

		local pos = settlement_info[i].pos
		local rotation = settlement_info[i].rotat
		-- get building node material for better integration to surrounding
		local platform_material = settlement_info[i].surface_mat
		local platform_material_name = minetest.get_name_from_content_id(platform_material)

		local building_schematic = building_all_info.schematic
		
		local replacements = {}
		
		if building_all_info.replace_wall then
			replacements["default:cobble"] = wallmaterial[math.random(1,#wallmaterial)]
		end
		replacements["default:dirt_with_grass"] = platform_material_name
		replacements["default:junglewood"] = "settlements:junglewood"

		if settlements.debug then
			minetest.chat_send_all("building " .. settlement_info[i].name .. " at " .. minetest.pos_to_string(pos))
		end
		minetest.place_schematic_on_vmanip(
			vm, 
			pos, 
			building_schematic, 
			rotation, 
			replacements,
			true)

	end
end
