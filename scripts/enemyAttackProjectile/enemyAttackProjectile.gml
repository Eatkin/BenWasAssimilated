//Tries a melee attack
//We'll check if the player is in the correct range for us to attack him

if (rangedWeapon==noone)
	return false;
	
//Also exit if we haven't reached cooldown or if
if (projCooldown>0)
	return false;

//Weapon details
var width=retrieveWeaponWidth(rangedWeapon);
var height=retrieveWeaponHeight(rangedWeapon);

//Stuff for the loops
var hoffset=0.5*(width-1);

//We will loop through where the weapons will spawn and check if we hit the hero at any of those points
//This is super basic and basically only check in a straight line
var loopCheck=false;
for (var i=0; i<4; i+=1)	{
	var dir=i*90;
	var cosDir=dcos(dir);
	var sinDir=-dsin(dir);
	var columnBlocked=0;
	for (var j=0; j<range; j+=1)	{
		var xproj=x+global.gridSize*j*cosDir;
		var yproj=y+global.gridSize*j*sinDir;
		if (!collisionAt(xproj,yproj) and place_meeting(xproj,yproj,obj_hero))	{
			loopCheck=true;
			break;
		}
	}
	//Break the i loop
	if (loopCheck)
		break;
}

if (!loopCheck)
	return false;

//Now let's go through and create the mattack!
var projCreated=false;
for (var i=-hoffset; i<=hoffset; i+=1)
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
			var pow=power(2,_sign*i+hoffset);
			if (!collisionAt(xproj,yproj) and !(pow==columnBlocked&pow))	{
				//Set that at least one weapon has been placed
				projCreated=true;
				//Create said weapon
				var proj=instance_create_layer(xproj,yproj,"weapons",rangedWeapon);
				proj.owner=object_index;
				proj.dir=dir;
				proj.image_index=dir/90;
			}
			else
				columnBlocked=columnBlocked|pow;
			
			var xproj=x+global.gridSize*(j*cosDir-i*sinDir);
			var yproj=y+global.gridSize*(j*sinDir-i*cosDir);
			rep+=1;
		}
	}

if (projCreated)	{
	//Reduce uses by one
	projectileUses-=1;
	projCooldown=projCooldownMax;
	playSound(snd_projectile,0,false);
}

return projCreated;