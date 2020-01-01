local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}

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
		{name="default:tree"},
		{name="default:tree"},
		{name="default:tree"},
		{name="default:tree"},
		{name="default:tree", param2=1},
		{name="default:tree"},
		{name="default:tree"},

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
		{name="default:tree"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="default:tree"},

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
		{name="default:tree"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="default:water_source"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="default:tree"},

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
		{name="default:tree"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="farming:soil_wet"},
		{name="default:tree"},

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
		{name="default:tree", param2=1},
		{name="default:tree", param2=1},
		{name="default:tree", param2=1},
		{name="default:tree", param2=1},
		{name="default:tree"},
		{name="default:tree"},
		{name="default:tree"},

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