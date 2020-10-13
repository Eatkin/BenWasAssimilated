/// @description This is a simplified version of movement:
//Kills enemies you step on
//Don't get hurt
var hinput, vinput, swapWeapon;
var input=global.inputMap;
var hasMoved=false;
var addToTicker=false;
var tickerString;

//Swap weapon if we want
swapWeapon=keyboard_check_pressed(input[? "switch weapon"]);

if (swapWeapon)	{
	if (weapon=Weapon.Projectile)	{
		if (currentWeapon!=noone)	{
			weapon=Weapon.Melee;
			playSound(snd_switchWeapon,0,false);
		}
		else
			playSound(snd_outOfAmmo,0,false);
	}
	else	{
		if (currentProjectile!=noone)	{
			weapon=Weapon.Projectile;
			playSound(snd_switchWeapon,0,false);
		}
		else
			playSound(snd_outOfAmmo,0,false);
	}
}

//If we haven't been hurt, we can get hit by an enemy who occupies the same square instead
var enemy=instance_place(x,y,parent_enemy);
if (enemy!=noone)
	instance_destroy(enemy);

if (checkAttacked())	{
	addToTicker=true;
	tickerString="BLOCKED";
	}
	
var attackDirection=-1;
if (keyboard_check_pressed(input[? "shoot right"]))
	attackDirection=0;
else if (keyboard_check_pressed(input[? "shoot up"]))
	attackDirection=90;
else if (keyboard_check_pressed(input[? "shoot left"]))
	attackDirection=180;
else if (keyboard_check_pressed(input[? "shoot down"]))
	attackDirection=270;


//if it's -1, we do no collision checks so it defaults to saying there is a collision so nothing happens
if (attackDirection!=-1 and !hasMoved)	{
	
	var weaponToUse=-1;
	if (weapon==Weapon.Projectile and projCooldown==0)
		var weaponToUse=currentProjectile;	
	if (weapon==Weapon.Melee and meleeCooldown==0)
		var weaponToUse=currentWeapon;
	if (weaponToUse!=-1)
		hasMoved=useAttack(attackDirection, weaponToUse, weapon);
	
	//Deduct one ammo
	if (hasMoved)	{
		if (weapon==Weapon.Projectile)	{
			projectileUses-=1;
			if (projectileUses==0)	{
				weapon=Weapon.Melee;
				currentProjectile=noone;
				addToTicker=true;
				tickerString="EEH IM OUT OF AMMO";
				playSound(snd_outOfAmmo,0,false);
			}
		}
		else	{
			weaponUses-=1;
			if (weaponUses==0)	{
				currentWeapon=noone;
				addToTicker=true;
				tickerString="BUGGER IT ME WEAPON BROKE";
				playSound(snd_outOfAmmo,0,false);
			}
		}
	}
}

//Basic movement
hinput=keyboard_check(input[? "right"])-keyboard_check(input[? "left"]);
vinput=keyboard_check(input[? "down"])-keyboard_check(input[? "up"]);

//Okay so if we aren't pressing anything, set cooldown to max, else take one off
if (hinput==0 and vinput==0)
	inputCooldown=inputCooldownMax;
else
	inputCooldown-=1;

//If input cooldown hits 0, we go back to max
if (inputCooldown==0)
	inputCooldown=inputCooldownMax;

//If input cooldown is not at max
//The -1 is super important, otherwise we won't move - when we're holding anything it takes 1 off the inputCooldow
//So inputcooldown is not at max on first key press!
//Which is because I'm a programming idiot probably
if (inputCooldown!=(inputCooldownMax-1) or hasMoved)	{
	hinput=0;
	vinput=0;
}

//x collision check
var xto=x+hinput*global.gridSize;
if (collisionAt(xto,y))
	xto=x;

//y collision check
//Prioritise hinput, i.e. blank vinput if hinput!=0
vinput*=1-abs(hinput);
var yto=y+vinput*global.gridSize;
if (collisionAt(x,yto))
	yto=y;


x=xto;
y=yto;

if (x!=xprevious or y!=yprevious)	{
	hasBeenHurt=false;		//Reset this so you can be hurt after moving again
	hasMoved=true;
	playSound(snd_stepNoise,0,false);
}

if (checkAttacked())	{
	addToTicker=true;
	tickerString="BLOCKED";
	}

//Tell enemies it's their turn to move
if (hasMoved)	{
	drawHeart=false;
	projCooldown=max(0,projCooldown-1);
	meleeCooldown=max(0,meleeCooldown-1);
	moveEverything();
	tileCount=tilemapsAreEmpty();
	if (!mapCleared and tileCount==0)	{
		mapCleared=true;
		tickerAdd(	"YOU WANT TO KNOW ABOUT REALITY","I AM REALITY",
					"YOU WANT TO KNOW ABOUT DEATH", "I AM DEATH",
					"YOU WANT TO KNOW ABOUT GOD", "I AM GOD",
					"DO NOT EVEN LOOK UPON ME WITH YOUR NAKED EYE");
	}
}

if (mapCleared and ds_list_empty(global.tickerList))	{
	room_goto(rm_end);
}

if (addToTicker and !mapCleared)
	tickerAdd(tickerString);