# Ben Was Assimilated

*A hack n slash where you can run around, kill bad guys and get assimilated.*

## About the Game

Ben Was Assimilated is a hack n slash style game where things only move when you do. Includes assimilation.

You take control of Ben and walk around killing everything for some reason (there may be a secret twist at the end of the game which explains why).

### How to Play

- Start hacking and slashing right away
- Around half an hour of gameplay
- No level grinding
- Instant respawn if you die
- Wide variety of enemies, monsters and innocent farm animals to kill
- Wide variety of weapons and equipment to find
- Includes a randomiser which randomises all weapon and equipment
- Includes permadeath option just incase you enjoy playing games over from the start
- Options to flip controls and for AZERTY keyboards

Controls are highlighted in the game itself and you will be given a brief tutorial before you start playing.

### Credits

- Edward Atkin - Programming, music and sound
- Richard Kerry - Music and moral support
- Ben Fearn - Concept design help and moral support
- Kenney.nl - graphics [1-bit asset pack](https://kenney.nl/assets/1-bit-pack)

### Other References

- Derbyshire dialect features prominently through the game. I based a lot of the dialogue on someone I know, but also used a couple of pages for ideas:
  - [http://www.near-chesterfield-derbyshire.com/derbyshire-dialect.html](http://www.near-chesterfield-derbyshire.com/derbyshire-dialect.html)
  - [https://www.derbytelegraph.co.uk/news/derby-news/dictionary-of-derbyshire-words-sayings-1337030](https://www.derbytelegraph.co.uk/news/derby-news/dictionary-of-derbyshire-words-sayings-1337030)
- I found some really nice tools by Cedric Stoquer whilst making this game and I used them for making sound and music:
  - [Bleeper (sounds)](https://pixwlk.itch.io/bleeper)
  - [Pata Tracker (chiptunes)](https://pixwlk.itch.io/pata-tracker)

### Screenshots

![The first boss of the game](https://img.itch.zone/aW1hZ2UvNjc2NDQ5LzQwODAyMzEucG5n/347x500/bOKLPu.png)

![Exploring a graveyard](https://img.itch.zone/aW1hZ2UvNjc2NDQ5LzM3MjgxOTcucG5n/347x500/Iqy7py.png)

![Exploring a house full of spiders](https://img.itch.zone/aW1hZ2UvNjc2NDQ5LzM3MjgxOTgucG5n/347x500/Ms6Ufd.png)

![Attacking enemies with a staff that shoots fireballs](https://img.itch.zone/aW1hZ2UvNjc2NDQ5LzM3MjgxOTYucG5n/347x500/%2FJyU4s.png)

![Exploring a forest](https://img.itch.zone/aW1hZ2UvNjc2NDQ5LzM3MjgxOTQucG5n/347x500/wRD2qf.png)

### Releases

Ben Was Assimilated is available to play in browser and downloadable for Windows, Linux and Raspberry Pi on [itch.io](https://eatkin.itch.io/ben-was-assimilated)

## Source Code

Ben Was Assimilated is built using Gamemaker Studio 2. It was built quite a long time ago, and successive updates can affect things such as order of operations, thus trying to open the game now may result in bugs and unexpected behaviour.

### About the Code

Ben Was Assimilated is turned based, so although it appears everything moves at once, there is a carefully thought out order in which things move. This prevents things such as deceased enemies damaging you. You can view the order in the [moveEverything script](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/moveEverything/moveEverything.gml).

The game is designed to be ultra modular to allow new items, enemies, heroes and weapons to be added easily.

#### Enemies

Enemy behaviour is defined in [enemyGridInit](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/enemyGridInit/enemyGridInit.gml) with parameters outlined in the comment at the top of the script. This means you can easily define new enemies and make them as smart or as stupid as you want and attach whichever weapons you want to them.

For example, if you wanted to make the world's most powerful chicken you could define:

```
addEnemyToGrid(obj_chicken, 1000, 100, 0, 1000, 0, movePathfindToPlayer, movePathfindToPlayer, obj_greatAxe, obj_golemSmash, enemyAttackMelee, enemyAttackProjectile, 0);
```

This will define a simple chicken with a hp of 1000 and attack strength of 100, who can track down the player from 1000 cells away using basic pathfinding, and equipped with an extremely powerful axe weapon, alongwith the golem's earthquake-style smash. It will also evade attacks 100% of the time where possible and always pick the best attack to attack the player.

Scripts can be attached to enemies, which means you can define your own custom scripts for how they move. [moveRandom](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/moveRandom/moveRandom.gml) is the simplest, where the enemy will pick a random direction and attempt to move there. Enemies can also have attack scripts attached such as [enemyAttackMelee](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/enemyAttackMelee/enemyAttackMelee.gml).

#### Other things

- **Equipment** - defined in [equipmentGridInit](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/equipmentGridInit/equipmentGridInit.gml), equipment simply provides armour, but may offer side effects defined in [obj_hero's step event](https://github.com/Eatkin/BenWasAssimilated/blob/master/objects/obj_hero/Step_1.gml#L220-231)
- **Weapons** - weapons are defined in [weaponsGridInit](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/weaponGridInit/weaponGridInit.gml) which defines weapon names, sprites and stats. For projectile weapons, their projectile sprite is defined in [projectilePairsInit](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/projectilePairsInit/projectilePairsInit.gml)
- **Colour palette** - colour pallete is defined in [createColourPalette](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/createColourPalette/createColourPalette.gml). Objects can be drawn in a certain colour using [drawSpriteColour](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/drawSpriteColour/drawSpriteColour.gml) which takes one parameter, an [enum](https://github.com/Eatkin/BenWasAssimilated/blob/master/scripts/enums/enums.gml#L34-43).
- **Dropping additional items** - when killed, certain enemies can drop items. For example the chicken has a chance of dropping a chicken drumstick. This is handled in the [destroy event](https://github.com/Eatkin/BenWasAssimilated/blob/master/objects/obj_chicken/Destroy_0.gml) for that particular object
