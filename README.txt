minipeli 0.1.3 by paramat.
A game for Minetest Engine 5.0.0 and later.

Authors of media
----------------
paramat (CC BY-SA 3.0):
  header.png
  icon.png


About Minipeli
--------------
'Peli' is the Finnish word for 'game'.

This game is intended to be an example of the minimal requirements for a Minetest game, to help others create their own games.
This also suggests a good mod structure, as opposed to the problematic structure of the game called 'Minetest Game', which has most content in one large mod called 'default'. It is better to split the content into many mods.

This game is not as minimal as it could be, the 'creative' mod is not necessary. However, i consider it desirable for most games as freely building without it is very awkward. So the 'creative' mod from Minetest Game has been included, and therefore also the 'sfinv' mod on which it depends, they are almost completely unmodified.

The 'lamp' mod is not necessary, it is only provided to illuminate caves and dungeons during testing.

Because creating animated meshes is difficult the player model from Minetest Game is used, it seems suitable for many games.
The player API of Minetest Game is very useful and quite fundamental.
So, the 'player_api' mod from Minetest Game is included in a slightly simplified form.


Why Mapgen v6 is not supported
------------------------------

In the 'game.conf' file, mapgen v6 is set as a disallowed mapgen.
Mapgen v6 is very different to all the other mapgens, it has hardcoded biomes and does not use the Biome API. Due to this it makes game code more complex and more difficult to maintain, the mapgen also misses many features.
It is highly recommended that games do not support Mapgen v6 for these reasons.


The mods
--------

'creative'
Unmodified mod from Minetest Game. Convenient for creative mode building.

'sfinv'
Unmodified mod from Minetest Game. Required by 'creative'.

'player_api'
Slightly simplified version of mod from Minetest Game.
Provides an API to support multiple registered player models and to set the player model, player textures or a particular player animation.
Provides an animated player model and skin texture.
Sets suitable animations according to control inputs and player health.

'gui'
Contains formspec and HUD related stuff:
Formspec background, hotbar background, bubble and heart textures.
Sets the formspec prepend, and can optionally set custom hotbar textures.

'hand'
Contains the hand tool related stuff:
The wieldhand texture.
Registers the hand tool.

'mapgen'
Contains the mapgen related stuff:
Terrain, liquid and dungeon nodes, their textures and sounds.
Mapgen aliases to tell the C++ mapgens which nodes to use.
Biome registrations.

'media'
Contains textures and sounds that have no suitable location anywhere else:
The node-digging progress texture 'crack_anylength'.
The 'player_damage' sound.

'lamp'
Unnecessary mod, only included to provide illumination for testing.


How this game was created
-------------------------

Minetest Game mods used unmodified or slightly modified:

'creative':
Depend on 'hand' mod instead of 'default' mod.
'sfinv'


Minetest Game mods used modified:

'default' (becomes 'hand', 'gui' and 'media' mods)
'player_api'


'default' mod changes:
Split into 3 mods:

'hand', contains:
Textures:
wieldhand.png
init.lua:
minetest.register_item to register the hand tool.

'gui', contains:
Textures:
gui_formbg
gui_hb_bg
bubble
heart
init.lua:
minetest.register_on_joinplayer player:set_formspec_prepend

'media', contains:
Code:
Required non-functional init.lua.
Textures:
crack_anylength
Sounds:
player_damage (from player_api)


'player_api' mod changes:
Now only contains:

Models:
Player model .b3d, .blend, skin texture
api.lua:
Reorder code for clarity, use 'model_name' in 'player_api.register_model'.
From 'player_api.set_model()' remove sprite code and 'if model then ... end'.
init.lua:
From register_on_joinplayer remove:
player:hud_set_hotbar_image("gui_hotbar.png")
player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
