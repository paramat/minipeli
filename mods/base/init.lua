base = {}


-- Formspec prepend

minetest.register_on_joinplayer(function(player)
	player:set_formspec_prepend([[
		bgcolor[#080808BB;true]
		background[5,5;1,1;gui_formbg.png;true]
		background[5,5;1,1;gui_formbg.png;true;10]
		listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] ]])
end)


-- Get hotbar background global function

-- Not currently used by this game, but is often used by node inventory
-- formspecs such as chests, furnace, bones, bookshelves.

function base.get_hotbar_bg(x, y)
	local out = ""
	for i = 0, 7 do
		out = out .."image[" .. x + i .. "," .. y .. ";1,1;gui_hb_bg.png]"
	end
	return out
end
