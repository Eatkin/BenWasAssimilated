tickerAdd("IM DONE FOR ME OLD");

playSound(snd_die,0,false);

dead=true;
visible=false;

instance_create_layer(x,y,layer,obj_stars);

//Drop equipment
if (gold>0)	{
	var g=dropItem(obj_gold);
	g.contents=gold;
}

if (currentWeapon!=noone)	{
	var w=dropItem(currentWeapon);
	w.collectible=true;
}

if (currentProjectile!=noone)	{
	var p=dropItem(currentProjectile);
	p.collectible=true;
}

if (equipmentHolding!=noone)	{
	var e=dropItem(equipmentHolding);
	e.armour=equipmentArmour;
}

if (keyItemHolding!=noone)
	dropItem(keyItemHolding);
	
gold=0;
currentWeapon=noone;
currentProjectile=noone;
equipmentHolding=noone;
keyItemHolding=noone;