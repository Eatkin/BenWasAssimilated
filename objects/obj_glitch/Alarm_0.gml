/// @description

//Destroy tiles we hit
if (tileCollision(x,y))	{
	clearTile(x div global.gridSize,y div global.gridSize);
	destroy=true;
}
if (nonSolidTileCollision(x,y))	{
	clearNonSolidTile(x div global.gridSize, y div global.gridSize);
	destroy=true;
}
	
//Various collision checks
var weapon=instance_place(x,y,parent_attack);
var _gold=instance_place(x,y,obj_gold);
var keyItem=instance_place(x,y,parent_keyItem);
var equipment=instance_place(x,y,parent_equipment);
var food=instance_place(x,y,obj_healthUp);

if (weapon!=noone)	{
	instance_destroy(weapon);
	destroy=true;
}
if (_gold!=noone)	{
	instance_destroy(_gold);
	destroy=true;
}
if (keyItem!=noone)	{
	instance_destroy(keyItem);
	destroy=true;
}
if (equipment!=noone)	{
	instance_destroy(equipment)
	destroy=true;
}
if (food!=noone)	{
	instance_destroy(food);
	destroy=true;
}