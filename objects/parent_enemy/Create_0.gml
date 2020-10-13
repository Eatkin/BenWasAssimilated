/// @description

// Inherit the parent event
event_inherited();

retrieveEnemyStats();

isGreen=(enemyGetDamage()==0)	?	true	:	false;
showHpBar=false;

projectileUses=retrieveWeaponUses(rangedWeapon);
weaponUses=retrieveWeaponUses(meleeWeapon);

projCooldownMax=retrieveWeaponCooldown(rangedWeapon);
projCooldown=0;

meleeCooldownMax=retrieveWeaponCooldown(meleeWeapon);
meleeCooldown=0;

//Give the enemy some gold
gold=irandom(hp);

dropWeapon=true;

mask_index=spr_block;