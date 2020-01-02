local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}
local n6 = {name="walls:cobble"}
local n7 = {name="stairs:slab_cobble", param2=1}
local n8 = {name="default:water_source"}
local n9 = {name="stairs:stair_wood", param2=1}
local n10 = {name="stairs:stair_wood", param2=3}
local n11 = {name="stairs:stair_junglewood", param2=20}
local n12 = {name="default:tree", param2=1}
local n13 = {name="default:tree"}
local n14 = {name="default:tree", param2=12}
local n15 = {name="xpanes:pane_flat"}
local n16 = {name="default:tree", param2=3}
local n17 = {name="default:tree", param2=20}

schematic = {
	size = {x=7, y=13, z=10},
	yslice_prob = {},
	data = {

		-- z=0, y=0
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,

		-- z=0, y=1
		n1,
		n1,
		n1,
		{name="stairs:stair_cobble"},
		n1,
		n1,
		n1,

		-- z=0, y=2
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=3
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=5
		n9,
		n1,
		n1,
		n1,
		n1,
		n1,
		n10,

		-- z=0, y=6
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=0, y=7
		n1,
		n1,
		n9,
		{name="stairs:slab_wood", param2=20},
		n10,
		n1,
		n1,

		-- z=0, y=8
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=10
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=1, y=1
		n1,
		n5,
		n3,
		n4,
		n3,
		n5,
		n1,

		-- z=1, y=2
		n1,
		n5,
		n3,
		{name="doors:door_wood_a", param2=2},
		n3,
		n5,
		n1,

		-- z=1, y=3
		n1,
		n5,
		n3,
		{name="doors:hidden", param2=2},
		n3,
		n5,
		n1,

		-- z=1, y=4
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=5
		n9,
		n5,
		n3,
		{name="default:glass"},
		n3,
		n5,
		n10,

		-- z=1, y=6
		n1,
		n9,
		n3,
		n3,
		n3,
		n10,
		n1,

		-- z=1, y=7
		n1,
		n1,
		n9,
		n3,
		n10,
		n1,
		n1,

		-- z=1, y=8
		n1,
		n1,
		n1,
		{name="stairs:slab_wood"},
		n1,
		n1,
		n1,

		-- z=1, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=10
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=2, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=2, y=2
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=2, y=3
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=2, y=4
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=2, y=5
		n9,
		n1,
		n1,
		n1,
		n1,
		n1,
		n10,

		-- z=2, y=6
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=2, y=7
		n1,
		n1,
		n9,
		n1,
		n10,
		n1,
		n1,

		-- z=2, y=8
		n1,
		n1,
		n1,
		{name="stairs:slab_wood"},
		n1,
		n1,
		n1,

		-- z=2, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=10
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=3, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=3, y=2
		n1,
		n3,
		{name="stairs:stair_wood", param2=2},
		n1,
		{name="stairs:stair_wood", param2=2},
		n3,
		n1,

		-- z=3, y=3
		n1,
		{name="default:glass"},
		n1,
		n1,
		n1,
		{name="default:glass"},
		n1,

		-- z=3, y=4
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=5
		n9,
		n1,
		n1,
		n1,
		n1,
		n1,
		n10,

		-- z=3, y=6
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=3, y=7
		n1,
		n1,
		n9,
		n1,
		n10,
		n1,
		n1,

		-- z=3, y=8
		n1,
		n1,
		n1,
		{name="stairs:slab_wood"},
		n1,
		n1,
		n1,

		-- z=3, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=10
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=4, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=4, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=4, y=2
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=4, y=3
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=4, y=4
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=4, y=5
		n9,
		n1,
		n1,
		n1,
		n1,
		n1,
		n10,

		-- z=4, y=6
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=4, y=7
		n1,
		n1,
		n9,
		n1,
		n10,
		n1,
		n1,

		-- z=4, y=8
		n1,
		n1,
		n1,
		{name="stairs:slab_wood", param2=1},
		n1,
		n1,
		n1,

		-- z=4, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=4, y=10
		{name="stairs:stair_outer_wood", param2=1},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_outer_wood"},

		-- z=4, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=4, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=5, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=5, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=5, y=2
		n1,
		n3,
		{name="stairs:stair_wood", param2=2},
		n1,
		{name="stairs:stair_wood", param2=2},
		n3,
		n1,

		-- z=5, y=3
		n1,
		{name="default:glass"},
		n1,
		n1,
		n1,
		{name="default:glass"},
		n1,

		-- z=5, y=4
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=5, y=5
		n1,
		n5,
		{name="stairs:stair_cobble", param2=21},
		n1,
		{name="stairs:stair_cobble", param2=23},
		n5,
		n1,

		-- z=5, y=6
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=5, y=7
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=5, y=8
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=5, y=9
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=5, y=10
		n9,
		n3,
		n3,
		n3,
		n3,
		n3,
		n10,

		-- z=5, y=11
		n1,
		{name="stairs:stair_outer_wood", param2=1},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_outer_wood"},
		n1,

		-- z=5, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=6, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=6, y=2
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=3
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=4
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=5
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=6
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=7
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=8
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=9
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=6, y=10
		n9,
		n3,
		n1,
		n1,
		n1,
		n3,
		n10,

		-- z=6, y=11
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=6, y=12
		n1,
		n1,
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		n1,
		n1,

		-- z=7, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=7, y=1
		n1,
		n3,
		n4,
		n4,
		n4,
		n3,
		n1,

		-- z=7, y=2
		n1,
		n3,
		n1,
		{name="stairs:stair_obsidian"},
		n1,
		n3,
		n1,

		-- z=7, y=3
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=4
		n1,
		n3,
		{name="default:torch_wall", param2=4},
		n1,
		{name="default:torch_wall", param2=4},
		n3,
		n1,

		-- z=7, y=5
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=6
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=7
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=8
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=9
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=7, y=10
		n9,
		n3,
		n1,
		n1,
		n1,
		n3,
		n10,

		-- z=7, y=11
		n1,
		n9,
		n1,
		n1,
		n1,
		n10,
		n1,

		-- z=7, y=12
		n1,
		n1,
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		n1,
		n1,

		-- z=8, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=8, y=1
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=2
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=3
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=4
		n1,
		n5,
		n3,
		{name="default:glass"},
		n3,
		n5,
		n1,

		-- z=8, y=5
		n1,
		n5,
		{name="default:glass"},
		{name="default:glass"},
		{name="default:glass"},
		n5,
		n1,

		-- z=8, y=6
		n1,
		n5,
		n3,
		{name="default:glass"},
		n3,
		n5,
		n1,

		-- z=8, y=7
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=8
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=9
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=8, y=10
		n9,
		n3,
		n3,
		n3,
		n3,
		n3,
		n10,

		-- z=8, y=11
		n1,
		{name="stairs:stair_outer_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_outer_wood", param2=3},
		n1,

		-- z=8, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=0
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,

		-- z=9, y=1
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=2
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=3
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=5
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=6
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=8
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=10
		{name="stairs:stair_outer_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_outer_wood", param2=3},

		-- z=9, y=11
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=9, y=12
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
	},
}

return schematic