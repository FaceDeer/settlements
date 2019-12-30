local n1 = { name = "default:dirt_with_grass" }
local n2 = { name = "air" }
local n3 = { name = "stairs:stair_wood" }
local n4 = { name = "default:junglewood" }
local n5 = { name = "default:tree", param2 = 2 }
local n6 = { name = "default:cobble" }
local n7 = { name = "default:tree", param2 = 1 }
local n8 = { name = "xpanes:pane_flat", param2 = 2 }
local n9 = { name = "default:tree", param2 = 9 }
local n10 = { name = "default:tree", param2 = 18 }
local n11 = { name = "default:tree", param2 = 10 }
local n12 = { name = "stairs:stair_wood", param2 = 1 }
local n13 = { name = "xpanes:pane_flat" }
local n14 = { name = "stairs:stair_wood", param2 = 3 }
local n15 = { name = "stairs:slab_wood", param2 = 1 }
local n16 = { name = "vessels:shelf", param2 = 3 }
local n17 = { name = "default:chest", param2 = 1 }
local n18 = { name = "default:torch_wall", param2 = 5 }
local n19 = { name = "stairs:slab_junglewood", param2 = 21 }
local n20 = { name = "vessels:shelf", param2 = 1 }
local n21 = { name = "default:tree", param2 = 7 }
local n22 = { name = "stairs:stair_junglewood", param2 = 22 }
local n23 = { name = "default:fence_junglewood" }
local n24 = { name = "vessels:shelf", param2 = 2 }
local n25 = { name = "default:bookshelf", param2 = 2 }
local n26 = { name = "stairs:stair_inner_wood", param2 = 1 }
local n27 = { name = "stairs:stair_inner_wood" }
local n28 = { name = "default:bookshelf", param2 = 3 }
local n29 = { name = "xpanes:pane_flat", param2 = 1 }
local n30 = { name = "default:chest", param2 = 3 }
local n31 = { name = "default:torch_wall", param2 = 3 }
local n32 = { name = "default:bookshelf", param2 = 1 }
local n33 = { name = "commoditymarket:night_market", param2 = 3, prob = 64 } -- 50% chance of night market being spawned
local n34 = { name = "stairs:stair_junglewood", param2 = 2 }
local n35 = { name = "stairs:slab_junglewood", param2 = 23 }
local n36 = { name = "default:tree", param2 = 12 }
local n37 = { name = "stairs:slab_wood" }
local n38 = { name = "default:torch_wall", param2 = 2 }
local n39 = { name = "stairs:stair_junglewood", param2 = 20 }
local n40 = { name = "stairs:stair_wood", param2 = 2 }
local n41 = { name = "doors:door_wood_a", param2 = 3 }
local n42 = { name = "commoditymarket:kings_market", param2 = 1 }
local n43 = { name = "doors:hidden", param2 = 3 }
local n44 = { name = "doors:trapdoor", param2 = 12 }
local n45 = { name = "stairs:stair_junglewood", param2 = 1 }
local n46 = { name = "default:chest" }
local n47 = { name = "stairs:stair_inner_wood", param2 = 2 }
local n48 = { name = "stairs:stair_inner_wood", param2 = 3 }
local n49 = { name = "stairs:slab_wood", param2 = 3 }

