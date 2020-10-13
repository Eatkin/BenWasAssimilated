//Removes the cell at xx, yy

var xx=argument0;
var yy=argument1;

var cellx=floor(xx/16);
var celly=floor(yy/16);

mp_grid_clear_cell(global.pathfindingGrid,cellx,celly);