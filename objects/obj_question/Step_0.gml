/// @description

//Update on camera
if (!onCamera(id))
	exit;
	
if (place_meeting(x,y,obj_hero))
	drawStats=true;
else
	drawStats=false;

if (!instance_exists(parent_attack))
	exit;

//Don't update anything if the weapon still exists
if (instance_exists(weaponId))
	exit;

//Otherwise we update - mostly for randomiser
var weapon=instance_nearest(x,y,parent_attack);

//If the weapon cost is 0, then the weapon has been taken
if (weapon.cost==0)	{
	instance_destroy();
	exit;
}
var obj=weapon.object_index;

weaponId=instance_nearest(x,y,parent_attack);
weaponName=retrieveWeaponName(obj);
weaponStrength=retrieveWeaponDamage(obj);
weaponUses=retrieveWeaponUses(obj);
wepaonCooldown=retrieveWeaponCooldown(obj);
weaponHeight=retrieveWeaponHeight(obj);
weaponWidth=retrieveWeaponWidth(obj);