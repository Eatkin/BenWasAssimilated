//Checks if the position player is moving to is in the room

var xx=argument0;
var yy=argument1;

if (xx==clamp(xx,0,room_width-1) and yy==clamp(yy,0,room_height-1))
	return true;
	
return false;