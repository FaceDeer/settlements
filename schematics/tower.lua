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
	size = {x=7, y=10, z=7},
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
		n1,
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
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=6
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=0, y=8
		{name="stairs:stair_outer_stone_block", param2=20},
		{name="stairs:stair_stone_block", param2=20},
		{name="stairs:stair_stone_block", param2=20},
		{name="stairs:stair_stone_block", param2=20},
		{name="stairs:stair_stone_block", param2=20},
		{name="stairs:stair_stone_block", param2=20},
		{name="stairs:stair_outer_stone_block", param2=21},

		-- z=0, y=9
		n5,
		n1,
		n5,
		n1,
		n5,
		n1,
		n5,

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
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=2
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=3
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=4
		n1,
		n5,
		n5,
		n5,
		n5,
		n5,
		n1,

		-- z=1, y=5
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=6
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=7
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=1, y=8
		{name="stairs:stair_stone_block", param2=23},
		n1,
		n1,
		n1,
		n1,
		n1,
		{name="stairs:stair_stone_block", param2=21},

		-- z=1, y=9
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
		n4,
		n4,
		n4,
		{name="default:dirt"},
		n2,

		-- z=2, y=1
		n1,
		n3,
		n1,
		{name="default:ladder_wood", param2=5},
		n1,
		n3,
		n1,

		-- z=2, y=2
		n1,
		n3,
		n1,
		{name="default:ladder_wood", param2=5},
		n1,
		n3,
		n1,

		-- z=2, y=3
		n1,
		n3,
		{name="default:torch_wall", param2=5},
		{name="default:ladder_wood", param2=5},
		{name="default:torch_wall", param2=5},
		n3,
		n1,

		-- z=2, y=4
		n1,
		n5,
		n4,
		{name="default:ladder_wood", param2=5},
		n4,
		n5,
		n1,

		-- z=2, y=5
		n1,
		n3,
		n1,
		{name="default:ladder_wood", param2=5},
		n1,
		n3,
		n1,

		-- z=2, y=6
		n1,
		n3,
		n1,
		{name="default:ladder_wood", param2=5},
		n1,
		n3,
		n1,

		-- z=2, y=7
		n1,
		n3,
		{name="stairs:slab_stone_block", param2=20},
		{name="default:ladder_wood", param2=5},
		{name="stairs:slab_stone_block", param2=23},
		n3,
		n1,

		-- z=2, y=8
		{name="stairs:stair_stone_block", param2=23},
		n1,
		n1,
		n1,
		n1,
		n1,
		{name="stairs:stair_stone_block", param2=21},

		-- z=2, y=9
		n5,
		n1,
		n1,
		n1,
		n1,
		n1,
		n5,

		-- z=3, y=0
		n2,
		{name="default:dirt"},
		n4,
		n4,
		n4,
		{name="default:dirt"},
		n2,

		-- z=3, y=1
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=2
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=3
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=4
		n1,
		n5,
		n4,
		n4,
		n4,
		n5,
		n1,

		-- z=3, y=5
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=6
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=3, y=7
		n1,
		n3,
		{name="stairs:slab_stone_block", param2=20},
		{name="stairs:slab_stone_block", param2=20},
		{name="stairs:slab_stone_block", param2=20},
		n3,
		n1,

		-- z=3, y=8
		{name="stairs:stair_stone_block", param2=23},
		n1,
		n1,
		n1,
		n1,
		n1,
		{name="stairs:stair_stone_block", param2=21},

		-- z=3, y=9
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
		n4,
		n4,
		n4,
		{name="default:dirt"},
		n2,

		-- z=4, y=1
		n1,
		n3,
		n1,
		n1,
		n1,
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
		n5,
		n4,
		n4,
		n4,
		n5,
		n1,

		-- z=4, y=5
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=4, y=6
		n1,
		n3,
		n1,
		{name="default:torch_wall", param2=4},
		n1,
		n3,
		n1,

		-- z=4, y=7
		n1,
		n3,
		{name="stairs:slab_stone_block", param2=20},
		{name="stairs:slab_stone_block", param2=20},
		{name="stairs:slab_stone_block", param2=20},
		n3,
		n1,

		-- z=4, y=8
		{name="stairs:stair_stone_block", param2=23},
		n1,
		n1,
		n1,
		n1,
		n1,
		{name="stairs:stair_stone_block", param2=21},

		-- z=4, y=9
		n5,
		n1,
		n1,
		n1,
		n1,
		n1,
		n5,

		-- z=5, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		n4,
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=5, y=1
		n1,
		n5,
		n3,
		{name="doors:door_wood_a"},
		n3,
		n5,
		n1,

		-- z=5, y=2
		n1,
		n5,
		n3,
		{name="doors:hidden"},
		n3,
		n5,
		n1,

		-- z=5, y=3
		n1,
		n5,
		n3,
		n3,
		n3,
		n5,
		n1,

		-- z=5, y=4
		n1,
		n5,
		n5,
		n5,
		n5,
		n5,
		n1,

		-- z=5, y=5
		n1,
		n5,
		n3,
		n3,
		n3,
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
		{name="stairs:stair_stone_block", param2=23},
		n1,
		n1,
		n1,
		n1,
		n1,
		{name="stairs:stair_stone_block", param2=21},

		-- z=5, y=9
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=0
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,
		n2,

		-- z=6, y=1
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=2
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=3
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=5
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=6
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=6, y=8
		{name="stairs:stair_outer_stone_block", param2=23},
		{name="stairs:stair_stone_block", param2=22},
		{name="stairs:stair_stone_block", param2=22},
		{name="stairs:stair_stone_block", param2=22},
		{name="stairs:stair_stone_block", param2=22},
		{name="stairs:stair_stone_block", param2=22},
		{name="stairs:stair_outer_stone_block", param2=22},

		-- z=6, y=9
		n5,
		n1,
		n5,
		n1,
		n5,
		n1,
		n5,
	},
}

return schematic