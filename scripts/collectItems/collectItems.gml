//Returns true is we collected something
//Be extremely careful of where to use object index 

var _weapon=instance_place(x,y,parent_attack);
var _gold=instance_place(x,y,obj_gold);
var keyItem=instance_place(x,y,parent_keyItem);
var equipment=instance_place(x,y,parent_equipment);

if (_weapon==noone and _gold==noone and keyItem==noone and equipment==noone)
	return false;
	
if (_gold!=noone )	{
	gold+=_gold.contents;
	var toCollect=_gold.contents;
	instance_destroy(_gold);
	tickerAdd("GOT "+string(toCollect)+" GOLD!");
	
	playSound(snd_collectGold,0,false);
	return true;
}

if (keyItem!=noone)	{
	var obj=keyItem.object_index;
	var toCollect=obj;
	switch (obj)	{
		case obj_yellowKey:
			tickerAdd("A KEY","GOOD THING ITS COLOUR CODED");
			break;
		case obj_blueKey:
			tickerAdd("BLUE KEY", "PROBABLY FOR BLUE LOCKS");
			break;
		case obj_redKey:
			tickerAdd("RED KEY", "AH IT BE RED ALRIGHT");
			break;
	}
	//Drop current key item
	if (keyItemHolding!=noone)
		instance_create_layer(x,y,layer,keyItemHolding);
	
	keyItemHolding=obj;
	instance_destroy(keyItem);
	
	playSound(snd_collectKey,0,false);
	return true;
}

// do equipment
if (equipment!=noone)	{
	if (gold<equipment.cost)	{
		tickerAdd("CANT AFFORD IT GAFFA");
		return false;
	}
	var obj=equipment.object_index;
	var toCollect=obj;
	switch (obj)	{
		case obj_terribleShield:
			tickerAdd("A TERRIBLE SHIELD", "BET ME GAFFA MADE THIS");
			break;
		case obj_grappa:
			tickerAdd("NICE BITTA GRAPPA EH", "MIGHT HAVE ME STUMBLIN");
			break;
		case obj_armouredBreastplate:
			tickerAdd("ARMOURED BREASTPLATE", "THATLL KEEP ME WELL");
			break;
		case obj_limoncello:
			tickerAdd("LIMONCELLO", "ITS GOT ME GAZEBOD MATE");
			break;
		case obj_stylishBoots:
			tickerAdd("STYLISH BOOTS", "TOP BOOTS LADS");
			break;
	}
	if (equipmentHolding!=noone)	{
		var equipDropped=instance_create_layer(x,y,layer,equipmentHolding);
		//Set the armour value of what we just dropped
		equipDropped.armour=equipmentArmour;
	}
	
	//Change what we're holding and retrieve the armour value
	equipmentHolding=obj;
	equipmentArmour=equipment.armour;
	equipmentArmourMax=equipment.armourMax;
	
	//Now delete the armour on the ground
	instance_destroy(equipment);
	
	playSound(snd_collectKey,0,false);
	return true;
}

if (gold<_weapon.cost)	{
	tickerAdd("NOT ENOUGH GOLD ME OLD");
	return false;
}

//Play the purchase weapon sound
if (_weapon.cost>0)
	playSound(snd_purchaseWeapon,0,false);

