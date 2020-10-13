//Go through collision list
//Return true if collision found
var xx=argument0;
var yy=argument1;

//First check
if (collisionAt(xx,yy))
	return true;
	
var collList;
collList[0]=parent_attack;
collList[1]=parent_equipment;
collList[2]=obj_gold;
collList[3]=parent_keyItem;
	
var collChecks=array_length_1d(collList);

//Loop thru array and if we find a collision, we mark it and break the loop
for (var i=0; i<collChecks; i+=1)
	if (place_meeting(xx,yy,collList[i]))
		return true;
	
return false;