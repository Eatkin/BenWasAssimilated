var inst=argument0;

if (!instance_exists(inst))
	return false;

var cam=view_camera[0];
var x1=camera_get_view_x(cam);
var x2=x1+camera_get_view_width(cam);
var y1=camera_get_view_y(cam);
var y2=y1+camera_get_view_height(cam);

if (collision_rectangle(x1,y1,x2,y2,inst,false,false))
	return true;
	
return false;