local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}

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
		{name="default:tree", param2=3},
		n3,
		n3,
		n3,
		{name="default:tree", param2=3},
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
		{name="stairs:stair_wood", param2=1},
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		{name="default:wood"},
		{name="stairs:stair_wood", param2=3},

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
		{name="default:tree", param2=3},
		n3,
		n3,
		n3,
		{name="default:tree", param2=1},
		n1,

		-- z=5, y=2
		n1,
		{name="default:tree", param2=3},
		n3,
		{name="xpanes:pane_flat"},
		n3,
		{name="default:tree", param2=1},
		n1,

		-- z=5, y=3
		n1,
		{name="default:tree", param2=3},
		n3,
		n3,
		n3,
		{name="default:tree", param2=1},
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