if (_weapon.collectible and gold>=_weapon.cost)
	{
		switch (_weapon.object_index)	{
			case obj_club:
				tickerAdd("A CLUB","NOTE TO WRITE HOME ABOUT BUT INDESTRUCTIBLE");
				break;
			case obj_basicBow:
				tickerAdd("BASIC BOW","RATE GOOD FOR RANGED ATTACKS");
				break;
			case obj_spade:
				tickerAdd("A SPADE","TOP SPADE LADS");
				break;
			case obj_basicStaff:
				tickerAdd("BASIC STAFF", "BEST NOT BON ME SEN ON T FIREBALLS");
				break;
			case obj_sythe:
				tickerAdd("A SYTHE", "BLUNT AS OAT");
				break;
			case obj_spikedClub:
				tickerAdd("SPIKED CLUB", "RATE NICE MATE");
				break;
			case obj_fastStaff:
				tickerAdd("FAST STAFF","GOES LIKE THE CLAPPERS IT DOES");
				break;
			case obj_fangs:
				tickerAdd("FANGS", "AH THESE ARE USELESS THEY ARE");
				break;
			case obj_bone:
				tickerAdd("BONES", "WHY WOULD I WANT THIS");
				break;
			case obj_throwingDagger:
				tickerAdd("THROWING DAGGER", "RATE POWERFUL BUT FIRE RATE IS RATE BAD");
				break;
			case obj_dualStaff:
				tickerAdd("DUAL STAFF", "SHOOTS TWO FIREBALLS ABSOLUTE TEKKERS");
				break;
			case obj_sword:
				tickerAdd("A SWORD", "BIT LATE IN THE GAME FOR A BLOODY SWORD INT IT");
				//This doesn't make sense in randomiser cause we might get it early in game
				if (control.randomiser)
					tickerAdd("A SWORD", "CRACKING LITTLE NUMBER THIS IS ME OLD");
				break;
			case obj_greatAxe:
				tickerAdd("GREAT AXE", "PROPER GOOD AXE MORE LIKE");
				break;
			case obj_grandStaff:
				tickerAdd("GRAND STAFF", "HOPE I DONT WASTE IT");
				break;
			case obj_crossbow:
				tickerAdd("CROSS BOW", "AN ABSOLUTE BANGER THIS IS");
				break;
			case obj_hotStaff:
				tickerAdd("HOT STAFF", "ITS SO HOT ITS COOL AM I RIGHT");
				break;
			case obj_greatSword:
				tickerAdd("GREAT SWORD", "MATE THIS IS ONE GREAT SWORD");
				break;
			case obj_cornDog:
				tickerAdd("CORN DOG", "STEADY ON LAD THIS IS LITERALLY A CORN DOG");
				break;
		}
		playSound(snd_getWeapon,0,false);
	}
else
	return false;

//Melee weapons
if (object_is_ancestor(_weapon.object_index,parent_melee))	{
	//Remove weapon cost (normally 0)
	gold-=_weapon.cost;
	//Spawn our current weapon
	if (currentWeapon!=noone and currentWeapon!=_weapon.object_index)	{
		var weaponDrop=instance_create_layer(x,y,layer,currentWeapon);
		weaponDrop.uses=weaponUses;
		weaponDrop.collectible=true;
	}
	
	if (currentWeapon==_weapon.object_index)	{
		var toCollect=_weapon.uses;
		weaponUses+=toCollect;
	}
	else	{
		currentWeapon=_weapon.object_index;
		weaponUses=_weapon.uses;
	}
	meleeCooldown=0;
	instance_destroy(_weapon);
	
	//Retrieve cooldown
	meleeCooldownMax=retrieveWeaponCooldown(currentWeapon);
	meleeCooldown=0;
	if (currentProjectile==noone)
		weapon=Weapon.Melee;
}
//Projectiles - note: use ELSE IF otherwise it checks this against an object that's been destroyed
else if (object_is_ancestor(_weapon.object_index,parent_projectile))	{
	//Remove weapon cost (normally 0)
	gold-=_weapon.cost;
	if (currentProjectile!=noone and currentProjectile!=_weapon.object_index)	{
		var weaponDrop=instance_create_layer(x,y,layer,currentProjectile);
		weaponDrop.uses=projectileUses;
		weaponDrop.collectible=true;
	}
	
	if (currentProjectile==_weapon.object_index)	{
		var toCollect=_weapon.uses;
		projectileUses+=toCollect;
	}
	else	{
	currentProjectile=_weapon.object_index;
	projectileUses=_weapon.uses;
	}
	projCooldown=0;
	instance_destroy(_weapon);
	
	//Retrieve cooldown
	projCooldownMax=retrieveWeaponCooldown(currentProjectile);
	projCooldown=0;
	if (currentWeapon==noone)
		weapon=Weapon.Projectile;
}

return true;