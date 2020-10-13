/// @description

// Inherit the parent event
event_inherited();

tickerAdd("BEN III WAS ASSIMILATED BY BEN IV","TIME TO BRING THIS PLACE TO THE GROUND", "LEAVE NOTHING STANDING");

//Update music
with (obj_music)	{
	/* Info
		180bpm
	3bps
	1/3spb
	5 beats to a bar
	Loops from 5->25
	*/
	var musicToPlay=mus_music4;
	loopStart=6.667;
	loopEnd=26.667;
	delay=30;
	music=musicToPlay;
	alarm[0]=delay;
}

var myId=id;
with (obj_hero)
	if (id!=myId)
		instance_destroy();

//I'll overwrite the weapons and things
hp=0;
hpmax=0;

currentProjectile=noone;
currentWeapon=obj_glitch;

projectileUses=retrieveWeaponUses(currentProjectile);
weaponUses=retrieveWeaponUses(currentWeapon);

projCooldownMax=retrieveWeaponCooldown(currentProjectile);
projCooldown=0;


meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);

keyItemHolding=noone;

//Make sure we don't immediately move
inputCooldownMax*=0.5;
inputCooldown=inputCooldownMaxTicker;

//Map is cleared
mapCleared=false;
tileCount=tilemapsAreEmpty();

firstTileX=0;
firstTileY=0;

warningIndex=0;
alarm[0]=15;