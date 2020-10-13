//Go through collision list
//Return true if collision found
var xx=argument[0];
var yy=argument[1];

var includeHero=true;

//Also check solid tiles
if (collisionAt(xx,yy))
	return true;

//Optional argument on whether to include the hero
if (argument_count>2)
	includeHero=false;
	
var collList;
collList[0]=obj_hero;
collList[1]=parent_enemy;
//We only check for attacks if we roll to avoid it
if (irandom(evasion)==0)
	collList[2]=parent_attack;
	
var collChecks=array_length_1d(collList);

//Loop thru array and if we find a collision, we mark it and break the loop
var loopStart=(includeHero) ? 0 : 1;
for (var i=loopStart; i<collChecks; i+=1)
	if (place_meeting(xx,yy,collList[i]))	{
		return true;
	}
	
return false;