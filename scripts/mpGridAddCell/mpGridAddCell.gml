//Adds a cell at xx, yy

var xx=argument0;
var yy=argument1;

var cellx=floor(xx/16);
var celly=floor(yy/16);

mp_grid_add_cell(global.pathfindingGrid,cellx,celly);

//If an enemy is on a solid tile, the game hard locks, so just delete them
//It's not exactly like that's a common thing to happen
var enemy=instance_place(xx,yy,parent_enemy);

if (enemy!=noone)
	instance_destroy(enemy);