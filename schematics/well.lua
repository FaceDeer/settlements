local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}
local n6 = {name="walls:cobble"}
local n7 = {name="stairs:slab_cobble", param2=1}
local n8 = {name="default:water_source"}

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
		n6,
		n6,
		n6,
		n3,

		-- z=0, y=2
		n6,
		n1,
		n1,
		n1,
		n6,

		-- z=0, y=3
		n6,
		n1,
		n1,
		n1,
		n6,

		-- z=0, y=4
		n7,
		n7,
		n7,
		n7,
		n7,

		-- z=1, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=1, y=1
		n6,
		n8,
		n8,
		n8,
		n6,

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
		n7,
		n7,
		n7,
		n7,
		n7,

		-- z=2, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=2, y=1
		n6,
		n8,
		n8,
		n8,
		n6,

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
		n7,
		n7,
		n7,
		n7,
		n7,

		-- z=3, y=0
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		n2,
		n2,

		-- z=3, y=1
		n6,
		n8,
		n8,
		n8,
		n6,

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
		n7,
		n7,
		n7,
		n7,
		n7,

		-- z=4, y=0
		n2,
		n2,
		n2,
		n2,
		{name="default:dirt"},

		-- z=4, y=1
		n3,
		n6,
		n6,
		n6,
		n3,

		-- z=4, y=2
		n6,
		n1,
		n1,
		n1,
		n6,

		-- z=4, y=3
		n6,
		n1,
		n1,
		n1,
		n6,

		-- z=4, y=4
		n7,
		n7,
		n7,
		n7,
		n7,
	},
}

return schematic