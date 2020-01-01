local n1 = {name="air"}
local n2 = {name="default:dirt_with_grass"}
local n3 = {name="default:cobble"}
local n4 = {name="default:junglewood"}
local n5 = {name="default:stone_block"}

schematic = {
	size = {x=7, y=7, z=7},
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
		{name="stairs:stair_stone_block"},
		{name="stairs:stair_stone_block"},
		{name="stairs:stair_stone_block"},
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

		-- z=1, y=0
		n2,
		{name="default:dirt"},
		n2,
		{name="default:dirt"},
		{name="default:dirt"},
		{name="default:dirt"},
		n2,

		-- z=1, y=1
		n1,
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		n1,

		-- z=1, y=2
		n1,
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},
		n1,

		-- z=1, y=3
		n1,
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},
		n1,

		-- z=1, y=4
		n1,
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},
		n1,

		-- z=1, y=5
		n1,
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		n1,

		-- z=1, y=6
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
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		n1,

		-- z=2, y=2
		n1,
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},
		n1,

		-- z=2, y=3
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=2, y=5
		n1,
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		{name="stairs:slab_cobble", param2=3},
		n1,

		-- z=2, y=6
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
		{name="default:grass_1"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		n1,

		-- z=3, y=2
		n1,
		{name="walls:cobble"},
		{name="walls:cobble"},
		{name="walls:cobble"},
		n1,
		{name="walls:cobble"},
		n1,

		-- z=3, y=3
		n1,
		{name="xpanes:bar_flat", param2=1},
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=3, y=5
		n1,
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		n1,

		-- z=3, y=6
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
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		n1,

		-- z=4, y=2
		n1,
		{name="walls:cobble"},
		{name="default:lava_source"},
		{name="walls:cobble"},
		n1,
		{name="walls:cobble"},
		n1,

		-- z=4, y=3
		n1,
		{name="xpanes:bar_flat", param2=3},
		n1,
		{name="xpanes:bar_flat", param2=1},
		n1,
		n1,
		n1,

		-- z=4, y=4
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,
		n1,

		-- z=4, y=5
		n1,
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		{name="stairs:slab_cobble", param2=21},
		n1,

		-- z=4, y=6
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
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		{name="default:stonebrick"},
		n1,

		-- z=5, y=2
		n1,
		n3,
		n3,
		n3,
		{name="default:furnace"},
		n3,
		n1,

		-- z=5, y=3
		n1,
		n3,
		n3,
		n3,
		n3,
		n3,
		n1,

		-- z=5, y=4
		n1,
		n3,
		n3,
		n3,
		n3,
		n3,
		n1,

		-- z=5, y=5
		n1,
		{name="walls:cobble"},
		n1,
		n1,
		n1,
		{name="walls:cobble"},
		n1,

		-- z=5, y=6
		n1,
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
		{name="stairs:slab_cobble", param2=1},
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
		{name="default:grass_1"},
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
	},
}

return schematic