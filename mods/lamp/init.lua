-- Lamp

minetest.register_node("lamp:lamp", {
	description = "Lamp",
	tiles = {"lamp_lamp.png"},
	paramtype = "light",
	light_source = 14,
	is_ground_content = false,
	groups = {dig_immediate = 2},
})
