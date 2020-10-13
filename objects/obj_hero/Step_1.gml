/// @description

var hinput, vinput, swapWeapon, skipTurn;
var input=global.inputMap;
var hasMoved=false;
var addToTicker=false;
var tickerString;

//Skip turn
skipTurn=keyboard_check_pressed(input[? "skip turn"]);
skipTurn=0;		//Actually don't like this so leave it out
hasMoved=skipTurn;

//Swap weapon if we want
swapWeapon=keyboard_check_pressed(input[? "switch weapon"]);

if (swapWeapon)	{
	if (weapon=Weapon.Projectile)	{
		if (currentWeapon!=noone)	{
			hasMoved=true;
			weapon=Weapon.Melee;
			playSound(snd_switchWeapon,0,false);
		}
		else
			playSound(snd_outOfAmmo,0,false);
	}
	else	{
		if (currentProjectile!=noone)	{
			hasMoved=true;
			weapon=Weapon.Projectile;
			playSound(snd_switchWeapon,0,false);
		}
		else
			playSound(snd_outOfAmmo,0,false);
	}
}

//First get hit by weapons
hasBeenHurt=max(hasBeenHurt,checkAttacked());

//If we haven't been hurt, we can get hit by an enemy who occupies the same square instead
var enemy=instance_place(x,y,parent_enemy);
if (!hasBeenHurt and enemy!=noone)	{
	heroGetHurt(enemy.damage);
	hasBeenHurt=true;
	addToTicker=true;
	tickerString="OY WATCH IT MATE";
	
	if (enemy.damage!=0)
		playSound(snd_hurt,0,false);
}

//Basic movement
hinput=keyboard_check(input[? "right"])-keyboard_check(input[? "left"]);
vinput=keyboard_check(input[? "down"])-keyboard_check(input[? "up"]);

if (hasMoved)	{
	hinput=0;
	vinput=0;
}

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
if (inputCooldown!=(inputCooldownMax-1))	{
	hinput=0;
	vinput=0;
}

//IF WE'RE DEAD AND TRY TO MOVE, WE EITHER RESET OR GET ASSIMILATED
if (dead and (hinput!=0 or vinput!=0))	{
	//Either way, delete ALL active projectiles because they get deactivated off screen and reactivate when you come back
	if (instance_exists(parent_attack))	{
		with (parent_attack)	{
			if (isHero(owner))
				instance_destroy();
		}
		//Flags the camera - it will constantly call for region updates until Ben is on screen
		with (obj_camera)
			death=true;
	}
	//DEAD IN BOSS FIGHT
	if (global.inBossFight)	{
		with (obj_checkpoint)
			active=false;
		var check=instance_create_layer(x,y,"weapons",obj_checkpoint);
		check.active=true;
		//We'll go through each boss in order
		if (instance_exists(obj_ben2_boss))	{
			//Set a arrow tile for directing the player
			var lay_id = layer_get_id("otherTiles");
			var map_id = layer_tilemap_get_id(lay_id);
			tilemap_set(map_id,1032,27,42);
			with (obj_ben2_boss)	{
				var ben2=instance_create_layer(x,y,layer,obj_BenII);
				//Replace Ben 2's weapons because randomiser
				if (control.randomiser)	{
					var mel=meleeWeapon;
					var proj=rangedWeapon;
					with (ben2)	{
						currentProjectile=proj;
						currentWeapon=mel;

						projectileUses=retrieveWeaponUses(currentProjectile);
						weaponUses=retrieveWeaponUses(currentWeapon);

						projCooldownMax=retrieveWeaponCooldown(currentProjectile);
						projCooldown=0;


						meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);
					}
				}
				instance_destroy();
			}
			//Clear tile by the graveyard, so we can now go past it!
			clearTile(37,53);
			playSound(snd_respawn,0,false);
		}
		//Ben 3
		if (instance_exists(obj_ben3_boss))	{
			with (obj_ben3_boss)	{
				var ben3=instance_create_layer(x,y,layer,obj_BenIII);
				//Replace Ben 3's weapons because randomiser
				if (control.randomiser)	{
					var mel=meleeWeapon;
					var proj=rangedWeapon;
					with (ben3)	{
						currentProjectile=proj;
						currentWeapon=mel;

						projectileUses=retrieveWeaponUses(currentProjectile);
						weaponUses=retrieveWeaponUses(currentWeapon);

						projCooldownMax=retrieveWeaponCooldown(currentProjectile);
						projCooldown=0;


						meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);
					}
				}
				instance_destroy();
			}
			//Remove that block again
			var cellx=1488/global.gridSize;
			var celly=368/global.gridSize;
			clearTile(cellx,celly);
			playSound(snd_respawn,0,false);
		}
		//Ben IV
		if (instance_exists(obj_ben4_boss))	{
			with (obj_ben4_boss)	{
				instance_create_layer(x,y,layer,obj_BenIV);
				instance_destroy();
			}
			playSound(snd_respawn,0,false);
		}
		dead=false;
		global.inBossFight=false;
		//This clears all attacks
		with (parent_attack)
			if (!collectible)
				instance_destroy();
			
		with (control)
			event_user(0);
		exit;
	}
	else	{
		//DEAD UNDER NORMAL CIRCUMSTANCES
		if (control.permadeath)
			room_goto(rm_gameOver);
		else	{
			x=xstart;
			y=ystart;
			//Destroy any enemies on the starting space and surrounding spaces
			for (var i=-1; i<=1; i+=1)
				for (var j=-1; j<=1; j+=1)	{
					var enemy=instance_place(x+i*global.gridSize,y+j*global.gridSize,parent_enemy);
					if (enemy!=noone)
						instance_destroy(enemy);
				}
			
			hp=hpmax;
			//Ticker based on who you are
			switch (object_index)	{
				case obj_hero:
					tickerAdd("BEN WAS RESURRECTED","GO BEN!");
					break;
				case obj_BenII:
					tickerAdd("BEN II WAS RESURRECTED", "GO BEN II!");
					break;
				case obj_BenIII:
					tickerAdd("BEN III WAS RESURRECTED", "GO BEN III!");
					break;
			}
			playSound(snd_respawn,0,false);
		}
	}
	visible=true;
	dead=false;
	exit;
}

