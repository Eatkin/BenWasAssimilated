/// @description

//Destroy tiles we hit - 2nd check cause this seems to work differently on HTML5 target
if (tileCollision(x,y))	{
	clearTile(x div global.gridSize,y div global.gridSize);
	destroy=true;
}
if (nonSolidTileCollision(x,y))	{
	clearNonSolidTile(x div global.gridSize, y div global.gridSize);
	destroy=true;
}

var checkpoint=instance_place(x,y,obj_checkpoint);
if (checkpoint!=noone)	{
	instance_destroy(checkpoint);
	destroy=true;
}

if (destroy or attacked)
	instance_create_layer(x-sprite_xoffset,y-sprite_yoffset,layer,obj_boom);