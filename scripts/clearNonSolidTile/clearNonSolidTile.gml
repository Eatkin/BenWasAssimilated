//Clears the tile at (cellx, celly) and removes it from the MP grid
//THIS USES GRID REFERENCES, NOT COORDINATES

var cellx=argument0;
var celly=argument1;


var myTile=tilemap_get(global.nonSolidMap,cellx,celly);

if (myTile==-1)
	return false;

tilemap_set(global.nonSolidMap,0,cellx,celly);

return true;