//DON'T UPDATE ANYTHING IF DEAD
if (dead)
	exit;

//Stumble if drunk
if ((equipmentHolding==obj_grappa or equipmentHolding==obj_limoncello) and (hinput!=0 or vinput!=0))	{
	if (irandom(30)==0)	{
		hinput*=-1;
		vinput*=-1;
		addToTicker=true;
		if (equipmentHolding==obj_grappa)
			tickerString="TOO MUCH GRAPPA MATE";
		else
			tickerString="AH THE LIMONCELLOS GOT TO ME";
	}
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

//Check if we've been hit after moving, it's not fair otherwise cause we can walk thru projectiles
hasBeenHurt=max(hasBeenHurt,checkAttacked());

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
				//Swap to projectile
				if (currentProjectile!=noone)
					weapon=Weapon.Projectile;
					
				currentWeapon=noone;
				addToTicker=true;
				tickerString="BUGGER IT ME WEAPON BROKE";
				playSound(snd_outOfAmmo,0,false);
			}
		}
	}
}


//Tell enemies it's their turn to move
if (hasMoved)	{
	drawHeart=false;
	projCooldown=max(0,projCooldown-1);
	meleeCooldown=max(0,meleeCooldown-1);
	moveEverything();
	collectItems();
	if (openedALock)	{
		keyItemHolding=noone;
		openedALock=false;
		tickerAdd("NOW WE ARE COOKING WITH GAS");
		playSound(snd_collectGold,0,false);
	}
	
	//Check for checkpoints
	var check=instance_place(x,y,obj_checkpoint);
	if (check!=noone)
		if (check.active=false)	{
			xstart=check.x;
			ystart=check.y;
			with (obj_checkpoint)
				active=false;
			check.active=true;
			tickerAdd("CHECKPOINT","CRACKING JOB LADS");
		}
}
		
//Stuff
var hpup=instance_place(x,y,obj_healthUp);
if (hpup!=noone and hp<hpmax)	{
	hp+=hpup.hpBoost;
	hp=min(hp,hpmax);
	drawHeart=true;
	addToTicker=true;
	playSound(snd_healthUp,0,false);
	
	#region ticker text depending on what we picked up
	switch (hpup.object_index)	{
		case obj_chickenDrumStick:
			tickerString="CHICKEN FOR ME TEA";
			break;
		case obj_steak:
			tickerString="NICE BIT A SNAP";
			break;
		case obj_cheese:
			tickerString="PIECE O CHAIZE";
			break;
		case obj_ham:
			tickerString="PIECE A HAM";
			break;
		case obj_duckMeat:
			tickerString="AAH NICE BITTA DUCK";
			break;
		case obj_horseSteak:
			tickerString="HORSE IS A RATE ITALIAN DELICACY";
			break;
	}
	#endregion
	
	instance_destroy(hpup);
}

if (hasBeenHurt)	{
	if (equipmentHolding!=noone and equipmentArmour==0)	{
		addToTicker=true;
		tickerString="ME EQUIPMENTS GONE UP T CREEK";
		equipmentHolding=noone;
	}
}

if (addToTicker)
	tickerAdd(tickerString);

if (hasBeenHurt and hp<0 and !dead)	{
	playerDie();
}