-- Set formspec prepended string, used for theming

minetest.register_on_joinplayer(function(player)
	local formspec = [[
		bgcolor[#080808BB;true]
		listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]
		background[5,5;1,1;gui_formbg.png;true]
	]]
	player:set_formspec_prepend(formspec)
end)
