-- Set formspec prepend and hotbar textures

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
	-- Set the string to be added to every mainmenu formspec, used for theming
	player:set_formspec_prepend(formspec)

	-- Set hotbar textures.
	-- To use, uncomment these 2 lines and add textures to the textures folder.
	--player:hud_set_hotbar_image("gui_hotbar.png")
	--player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)
