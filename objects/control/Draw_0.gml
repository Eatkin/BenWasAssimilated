/// @description draw map

var drawMap=true;
drawMap=false;

if (!drawMap)
	exit;
	
draw_set_alpha(0.5);	
mp_grid_draw(global.pathfindingGrid);
draw_set_alpha(1);