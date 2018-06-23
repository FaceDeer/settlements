function settlements.build_blueprint(pos,blueprint)
  -- 4 building functions for each direction
  local blueprint_function_table = {settlements.build_blueprint_n, settlements.build_blueprint_s, settlements.build_blueprint_w, settlements.build_blueprint_e}
  -- choose one of these functions
  local random_index = math.random(1, #blueprint_function_table) --pick random index from 1 to #f_tbl
  -- call one of those functions
  blueprint_function_table[random_index](pos,blueprint,balcony_material) --execute function at the random_index we've picked
end

function settlements.build_blueprint_n(pos,blueprint,balcony_material)
  x = 0
  y = 0
  z = 0
  for i = 1,#blueprint, 1 do   -- floor
    for j = 1, #blueprint[i], 1 do   -- row
      for k = 1, #blueprint[i][j], 1 do   -- block
        if string.find(blueprint[i][j][k],"door") then
          settlements.door({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"torch") then
          settlements.torch({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"bed") then
          minetest.place_schematic({x=pos.x+x, y=pos.y+y, z=pos.z+z}, minetest.get_modpath("settlements").."/schematics/bed.mts", "0", nil, true)
        elseif string.find(blueprint[i][j][k],"nix") then
          local a = 0
        elseif blueprint[i][j][k] ~= nil then
          minetest.set_node({x=pos.x+x, y=pos.y+y, z=pos.z+z}, {name=blueprint[i][j][k]})
        end
        if y == 0 then
          settlements.ground({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        end
        x = x + 1
--        minetest.chat_send_all(blocks)
      end
      x = 0
      z = z + 1   
    end
    z = 0
    y = y + 1
  end
end
--
function settlements.build_blueprint_s(pos,blueprint,balcony_material)
  x = 0
  y = 0
  z = 0
  for i = 1,#blueprint, 1 do   -- floor
    for j = #blueprint[i], 1, -1 do   
      for k = #blueprint[i][j], 1, -1 do   
        if string.find(blueprint[i][j][k],"door") then
          settlements.door({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"torch") then
          settlements.torch({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"bed") then
          minetest.place_schematic({x=pos.x+x, y=pos.y+y, z=pos.z+z}, minetest.get_modpath("settlements").."/schematics/bed.mts", "0", nil, true)
        elseif string.find(blueprint[i][j][k],"nix") then
          local a = 0
        elseif blueprint[i][j][k] ~= nil then
          minetest.set_node({x=pos.x+x, y=pos.y+y, z=pos.z+z}, {name=blueprint[i][j][k]})
        end
        if y == 0 then
          settlements.ground({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        end
        x = x + 1
--        minetest.chat_send_all(blocks)
      end
      x = 0
      z = z + 1   
    end
    z = 0
    y = y + 1
  end
end
--
function settlements.build_blueprint_w(pos,blueprint,balcony_material)
  x = 0
  y = 0
  z = 0
  for i = 1,#blueprint, 1 do   -- floor
    for j = 1, #blueprint[i], 1 do   -- row
      for k = 1, #blueprint[i][j], 1 do   -- block
        if string.find(blueprint[i][j][k],"door") then
          settlements.door({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"torch") then
          settlements.torch({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"bed") then
          minetest.place_schematic({x=pos.x+x, y=pos.y+y, z=pos.z+z}, minetest.get_modpath("settlements").."/schematics/bed.mts", "0", nil, true)
        elseif string.find(blueprint[i][j][k],"nix") then
          local a = 0
        elseif blueprint[i][j][k] ~= nil then
          minetest.set_node({x=pos.x+x, y=pos.y+y, z=pos.z+z}, {name=blueprint[i][j][k]})
        end
        if y == 0 then
          settlements.ground({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        end
        z = z + 1
--        minetest.chat_send_all(blocks)
      end
      z = 0
      x = x + 1   
    end
    x = 0
    y = y + 1
  end
end
--
function settlements.build_blueprint_e(pos,blueprint,balcony_material)
  x = 0
  y = 0
  z = 0
  for i = 1,#blueprint, 1 do   -- floor
    for j = #blueprint[i], 1, -1 do   
      for k = #blueprint[i][j], 1, -1 do   
        if string.find(blueprint[i][j][k],"door") then
          settlements.door({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"torch") then
          settlements.torch({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        elseif string.find(blueprint[i][j][k],"bed") then
          minetest.place_schematic({x=pos.x+x, y=pos.y+y, z=pos.z+z}, minetest.get_modpath("settlements").."/schematics/bed.mts", "0", nil, true)
        elseif string.find(blueprint[i][j][k],"nix") then
          local a = 0
        elseif blueprint[i][j][k] ~= nil then
          minetest.set_node({x=pos.x+x, y=pos.y+y, z=pos.z+z}, {name=blueprint[i][j][k]})
        end
        if y == 0 then
          settlements.ground({x=pos.x+x, y=pos.y+y, z=pos.z+z})
        end
        z = z + 1
--        minetest.chat_send_all(blocks)
      end
      z = 0
      x = x + 1   
    end
    x = 0
    y = y + 1
  end
end