/// @description

stepOn=false;

attacked=false;

damage=retrieveWeaponDamage(object_index);

owner=noone;

counter=0;

uses=retrieveWeaponUses(object_index);

collectible=false;

//Put on the correct layer
var lay=layer_get_id("weapons");
layer=lay;

cost=0;

if (!positionInRoom(x,y))
	alarm[0]=1;