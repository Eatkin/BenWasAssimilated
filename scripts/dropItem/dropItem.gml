//We want to check from the centre and spiral outwards (clockwise) until we find a suitable space

var obj=argument0;
var cellOffset=1;

var xx=x;
var yy=y;
while (true)	{
	for (var i=0; i<8; i+=1)	{
		var angle=45*i;
		xx=x+ceil(dcos(angle))*cellOffset*global.gridSize;
		yy=y+ceil(dsin(angle))*cellOffset*global.gridSize;
		if (!checkDropCollisions(xx,yy))	{
			var dropped=instance_create_layer(xx,yy,layer,obj);
			//Pass uses
			switch (dropped.object_index)	{
				case currentWeapon:
					dropped.uses=weaponUses;
					break;
				case currentProjectile:
					dropped.uses=projectileUses;
					break;
				case equipmentHolding:
					dropped.uses=equipmentArmour;
					break;
			}
			return dropped;
		}
	}
	cellOffset+=1;
	//Break the loop cause clearly something has gone wrong here 
	if (cellOffset>=16)
		break;
}

//Fail and drop it where you stand
var dropped=instance_create_layer(x,y,layer,obj);
//Pass uses
switch (dropped.object_index)	{
	case currentWeapon:
		dropped.uses=weaponUses;
		break;
	case currentProjectile:
		dropped.uses=projectileUses;
		break;
	case equipmentHolding:
		dropped.uses=equipmentArmour;
		break;
}
			
return dropped;