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
	size = {x=7, y=8, z=7},
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
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},

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

		-- z=1, y=0
		n2,
		n4,
		n4,
		n4,
		n4,
		n4,
		n2,

		-- z=1, y=1
		n1,
		{name="default:tree", param2=2},
		n3,
		{name="doors:door_wood_a", param2=2},
		n3,
		{name="default:tree", param2=2},
		n1,

		-- z=1, y=2
		n1,
		{name="default:tree", param2=2},
		n3,
		{name="doors:hidden", param2=2},
		n3,
		{name="default:tree", param2=2},
		n1,

		-- z=1, y=3
		n1,
		n16,
		n3,
		n3,
		n3,
		n16,
		n1,

		-- z=1, y=4
		n1,
		{name="default:tree", param2=7},
		n1,
		{name="default:tree", param2=7},
		n1,
		{name="default:tree", param2=9},
		n1,

		-- z=1, y=5
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},

		-- z=1, y=6
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=0
		n2,
		n4,
		n4,
		n4,
		n4,
		n4,
		n2,

		-- z=2, y=1
		n1,
		n3,
		n1,
		n1,
		{name="stairs:stair_wood", param2=2},
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
		{name="default:tree", param2=9},
		n1,
		{name="default:tree", param2=7},
		n1,
		{name="default:tree", param2=9},
		n1,

		-- z=2, y=5
		n1,
		n3,
		n1,
		n1,
		n1,
		n3,
		n1,

		-- z=2, y=6
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},
		{name="stairs:stair_wood"},

		-- z=2, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=0
		n2,
		n4,
		n4,
		n4,
		n4,
		n4,
		n2,

		-- z=3, y=1
		n1,
		n3,
		{name="beds:bed_bottom"},
		n1,
		{name="default:fence_wood"},
		n3,
		n1,

		-- z=3, y=2
		n1,
		{name="xpanes:pane_flat", param2=3},
		n1,
		n1,
		{name="doors:trapdoor", param2=1},
		{name="xpanes:pane_flat", param2=3},
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
		{name="default:tree", param2=9},
		{name="default:torch_wall", param2=2},
		{name="default:tree", param2=9},
		{name="default:torch_wall", param2=3},
		{name="default:tree", param2=9},
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
		n9,
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		n10,

		-- z=4, y=0
		n2,
		n4,
		n4,
		n4,
		n4,
		n4,
		n2,

		-- z=4, y=1
		n1,
		n3,
		{name="beds:bed_top"},
		n1,
		{name="default:chest", param2=1},
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
		{name="default:tree", param2=9},
		n1,
		{name="default:tree", param2=9},
		n1,
		{name="default:tree", param2=9},
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
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},

		-- z=4, y=7
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=5, y=0
		n2,
		n4,
		n4,
		n4,
		n4,
		n4,
		n2,

		-- z=5, y=1
		n1,
		n16,
		n3,
		n3,
		n3,
		n12,
		n1,

		-- z=5, y=2
		n1,
		n16,
		n3,
		n15,
		n3,
		n12,
		n1,

		-- z=5, y=3
		n1,
		n16,
		n3,
		n3,
		n3,
		n12,
		n1,

		-- z=5, y=4
		n1,
		{name="default:tree", param2=9},
		n1,
		{name="default:tree", param2=9},
		n1,
		{name="default:tree", param2=9},
		n1,

		-- z=5, y=5
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},

		-- z=5, y=6
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=5, y=7
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
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},
		{name="stairs:stair_wood", param2=2},

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
	},
}

return schematic