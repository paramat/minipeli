minipeli 0.1.2 by paramat.
A game for Minetest Engine 5.0.0 and later.

Authors of media (textures)
---------------------------
paramat (CC BY-SA 3.0):
  header.png
  icon.png

About Minipeli
--------------
'Peli' is the Finnish word for 'game'.

This game is intended to be an example of the minimal requirements for a Minetest game, to help others create their own games.
This also suggests a good mod structure, as opposed to the problematic structure of the game called 'Minetest Game', which has most content in one large mod called 'default'. It is better to split the content into many mods.

This game is not as minimal as it could be, the 'creative' mod is not necessary. However, i consider it desirable for most games as freely building without it is very awkward. So the 'creative' mod from Minetest Game has been included, and therefore also the 'sfinv' mod on which it depends, they are almost completely unmodified.

Because creating animated meshes is difficult the player model from Minetest Game is used, it seems suitable for many games.
The player API of Minetest Game is quite fundamental.
So, the 'player_api' mod from Minetest Game is included in a simplified form.

Why Mapgen v6 is not supported
------------------------------

In the 'game.conf' file, mapgen v6 is set as a disallowed mapgen.
Mapgen v6 is very different to all the other mapgens, it has hardcoded biomes and does not use the Biome API. Due to this it makes game code more complex and more difficult to maintain, the mapgen also misses many features.
It is highly recommended that games do not support Mapgen v6 for these reasons.


Note about 'lamp' mod
---------------------

This is not a necessary part of the game, it is only provided in creative mode to illuminate caves and dungeons during testing.


How this game was created
-------------------------

Minetest Game mods used unmodified or slightly modified:

'creative':
Optional-depend on 'hand' mod instead of 'default' mod.
'sfinv'


Minetest Game mods used modified:

'default' (becomes 'hand', 'gui' and 'textures' mods)
'player_api'


'default' mod changes:

Split into 3 mods:

'hand', contains:
Textures:
wieldhand.png
Code:
minetest.register_item

'gui', contains:
Textures:
gui_formbg
gui_hb_bg
Code:
minetest.register_on_joinplayer player:set_formspec_prepend

'textures', contains:
Code:
Required non-functional init.lua.
Textures:
bubble
crack_anylength
heart


'player_api' mod changes:

Now only contains:

Models:
Player model b3d, blend, skin texture
Sounds:
player_damage
Files:
api.lua: Remove 2D sprite player code.
init.lua: From register_on_joinplayer remove:
player:hud_set_hotbar_image("gui_hotbar.png")
player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
