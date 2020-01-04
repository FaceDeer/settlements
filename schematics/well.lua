local n1 = { name = "default:dirt" }
local n2 = { name = "default:dirt_with_grass" }
local n3 = { name = "default:cobble" }
local n4 = { name = "walls:cobble" }
local n5 = { name = "air" }
local n6 = { name = "stairs:slab_cobble", param2 = 1 }
local n7 = { name = "default:water_source" }

return {
	yslice_prob = {
		
	},
	size = {
		y = 5,
		x = 5,
		z = 5
	}
,
	data = {


		-- z=0, y=0
		n1, n2, n2, n2, n1, 
		-- z=0, y=1
		n3, n4, n4, n4, n3, 
		-- z=0, y=2
		n4, n5, n5, n5, n4, 
		-- z=0, y=3
		n4, n5, n5, n5, n4, 
		-- z=0, y=4
		n6, n6, n6, n6, n6, 

		-- z=1, y=0
		n2, n1, n1, n1, n2, 
		-- z=1, y=1
		n4, n7, n7, n7, n4, 
		-- z=1, y=2
		n5, n5, n5, n5, n5, 
		-- z=1, y=3
		n5, n5, n5, n5, n5, 
		-- z=1, y=4
		n6, n6, n6, n6, n6, 

		-- z=2, y=0
		n2, n1, n1, n1, n2, 
		-- z=2, y=1
		n4, n7, n7, n7, n4, 
		-- z=2, y=2
		n5, n5, n5, n5, n5, 
		-- z=2, y=3
		n5, n5, n5, n5, n5, 
		-- z=2, y=4
		n6, n6, n6, n6, n6, 

		-- z=3, y=0
		n2, n1, n1, n2, n2, 
		-- z=3, y=1
		n4, n7, n7, n7, n4, 
		-- z=3, y=2
		n5, n5, n5, n5, n5, 
		-- z=3, y=3
		n5, n5, n5, n5, n5, 
		-- z=3, y=4
		n6, n6, n6, n6, n6, 

		-- z=4, y=0
		n2, n2, n2, n2, n1, 
		-- z=4, y=1
		n3, n4, n4, n4, n3, 
		-- z=4, y=2
		n4, n5, n5, n5, n4, 
		-- z=4, y=3
		n4, n5, n5, n5, n4, 
		-- z=4, y=4
		n6, n6, n6, n6, n6, 
}
}
