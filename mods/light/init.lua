-- Register light

minetest.register_node("light:light", {
	description = "Light",
	tiles = {"light_light.png"},
	paramtype = "light",
	light_source = 14,
	is_ground_content = false,
	groups = {dig_immediate = 2},
})

-- Give to new player

minetest.register_on_newplayer(function(player)
	local inv = player:get_inventory()
	inv:add_item("main", "light:light 64")
end)
