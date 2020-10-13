/// @description drop probabilities


if (irandom(2)==0 and gold>0)	{
	//drop gold
	var _gold=instance_create_layer(x,y,layer,obj_gold);
	_gold.contents=gold;
	exit;
}

if (!dropWeapon)
	exit;
//These also need to inherit durability
//Drop melee
if (irandom(10)==0 and meleeWeapon!=noone)	{
	var weaponDrop=instance_create_layer(x,y,layer,meleeWeapon);
	weaponDrop.collectible=true;
	weaponDrop.uses=weaponUses;
	exit;
}

//Drop projectile
if (irandom(10)==0 and rangedWeapon!=noone)	{
	var weaponDrop=instance_create_layer(x,y,layer,rangedWeapon);
	weaponDrop.collectible=true;
	weaponDrop.uses=projectileUses;
	exit;
}