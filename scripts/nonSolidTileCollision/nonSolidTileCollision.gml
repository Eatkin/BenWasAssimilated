//Returns if you will collide with a thing

var xx=argument0;
var yy=argument1;

if (!positionInRoom(xx,yy))
	return false;


var cellx=floor(xx/16);
var celly=floor(yy/16);

var tileToCheck=tilemap_get(global.nonSolidMap,cellx,celly);
if (!tile_get_empty(tileToCheck))
	return true;
	
return false;