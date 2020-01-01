local schematic_table = settlements.schematic_table

-------------------------------------------------------------------------------
-- function to fill empty space below baseplate when building on a hill
-------------------------------------------------------------------------------
local function ground_lvm(pos, data, va) -- role model: Wendelsteinkircherl, Brannenburg
	local c_dirt = minetest.get_content_id("default:dirt")
	local c_stone = minetest.get_content_id("default:stone")
	--
	local p2 = vector.new(pos)
	local cnt = 0
	local mat = c_dirt
	p2.y = p2.y-1
	while true do
		cnt = cnt+1
		if cnt > 20 then break end
		if cnt > math.random(2,4) then mat = c_stone end
		local vi = va:index(p2.x, p2.y, p2.z)
		data[vi] = mat
		p2.y = p2.y-1
	end
end

-------------------------------------------------------------------------------
-- function clear space above baseplate 
-------------------------------------------------------------------------------
function settlements.terraform_lvm(data, va, settlement_info)
	local c_air = minetest.get_content_id("air")
	local fheight
	local fwidth
	local fdepth

	for i, built_house in ipairs(settlement_info) do
		-- pick right schematic_info to current built_house
		for j, schem in ipairs(schematic_table) do
			if settlement_info[i]["name"] == schem["name"]
			then
				schematic_data = schem
				break
			end
		end
		local pos = settlement_info[i]["pos"] 
		if settlement_info[i]["rotat"] == "0" or settlement_info[i]["rotat"] == "180" 
		then
			fwidth = schematic_data["hwidth"]
			fdepth = schematic_data["hdepth"]
		else
			fwidth = schematic_data["hdepth"]
			fdepth = schematic_data["hwidth"]
		end
		fheight = schematic_data["hheight"] * 3 -- remove trees and leaves above
		--
		-- now that every info is available -> create platform and clear space above
		--
		for zi = 0,fdepth-1 do
			for yi = 0,fheight do
				for xi = 0,fwidth-1 do
					if yi == 0 then
						local p = {x=pos.x+xi, y=pos.y, z=pos.z+zi}
						ground_lvm(p, data, va)
					else
						-- write ground
						local vi = va:index(pos.x+xi, pos.y+yi, pos.z+zi)
						data[vi] = c_air
					end
				end
			end
		end

	end
end
