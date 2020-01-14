local worldpath = minetest.get_worldpath()
local areastore_filename = worldpath.."/settlements_areastore.txt"

-- load list of generated settlements
local function settlements_load()
	local area_file = io.open(areastore_filename, "r")
	
	-- Compatibility with old versions
	local old_file = io.open(worldpath.."/settlements.txt", "r")
	if old_file and not area_file then
		local settlements = minetest.deserialize(old_file:read("*all"))
		if type(settlements) == "table" then
			local areastore = AreaStore()
			for _, pos in ipairs(settlements) do
				pos = vector.add(pos, {x=5, y=0, z=5}) -- Shift it over to put it in the center of town hall
				local name = "Town"
				if minetest.get_modpath("namegen") then
					name = namegen.generate("settlement_towns")
				end
				local discovered_by = {}
				local settlement_type = "medieval"
				areastore:insert_area(pos, pos, minetest.serialize({name=name, discovered_by=discovered_by,settlement_type=settlement_type}))
			end
			return areastore
		end
	end
	------------------------------------
	--end compatibility block
	local areastore = AreaStore()
	if not area_file then
		return areastore
	end
	areastore:from_file(areastore_filename)
	return areastore
end
settlements.settlements_in_world = settlements_load()

-- save list of generated settlements
function settlements.settlements_save()
	settlements.settlements_in_world:to_file(areastore_filename)
end