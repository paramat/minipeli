-- Nodes

minetest.register_node("mapgen:stone", {
	description = "Stone",
	tiles = {"mapgen_stone.png"},
	groups = {cracky = 3},
})

minetest.register_node("mapgen:stone_block", {
	description = "Stone Block",
	tiles = {"mapgen_stone_block.png"},
	is_ground_content = false,
	groups = {dig_immediate = 2},
})

minetest.register_node("mapgen:stone_block_stair", {
	description = "Stone Block Stair",
	drawtype = "nodebox",
	tiles = {
		"mapgen_stone_block_divided.png",
		"mapgen_stone_block.png",
		"mapgen_stone_block_divided.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {dig_immediate = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
			{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
		},
	},
})

minetest.register_node("mapgen:grass", {
	description = "Grass",
	tiles = {"mapgen_grass.png"},
	groups = {crumbly = 3},
})

minetest.register_node("mapgen:dirt", {
	description = "Dirt",
	tiles = {"mapgen_dirt.png"},
	groups = {crumbly = 3},
})

minetest.register_node("mapgen:sand", {
	description = "Sand",
	tiles = {"mapgen_sand.png"},
	groups = {crumbly = 3},
})

-- Water

minetest.register_node("mapgen:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mapgen_water.png",
			backface_culling = false,
		},
		{
			name = "mapgen_water.png",
			backface_culling = true,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mapgen:water_flowing",
	liquid_alternative_source = "mapgen:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
})

minetest.register_node("mapgen:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"mapgen_water.png"},
	special_tiles = {
		{
			name = "mapgen_water.png",
			backface_culling = false,
		},
		{
			name = "mapgen_water.png",
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mapgen:water_flowing",
	liquid_alternative_source = "mapgen:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {not_in_creative_inventory = 1},
})

-- River water

-- This is an alternative water node required by mapgens with sloping rivers.
-- It has 'liquid_renewable = false' and a short 'liquid_range' to avoid
-- overflowing riverbanks.

minetest.register_node("mapgen:river_water_source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mapgen_river_water.png",
			backface_culling = false,
		},
		{
			name = "mapgen_river_water.png",
			backface_culling = true,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mapgen:river_water_flowing",
	liquid_alternative_source = "mapgen:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
})

minetest.register_node("mapgen:river_water_flowing", {
	description = "Flowing River Water",
	drawtype = "flowingliquid",
	tiles = {"mapgen_river_water.png"},
	special_tiles = {
		{
			name = "mapgen_river_water.png",
			backface_culling = false,
		},
		{
			name = "mapgen_river_water.png",
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mapgen:river_water_flowing",
	liquid_alternative_source = "mapgen:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {not_in_creative_inventory = 1},
})

-- Lava

minetest.register_node("mapgen:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mapgen_lava.png",
			backface_culling = false,
		},
		{
			name = "mapgen_lava.png",
			backface_culling = true,
		},
	},
	paramtype = "light",
	light_source = 13,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mapgen:lava_flowing",
	liquid_alternative_source = "mapgen:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
})

minetest.register_node("mapgen:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"mapgen_lava.png"},
	special_tiles = {
		{
			name = "mapgen_lava.png",
			backface_culling = false,
		},
		{
			name = "mapgen_lava.png",
			backface_culling = false,
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = 13,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mapgen:lava_flowing",
	liquid_alternative_source = "mapgen:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {not_in_creative_inventory = 1},
})


-- Aliases for map generators

-- Only 3 needed because cave liquids and dungeon nodes are defined in biomes

minetest.register_alias("mapgen_stone", "mapgen:stone")
minetest.register_alias("mapgen_water_source", "mapgen:water_source")
minetest.register_alias("mapgen_river_water_source", "mapgen:river_water_source")


-- Biomes

-- Grassland

minetest.register_biome({
	name = "grassland",
	node_top = "mapgen:grass",
	depth_top = 1,
	node_filler = "mapgen:dirt",
	depth_filler = 1,
	node_riverbed = "mapgen:sand",
	depth_riverbed = 2,
	node_cave_liquid = "mapgen:water_source",
	node_dungeon = "mapgen:stone_block",
	node_dungeon_stair = "mapgen:stone_block_stair",
	y_max = 31000,
	y_min = 4,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "grassland_shore",
	node_top = "mapgen:sand",
	depth_top = 1,
	node_filler = "mapgen:sand",
	depth_filler = 2,
	node_riverbed = "mapgen:sand",
	node_cave_liquid = "mapgen:water_source",
	node_dungeon = "mapgen:stone_block",
	node_dungeon_stair = "mapgen:stone_block_stair",
	depth_riverbed = 2,
	vertical_blend = 1,
	y_max = 3,
	y_min = -255,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "grassland_under",
	node_cave_liquid = {"mapgen:water_source", "mapgen:lava_source"},
	node_dungeon = "mapgen:stone_block",
	node_dungeon_stair = "mapgen:stone_block_stair",
	y_max = -256,
	y_min = -31000,
	heat_point = 50,
	humidity_point = 50,
})
