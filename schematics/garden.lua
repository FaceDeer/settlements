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
	size = {x=7, y=3, z=7},
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

		-- z=1, y=0
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},

		-- z=1, y=1
		n13,
		n13,
		n13,
		n13,
		n12,
		n13,
		n13,

		-- z=1, y=2
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=0
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},

		-- z=2, y=1
		n13,
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		n13,

		-- z=2, y=2
		n1,
		{name="farming:wheat_3", param2=3},
		{name="farming:wheat_2", param2=3},
		{name="farming:wheat_3", param2=3},
		{name="farming:wheat_2", param2=3},
		{name="farming:wheat_3", param2=3},
		n1,

		-- z=3, y=0
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},

		-- z=3, y=1
		n13,
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		n8,
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		n13,

		-- z=3, y=2
		n1,
		{name="farming:wheat_2", param2=3},
		{name="farming:wheat_3", param2=3},
		n1,
		{name="farming:wheat_3", param2=3},
		{name="farming:wheat_2", param2=3},
		n1,

		-- z=4, y=0
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},

		-- z=4, y=1
		n13,
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		n13,

		-- z=4, y=2
		n1,
		{name="farming:wheat_1", param2=3},
		{name="farming:wheat_2", param2=3},
		{name="farming:wheat_3", param2=3},
		{name="farming:wheat_2", param2=3},
		{name="farming:wheat_1", param2=3},
		n1,

		-- z=5, y=0
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},

		-- z=5, y=1
		n12,
		n12,
		n12,
		n12,
		n13,
		n13,
		n13,

		-- z=5, y=2
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
	},
}

return schematic