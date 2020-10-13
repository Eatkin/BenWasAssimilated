/// @function shootProjectile(dir);
/// @description attempts to shoot a projectile, returns true if succesful
/// @param {real} dir the direction to shoot in (degrees)
/// @param {real} weapon the weapon to use
/// @param {real} type the type of weapon

var dir=argument0;
var weapon=argument1;
var type=argument2;

if (weapon==noone)
	return false;

var width=retrieveWeaponWidth(weapon);
var height=retrieveWeaponHeight(weapon);

var hoffset=0.5*(width-1);

var cosDir=dcos(dir);
var sinDir=-dsin(dir);		//negative because 90 degrees is upwards

//Wwe can't attack if there is an obstacle immediately infront
if (collisionAt(x+global.gridSize*cosDir,y+global.gridSize*sinDir) and currentWeapon!=obj_glitch)
	return false;
//Area of effect
/*	   xx
	H->xx	cosDir=1;
	   xx	sinDir=0;
   xxx		cosDir=0;
   xxx		sinDir=-1;
    |
	H
	   
*/

//Little hiccup - the projectiles automatically realign because of some awkwardness to do with top left origin alignment
//Could be fixed more elgantly probably but oh well lololol
var columnBlocked=0;		//Bitmasking

//What the fuck oh god
var projCreated=false;
	
for (var i=0; i<=hoffset; i+=1)	{
	for (var j=1; j<=height; j+=1)	{
		//First find coordinates for where to check
		var xproj=x+global.gridSize*(i*sinDir+j*cosDir);
		var yproj=y+global.gridSize*(i*cosDir+j*sinDir);
		var rep=1;
		//Repeat for + and - i
		repeat (2)	{
			var _sign=(rep==1) ? 1 : -1;
			//Continue if i==0 because otherwise we create 2 weapons
			if (i==0 and rep==2)
				continue;
			//Check if we can place a weapon there
			//Also ignore this if we're using the glitch weapon
			var pow=power(2,_sign*i+hoffset);
			if ((!collisionAt(xproj,yproj) and !(pow==columnBlocked&pow)) or currentWeapon==obj_glitch)	{
				//Skip this iteration if we've been blocked
					
				//Set that at least one weapon has been placed
				projCreated=true;
				//Create said weapon
				var proj=instance_create_layer(xproj,yproj,"weapons",weapon);
				proj.counter=1;
				proj.owner=object_index;
			
				//If it's a projectile, we have some extra things to set
				if (type==Weapon.Projectile)	{
					proj.dir=dir;
					proj.image_index=dir/90;
				}
				
			}
			else
				columnBlocked=columnBlocked|pow;
			
			var xproj=x+global.gridSize*(j*cosDir-i*sinDir);
			var yproj=y+global.gridSize*(j*sinDir-i*cosDir);
			rep+=1;
		}
	}
}
	
if (projCreated)
	if (type==Weapon.Melee)	{
		meleeCooldown=meleeCooldownMax+1;
		playSound(snd_melee,0,false);
	}
	else	{
		projCooldown=projCooldownMax+1;
		playSound(snd_projectile,0,false);
	}
	
return projCreated;