//Basic pathfinding
//Same as usual except it will move onto the player's square

var hasMoved=false;
var _path=path_add();
var pathValid=mp_grid_path(global.pathfindingGrid,_path,x+8,y+8,obj_hero.x+8,obj_hero.y+8,false);
if (pathValid)	{
	path_shift(_path,-global.gridSize*0.5,-global.gridSize*0.5);
	var xto=path_get_point_x(_path,1);
	var yto=path_get_point_y(_path,1);
	if (!checkCollisionList(xto,yto,false))	{
		x=xto;
		y=yto;
		hasMoved=true;
	}
}
path_delete(_path);	
			
return hasMoved;