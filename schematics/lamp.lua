local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}

schematic = {
	size = {x=3, y=7, z=3},
	yslice_prob = {},
	data = {

		-- z=0, y=0
		n2,
		n2,
		n2,

		-- z=0, y=1
		n1,
		{name="stairs:stair_cobble"},
		n1,

		-- z=0, y=2
		n1,
		n1,
		n1,

		-- z=0, y=3
		n1,
		{name="stairs:stair_cobble", param2=20},
		n1,

		-- z=0, y=4
		n1,
		{name="walls:cobble"},
		n1,

		-- z=0, y=5
		n1,
		{name="stairs:stair_cobble"},
		n1,

		-- z=0, y=6
		n1,
		n1,
		n1,

		-- z=1, y=0
		n2,
		{name="default:dirt"},
		n2,

		-- z=1, y=1
		{name="stairs:stair_cobble", param2=1},
		n3,
		{name="stairs:stair_cobble", param2=3},

		-- z=1, y=2
		n1,
		n3,
		n1,

		-- z=1, y=3
		{name="stairs:stair_cobble", param2=23},
		{name="default:coalblock"},
		{name="stairs:stair_cobble", param2=21},

		-- z=1, y=4
		{name="walls:cobble"},
		{name="fire:permanent_flame"},
		{name="walls:cobble"},

		-- z=1, y=5
		{name="stairs:stair_cobble", param2=1},
		n1,
		{name="stairs:stair_cobble", param2=3},

		-- z=1, y=6
		n1,
		{name="stairs:slab_cobble"},
		n1,

		-- z=2, y=0
		n2,
		n2,
		n2,

		-- z=2, y=1
		n1,
		{name="stairs:stair_cobble", param2=2},
		n1,

		-- z=2, y=2
		n1,
		n1,
		n1,

		-- z=2, y=3
		n1,
		{name="stairs:stair_cobble", param2=22},
		n1,

		-- z=2, y=4
		n1,
		{name="walls:cobble"},
		n1,

		-- z=2, y=5
		n1,
		{name="stairs:stair_cobble", param2=2},
		n1,

		-- z=2, y=6
		n1,
		n1,
		n1,
	},
}

return schematic