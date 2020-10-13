/// @description

move_snap(global.gridSize,global.gridSize);

showHpBar=false;
	
var hasMoved=false;

//First attack check
var hasBeenHit=false;
hasBeenHit=checkAttacked();

//Then let's try and attack, with failure conditions
if (irandom(attackFailureRate)==0)
	hasMoved=script_execute(attackScriptPrimary);

if (!hasMoved and irandom(attackFailureRate)==0)
	hasMoved=script_execute(attackScriptSecondary);

//Try primary move script if in range
if (distance_to_object(obj_hero)<range*global.gridSize and !hasMoved)	{
	//The jitter means if the roll is HIGHER than zero, they fail their primary move
	if (irandom(jitter)==0)
		hasMoved=script_execute(moveScriptPrimary);
	
}
		
//Try secondary script if it fails - there's also a chance of failing this as well, but much smaller
if (!hasMoved and irandom(jitter)!=jitter)
	script_execute(moveScriptSecondary);
	
//Second attack check if first failed
if (!hasBeenHit)
	hasBeenHit=checkAttacked();
	
//If we've been hit, show health
if (hasBeenHit)
	showHpBar=true;
	
//Cooldowns
projCooldown=max(0,projCooldown-1);
meleeCooldown=max(0,meleeCooldown-1);

//Also break weapons
if (meleeWeapon!=noone)	{
	//Need to be ==0 because bosses have unbreakable weapons
	if (weaponUses==0)
		meleeWeapon=noone;
}

if (rangedWeapon!=noone)	{
	if (projectileUses<=0)
		rangedWeapon=noone;
}

//Failsafe - I keep finding chickens in trees and things
var rep=0;
repeat (2)	{
	if (collisionAt(x,y))	{
		x=xprevious;
		y=yprevious;
		//If both our current position and previous position are taken up, destroy
		if (rep==1)
			instance_destroy();
	}
	rep+=1;
}