minipeli 0.2.6 by paramat.
A game for Minetest Engine 5.2.0 and later.


Authors of media
----------------
paramat (CC BY-SA 3.0):
  header.png
  icon.png
  screenshot.png


About Minipeli
--------------
'Peli' is the Finnish word for 'game'.

This game is intended to be one example of minimal requirements for a Minetest Engine game, while still supporting all non-Mapgen V6 mapgens and providing a minimal number of biomes with appropriate vertical variation.
The intention is to help others and myself create completely new games.

This also suggests a good mod structure, as opposed to the problematic structure of Minetest Game, which has most content in one large mod. It is better to divide content into several mods that correspond to the distinct elements of the game.

Because creating animated meshes is difficult, the player model from Minetest Game is used, it seems suitable for many games.
The player API of Minetest Game is very useful and quite fundamental, so the 'player_api' mod from Minetest Game is included, but with new player textures.

The 'light' mod is only provided to illuminate caves and dungeons during testing.


Why Mapgen V6 is not supported
------------------------------

In the 'game.conf' file, mapgen v6 is set as a disallowed mapgen.
Mapgen V6 is very different to all the other mapgens, it has hardcoded biomes and does not use the Biome API. Due to this it makes game code far more complex and more difficult to maintain, the mapgen also misses many features.
I recommended that games do not support Mapgen V6 for these reasons.
This document is written assuming Mapgen V6 is not supported.


The mods and their functions
----------------------------

'player_api'
A mod from Minetest Game, mostly unmodified, but new player textures are used.
Provides an API to support multiple registered player models and to set the player model, player textures or a particular player animation.
Provides an animated player model and skin texture.
Sets suitable animations according to control inputs and player health.

'gui'
Contains formspec and HUD related stuff:
Formspec background, bubble and heart textures.
Sets the formspec prepend.

'hand'
Contains the hand related stuff:
The wieldhand texture.
Registers the hand.

'creative_mode'
Activates in creative mode.
A simple creative mod without a creative inventory.
Overrides the hand registration for special digging capabilities.
Enables placing unlimited nodes without removing from inventory.
Prevents dug nodes being added to inventory if already present.

'media'
Contains textures and sounds that have no suitable location anywhere else:
The node-digging progress texture 'crack_anylength'.
The 'player_damage' sound.

'mapgen'
Contains the mapgen related stuff:
Terrain, water, cave liquid and dungeon nodes, their textures and sounds.
Mapgen aliases to tell the engine mapgens which nodes to use.
Biome registrations for one vertical stack of biomes.

'light'
Only included to provide illumination for testing.
Gives 64 lights to a new player.


Mapgen aliases
--------------

Since MT 5.0.0, dungeon nodes and cave liquids are defined in biome definitions, so now only 3 mapgen aliases need to be registered: stone, water, river water.


Biomes
------

This game registers a single 'biome stack': A set of vertically stacked biomes all with the same heat and humidity points.
A more developed game would usually add extra biome stacks at differing heat and humidity points.

The 'grassland' biome stack in this game consists of:

"grassland":
Dry land of dirt with a grass surface layer.
Extends from beach top up to world top.
Any flooded caves contain water.

"grassland_sea":
With the sand of beaches, lakebeds and seabeds.
Extends from beach top down to y = -127 to contain most sea depths.
Sand may occasionally appear in caves due to how mapgen works.
Any flooded caves contain water.

"grassland_under":
Meaning 'underground'.
Stone only, below most sea depths.
Extends from y = -128 down to y = -1023.
Any flooded caves contain water.

"grassland_deep":
Meaning 'deep underground'.
Stone only.
Extends from y = -1024 down to world base.
The depth where magma appears, any flooded caves can contain water or magma.


How this game was created
-------------------------

Minetest Game mods used slightly modified:

'player_api' mod:
Use new player textures, update credits and licence.
Delete unnecessary mod.conf file.


Minetest Game mods used heavily modified:

'default' mod:
The minipeli 'gui', 'hand' and 'media' mods are derived from it.
'creative' mod:
The minipeli 'creative_mode' mod is derived from it.


'gui' mod contains:
Textures:
  gui_formbg.png
  bubble.png
  heart.png
init.lua:
minetest.register_on_joinplayer to set the formspec prepend.

'hand' mod contains:
Textures:
  wieldhand.png
init.lua:
minetest.register_item to register the hand.

'media' mod contains:
Textures:
  crack_anylength.png
Sounds:
  player_damage.ogg
init.lua:
Required but empty.

'creative_mode' mod contains:
init.lua:
minetest.override_item() to override the hand.
minetest.register_on_placenode() for placing unlimited nodes without removing from inventory.
Redefinition of minetest.handle_node_drops() to prevent dug nodes being added to inventory if already present.
Creative inventory and per-player creative mode are not included for simplicity.
Players can use chat command '/giveme' to obtain nodes they want to place, and can drop an inventory itemstack to clear space in inventory.
