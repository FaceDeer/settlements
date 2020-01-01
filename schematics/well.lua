local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}

schematic = {
	size = {x=5, y=5, z=5},
	yslice_prob = {},
	data = {

		-- z=0, y=0
		{name="default:dirt"},
		n2,
		n2,
		n2,
		{name="default:dirt"},

		-- z=0, y=1
		n3,
		{name="walls:cobble"},
		{name="walls:cobble"},
		{name="walls:cobble"},
		n3,

		-- z=0, y=2
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},

		-- z=0, y=3
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},

		-- z=0, y=4
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},

		-- z=1, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=1, y=1
		{name="walls:cobble"},
		{name="default:water_source"},
		{name="default:water_source", param2=240},
		{name="default:water_source"},
		{name="walls:cobble"},

		-- z=1, y=2
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=3
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=1, y=4
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},

		-- z=2, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=2, y=1
		{name="walls:cobble"},
		{name="default:water_source", param2=240},
		{name="default:water_source", param2=240},
		{name="default:water_source", param2=240},
		{name="walls:cobble"},

		-- z=2, y=2
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=3
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=4
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},

		-- z=3, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		n2,
		n2,

		-- z=3, y=1
		{name="walls:cobble"},
		{name="default:water_source"},
		{name="default:water_source", param2=240},
		{name="default:water_source"},
		{name="walls:cobble"},

		-- z=3, y=2
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=3
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=4
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},

		-- z=4, y=0
		n2,
		n2,
		n2,
		n2,
		{name="default:dirt"},

		-- z=4, y=1
		n3,
		{name="walls:cobble"},
		{name="walls:cobble"},
		{name="walls:cobble"},
		n3,

		-- z=4, y=2
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},

		-- z=4, y=3
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},

		-- z=4, y=4
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
	},
}

return schematic