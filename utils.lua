local c_dirt_with_grass				= minetest.get_content_id("default:dirt_with_grass")
local c_dirt_with_snow				= minetest.get_content_id("default:dirt_with_snow")
local c_dirt_with_dry_grass			= minetest.get_content_id("default:dirt_with_dry_grass")
local c_dirt_with_coniferous_litter = minetest.get_content_id("default:dirt_with_coniferous_litter")
local c_sand						= minetest.get_content_id("default:sand")
local c_desert_sand					= minetest.get_content_id("default:desert_sand")
local c_silver_sand					= minetest.get_content_id("default:silver_sand")
--
local c_air							= minetest.get_content_id("air")
local c_water_source				= minetest.get_content_id("default:water_source")
local c_water_flowing				= minetest.get_content_id("default:water_flowing")

local schematic_table = settlements.schematic_table

local surface_mat = {
	[c_dirt_with_grass] = true,
	[c_dirt_with_snow] = true,
	[c_dirt_with_dry_grass] = true,
	[c_dirt_with_coniferous_litter] = true,
	[c_sand] = true,
	[c_desert_sand] = true,
	[c_silver_sand] = true,
}

local buildable_to_set
local buildable_to = function(c_node)
	if buildable_to_set then return buildable_to_set[c_node] end
	buildable_to_set = {}
	for k, v in pairs(minetest.registered_nodes) do
		if v.buildable_to then
			buildable_to_set[minetest.get_content_id(k)] = true
		end
	end
	return buildable_to_set[c_node]
end


-------------------------------------------------------------------------------
-- function to find surface block y coordinate
-------------------------------------------------------------------------------
function settlements.find_surface(pos, data, va)
	if not va:containsp(pos) then return nil end
	
	-- starting point for looking for surface
	local previous_vi = va:indexp(pos)
	local previous_node = data[previous_vi]
	local itter -- count up or down
	if buildable_to(previous_node) then
		itter = -1 -- going down
	else
		itter = 1 -- going up
	end
	for cnt = 0, 200 do
		local next_vi = previous_vi + va.ystride * itter
		if not va:containsi(next_vi) then return nil end
		local next_node = data[next_vi]
		if buildable_to(previous_node) ~= buildable_to(next_node) then
			--we transitioned through what may be a surface. Test if it was the right material.
			local above_node, below_node, above_vi, below_vi
			if itter > 0 then
				-- going up
				above_node, below_node = next_node, previous_node
				above_vi, below_vi = next_vi, previous_vi
			else
				above_node, below_node = previous_node, next_node
				above_vi, below_vi = previous_vi, next_vi
			end
			if above_node ~= c_water_source and above_node ~= c_water_flowing and surface_mat[below_node] then
				return va:position(below_vi), below_node
			else
				return nil
			end
		end
		previous_vi = next_vi
		previous_node = next_node
	end
	return nil
end

-------------------------------------------------------------------------------
-- randomize table
-------------------------------------------------------------------------------

function shallowCopy(original)
	local copy = {}
	for key, value in pairs(original) do
		copy[key] = value
	end
	return copy
end

function shuffle(tbl)
	local ret = shallowCopy(tbl)
	local size = #ret
	for i = size, 1, -1 do
		local rand = math.random(size)
		ret[i], ret[rand] = ret[rand], ret[i]
	end
	return ret
end
-------------------------------------------------------------------------------
-- evaluate heightmap
-------------------------------------------------------------------------------
function settlements.evaluate_heightmap(heightmap)
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
