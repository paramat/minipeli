minipeli 0.2.2 by paramat.
A game for Minetest Engine 5.1.0 and later.


Authors of media
----------------
paramat (CC BY-SA 3.0):
  header.png
  icon.png


About Minipeli
--------------
'Peli' is the Finnish word for 'game'.

This game is intended to be an example of minimal requirements for a Minetest Engine game, to help others create their own games.
This also suggests a good mod structure, as opposed to the problematic structure of the game called 'Minetest Game', which has most content in one large mod called 'default'. It is better to split the content into many smaller mods.

Because creating animated meshes is difficult, the player model from Minetest Game is used, it seems suitable for many games.
The player API of Minetest Game is very useful and quite fundamental, so the 'player_api' mod from Minetest Game is included, but with new player textures.

The 'light' mod is only provided to illuminate caves and dungeons during testing.

if the 'creative' mod from Minetest Game is used with Minipeli, the dependencies in the 'creative' mod mod.conf file must be edited to: 'depends = hand, sfinv'.


Why Mapgen v6 is not supported
------------------------------

In the 'game.conf' file, mapgen v6 is set as a disallowed mapgen.
Mapgen v6 is very different to all the other mapgens, it has hardcoded biomes and does not use the Biome API. Due to this it makes game code more complex and more difficult to maintain, the mapgen also misses many features.
I recommended that games do not support Mapgen v6 for these reasons.


The mods and their functions
----------------------------

'player_api'
A mod from Minetest Game, mostly unmodified, but new player textures are used.
Provides an API to support multiple registered player models and to set the player model, player textures or a particular player animation.
Provides an animated player model and skin texture.
Sets suitable animations according to control inputs and player health.

'gui'
Contains formspec and HUD related stuff:
Formspec background, hotbar background, bubble and heart textures.
Sets the formspec prepend.
Sets custom hotbar textures if code un-commented and textures added.

'hand'
Contains the hand tool related stuff:
The wieldhand texture.
Registers the hand tool.

'media'
Contains textures and sounds that have no suitable location anywhere else:
The node-digging progress texture 'crack_anylength'.
The 'player_damage' sound.

'mapgen'
Contains the mapgen related stuff:
Terrain, liquid and dungeon nodes, their textures and sounds.
Mapgen aliases to tell the C++ mapgens which nodes to use.
Biome registrations.

'light'
Only included to provide illumination for testing.
Gives 64 lights to a new player.


How this game was created
-------------------------

Minetest Game mods used slightly modified:

'player_api' mod:
Use new player textures, update credits and licence.
Delete unnecessary mod.conf file.


Minetest Game mods used heavily modified:

'default' mod:
Becomes 'gui', 'hand' and 'media' mods.


'default' mod is split into 3 mods:

'gui' mod contains:
Textures:
  gui_formbg
  gui_hb_bg
  bubble
  heart
init.lua:
minetest.register_on_joinplayer to set the formspec prepend. The custom hotbar texture code is commented-out. Also use a temporary fix for minetest.get_player_information occasionally being 'nil'.

'hand' mod contains:
Textures:
  wieldhand.png
init.lua:
minetest.register_item to register the hand tool.

'media' mod contains:
Textures:
  crack_anylength
Sounds:
  player_damage
init.lua:
Required but empty.
