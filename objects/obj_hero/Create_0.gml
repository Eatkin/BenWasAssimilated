/// @description

hp=4;
hpmax=hp;
hasBeenHurt=false;
drawHeart=false;

weapon=Weapon.Melee;

currentProjectile=noone;
currentWeapon=noone;

projectileUses=retrieveWeaponUses(currentProjectile);
weaponUses=retrieveWeaponUses(currentWeapon);

projCooldownMax=retrieveWeaponCooldown(currentProjectile);
projCooldown=0;


meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);
meleeCooldown=0;

inputCooldownMax=10;
inputCooldown=inputCooldownMax;
inputCooldownMaxTicker=55;		//This is when there's a ticker item
								//Note the actual cooldown is the DIFFERENCE between this and the regular col

gold=0;

//Additional items
equipmentHolding=noone;
keyItemHolding=noone;

//Various other things
openedALock=false;		//Mostly for the ticker
dead=false;

//Equipment stuff
equipmentArmour=0;
equipmentArmourMax=0;

tickerAdd("GO BEN!");