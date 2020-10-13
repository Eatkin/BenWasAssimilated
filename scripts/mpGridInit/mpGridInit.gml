//Create a motion planning grid for enemies to use
var left=0;
var top=0;
var hcells=room_width div global.gridSize;
var vcells=room_height div global.gridSize;

global.pathfindingGrid=mp_grid_create(left,top,hcells,vcells,global.gridSize,global.gridSize);


for (var i=0; i<hcells; i+=1)	{
	for (var j=0; j<vcells; j+=1)	{
		if (tileCollision(left+global.gridSize*i,top+global.gridSize*j))	{
			mp_grid_add_cell(global.pathfindingGrid,i,j);
		}
	}
}