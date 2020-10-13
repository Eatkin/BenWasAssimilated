//Arg0 is damage taken

var dam=argument0;

//Harmless enemies exit
if (dam=0)
	exit;

var remainder=dam;
//Take damage from armour first
if (equipmentHolding!=noone and equipmentArmour>0)	{
	maxDamage=equipmentArmour;
	armourDamageTaken=min(maxDamage,dam);
	equipmentArmour-=armourDamageTaken;
	remainder-=armourDamageTaken;
}

hp-=remainder;