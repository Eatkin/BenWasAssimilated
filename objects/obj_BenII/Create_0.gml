/// @description

// Inherit the parent event
event_inherited();

tickerAdd("BEN WAS ASSIMILATED BY BEN II","GO BEN II!");
with (obj_music)	{
	/* Info for mus_gameboy
	108bs
	6/10 s p b
	0.6*108=64.8s
	*/
	var musicToPlay=mus_gameboy;
	loopStart=0;
	loopEnd=64.8
	delay=30;
	music=musicToPlay;
	alarm[0]=delay;
}

var myId=id;
with (obj_hero)
	if (id!=myId)
		instance_destroy();

//I'll overwrite the weapons and things
hp=6;
hpmax=6;

currentProjectile=obj_basicBow;
currentWeapon=obj_spikedClub;

projectileUses=retrieveWeaponUses(currentProjectile);
weaponUses=retrieveWeaponUses(currentWeapon);

projCooldownMax=retrieveWeaponCooldown(currentProjectile);
projCooldown=0;


meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);

keyItemHolding=obj_blueKey;

//Make sure we don't immediately move
inputCooldown=inputCooldownMaxTicker;