return {
	yslice_prob = {},
	size = {y = 10, x = 11, z = 11},
	data = {
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n3, n3, n3, n3, n3, n3, n3, 
		n3, n3, n3, n3, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n1, n4, n4, n4, n4, n4, n4, n4, n4, 
		n4, n1, n2, n5, n6, n6, n6, n6, n6, n6, n6, n7, n2, n2, n5, n6, n8, 
		n6, n6, n6, n8, n6, n7, n2, n2, n5, n6, n6, n6, n6, n6, n6, n6, n7, 
		n2, n2, n9, n10, n10, n10, n10, n10, n10, n10, n11, n2, n3, n3, n3, 
		n3, n3, n3, n3, n3, n3, n3, n3, n2, n2, n2, n2, n12, n13, n14, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n15, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n1, n4, n4, n4, n4, n4, n4, n4, n4, n4, n1, n2, n6, n2, n2, 
		n2, n16, n2, n2, n17, n6, n2, n2, n6, n2, n2, n2, n2, n18, n2, n2, 
		n6, n2, n2, n6, n2, n2, n2, n19, n2, n2, n20, n6, n2, n2, n9, n2, n2, 
		n2, n4, n4, n4, n4, n21, n2, n2, n6, n2, n22, n2, n23, n24, n22, n25, 
		n6, n2, n3, n3, n3, n3, n26, n2, n27, n3, n3, n3, n3, n2, n2, n2, n2, 
		n2, n15, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n1, n4, n4, n4, n4, 
		n4, n4, n4, n4, n4, n1, n2, n6, n2, n2, n2, n28, n2, n2, n17, n6, n2, 
		n2, n29, n2, n2, n2, n2, n2, n2, n2, n6, n2, n2, n6, n2, n2, n2, n19, 
		n2, n2, n20, n6, n2, n2, n9, n2, n2, n2, n4, n4, n4, n4, n21, n2, n2, 
		n6, n2, n2, n2, n23, n2, n2, n2, n6, n2, n2, n6, n2, n22, n2, n2, n2, 
		n22, n2, n6, n2, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n1, n4, n4, n4, n4, n4, n4, n4, n4, n4, n1, n2, n6, n2, 
		n2, n2, n30, n2, n2, n17, n6, n2, n2, n6, n2, n2, n2, n2, n2, n2, n2, 
		n6, n2, n2, n6, n31, n2, n2, n19, n2, n2, n32, n6, n2, n2, n9, n2, 
		n2, n2, n4, n4, n4, n4, n21, n2, n2, n6, n2, n2, n2, n23, n2, n2, n2, 
		n6, n2, n2, n6, n2, n2, n2, n2, n2, n2, n2, n6, n2, n2, n6, n2, n22, 
		n2, n2, n2, n22, n2, n6, n2, n3, n3, n3, n3, n3, n3, n3, n3, n3, n3, 
		n3, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n1, n4, n4, n4, n4, 
		n4, n4, n4, n4, n4, n1, n2, n6, n2, n2, n2, n16, n2, n2, n17, n6, 
		n33, n2, n29, n2, n2, n2, n2, n2, n2, n2, n6, n2, n2, n6, n2, n2, n2, 
		n19, n2, n2, n20, n6, n2, n2, n9, n2, n2, n2, n4, n4, n4, n34, n21, 
		n2, n2, n6, n2, n2, n2, n23, n2, n2, n2, n6, n2, n2, n29, n2, n2, n2, 
		n2, n2, n2, n2, n29, n2, n2, n6, n2, n35, n2, n2, n2, n35, n2, n6, 
		n2, n10, n36, n36, n36, n36, n36, n36, n36, n36, n36, n36, n37, n37, 
		n37, n37, n37, n37, n37, n37, n37, n37, n37, n1, n4, n4, n4, n4, n4, 
		n4, n4, n4, n4, n1, n2, n6, n2, n2, n2, n30, n2, n2, n17, n6, n2, n2, 
		n6, n2, n2, n2, n2, n2, n2, n2, n6, n2, n2, n6, n31, n2, n2, n19, n2, 
		n2, n34, n6, n2, n2, n9, n2, n2, n2, n4, n4, n4, n2, n21, n2, n2, n6, 
		n2, n2, n2, n23, n2, n2, n2, n6, n2, n2, n6, n2, n2, n2, n2, n2, n2, 
		n38, n6, n2, n2, n6, n2, n39, n2, n2, n2, n39, n2, n6, n2, n40, n40, 
		n40, n40, n40, n40, n40, n40, n40, n40, n40, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n1, n4, n4, n4, n4, n4, n4, n4, n4, n4, n1, n2, 
		n41, n2, n2, n2, n42, n2, n2, n2, n6, n2, n2, n43, n2, n2, n2, n2, 
		n2, n2, n34, n6, n2, n2, n6, n2, n2, n2, n19, n2, n2, n2, n6, n2, n2, 
		n9, n2, n2, n2, n4, n4, n4, n2, n21, n2, n2, n6, n2, n2, n2, n23, n2, 
		n2, n2, n6, n2, n2, n6, n2, n39, n2, n2, n2, n39, n2, n6, n2, n40, 
		n40, n40, n40, n40, n40, n40, n40, n40, n40, n40, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n1, n4, n4, n4, n4, n4, n4, n4, n4, n4, n1, n2, n6, n2, n2, n2, n44, 
		n2, n45, n35, n6, n2, n2, n6, n2, n2, n2, n2, n2, n2, n2, n6, n2, n2, 
		n6, n2, n2, n2, n19, n2, n2, n2, n6, n2, n2, n9, n2, n2, n2, n4, n4, 
		n4, n2, n21, n2, n2, n6, n2, n39, n2, n23, n46, n39, n2, n6, n2, n40, 
		n40, n40, n40, n47, n2, n48, n40, n40, n40, n40, n2, n2, n2, n2, n2, 
		n49, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n1, n4, n4, n4, n4, n4, 
		n4, n4, n4, n4, n1, n2, n7, n6, n6, n6, n6, n6, n6, n6, n7, n2, n2, 
		n7, n6, n8, n6, n6, n6, n8, n6, n7, n2, n2, n7, n6, n6, n6, n6, n6, 
		n6, n6, n7, n2, n2, n11, n10, n10, n10, n10, n10, n10, n10, n21, n2, 
		n40, n40, n40, n40, n40, n40, n40, n40, n40, n40, n40, n2, n2, n2, 
		n2, n12, n8, n14, n2, n2, n2, n2, n2, n2, n2, n2, n2, n49, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		n1, n1, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n40, n40, n40, n40, n40, n40, n40, n40, n40, n40, n40, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, n2, 
		n2, n2, 
	},
}
