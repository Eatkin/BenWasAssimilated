//Tries a melee attack
//We'll check if the player is in the correct range for us to attack him
	
if (meleeWeapon==noone)	
	return false;
	
//Also exit if we haven't reached cooldown or if
if (meleeCooldown>0)
	return false;

//Weapon details
var width=retrieveWeaponWidth(meleeWeapon);
var height=retrieveWeaponHeight(meleeWeapon);

//Stuff for the loops
var hoffset=0.5*(width-1);

//We will loop through where the weapons will spawn and check if we hit the hero at any of those points
var loopCheck=false;
for (var i=0; i<4; i+=1)	{
	var dir=i*90;
	var cosDir=dcos(dir);
	var sinDir=-dsin(dir);
	var columnBlocked=0;
	for (var j=-hoffset; j<=hoffset; j+=1)	{
		for (var k=1; k<=height; k+=1)	{
			//First find coordinates for where to check
			var xproj=x+global.gridSize*(j*sinDir+k*cosDir);
			var yproj=y+global.gridSize*(j*cosDir+k*sinDir);
		
			var pow=power(2,i+hoffset);
			if (collisionAt(xproj,yproj))
				columnBlocked=columnBlocked|pow;
				
			//Check if we can place a weapon there
			if (place_meeting(xproj,yproj,obj_hero) and !(pow==columnBlocked&pow))	{
				loopCheck=true;
				break;
			}
		}
		//Break j loop
		if (loopCheck)
			break;
	}
	//Break i loop
	if (loopCheck)
		break;
}

if (!loopCheck)
	return false;

//Now let's go through and create the melee attack!
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
				var proj=instance_create_layer(xproj,yproj,"weapons",meleeWeapon);
				proj.owner=object_index;
			}
			else
				columnBlocked=columnBlocked|pow;
			
			var xproj=x+global.gridSize*(j*cosDir-i*sinDir);
			var yproj=y+global.gridSize*(j*sinDir-i*cosDir);
			rep+=1;
		}
	}

//Reduce uses by one
if (projCreated)	{
	weaponUses-=1;
	meleeCooldown=meleeCooldownMax;
	playSound(snd_melee,0,false);
}

return projCreated;