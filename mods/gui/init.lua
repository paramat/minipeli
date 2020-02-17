-- Formspec prepend

minetest.register_on_joinplayer(function(player)
	local formspec = [[
		bgcolor[#080808BB;true]
		listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] ]]
	local name = player:get_player_name()
	local info = minetest.get_player_information(name)
	-- 'info and' is a temporary workaround for an engine bug
	if info and info.formspec_version > 1 then
		formspec = formspec .. "background9[5,5;1,1;gui_formbg.png;true;10]"
	else
		formspec = formspec .. "background[5,5;1,1;gui_formbg.png;true]"
	end
	player:set_formspec_prepend(formspec)

	-- Set hotbar textures
	--player:hud_set_hotbar_image("gui_hotbar.png")
	--player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)
