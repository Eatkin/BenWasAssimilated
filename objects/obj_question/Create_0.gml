/// @description

var weapon=instance_nearest(x,y,parent_attack);
var obj=weapon.object_index;

weaponId=instance_nearest(x,y,parent_attack);
weaponName=retrieveWeaponName(obj);
weaponStrength=retrieveWeaponDamage(obj);
weaponUses=retrieveWeaponUses(obj);
wepaonCooldown=retrieveWeaponCooldown(obj);
weaponHeight=retrieveWeaponHeight(obj);
weaponWidth=retrieveWeaponWidth(obj);

drawStats=false;