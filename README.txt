minipeli 0.1.1 by paramat.
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

This game is not as minimal as it could be, the 'creative' mod is not necessary. However, i consider it as probably desirable for most games as freely building without it is very awkward. So the 'creative' mod from Minetest Game has been included, and therefore also 'sfinv' on which it depends, they are almost completely unmodified.

Because creating animated meshes is difficult the player model from Minetest Game is used, it seems suitable for many games.
The player API of Minetest Game is quite fundamental.
So, the 'player_api' mod from Minetest Game is included in a simplified form.

See the 'development.txt' document for details of how this game was created and other useful information.
