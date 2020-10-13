/// @description

// Inherit the parent event
event_inherited();

tickerAdd("BEN II WAS ASSIMILATED BY BEN III","GO BEN III!");

//MUSIC update
with (obj_music)	{
	/* Info
	155
	2.58333... bps (repeating fraction)
	60/155 spb basically
	loops from 5->29
	*/
	var musicToPlay=mus_music3;
	loopStart=6.194;
	loopEnd=43.355;
	delay=30;
	music=musicToPlay;
	alarm[0]=delay;
}

var myId=id;
with (obj_hero)
	if (id!=myId)
		instance_destroy();

//I'll overwrite the weapons and things
hp=8;
hpmax=8;

currentProjectile=obj_dualStaff;
currentWeapon=obj_greatAxe;

projectileUses=retrieveWeaponUses(currentProjectile);
weaponUses=retrieveWeaponUses(currentWeapon);

projCooldownMax=retrieveWeaponCooldown(currentProjectile);
projCooldown=0;


meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);

keyItemHolding=obj_redKey;

//Make sure we don't immediately move
inputCooldown=inputCooldownMaxTicker;