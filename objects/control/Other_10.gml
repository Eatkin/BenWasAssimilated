/// @description region management

if (!instance_exists(obj_hero))
	exit;
	
var cam=view_camera[0];
var camx=camera_get_view_x(cam);
var camy=camera_get_view_y(cam);
var camw=camera_get_view_width(cam);
var camh=camera_get_view_height(cam);

var x1=camx-camw*0.5;
var w=2*camw;
var y1=camy-camh*0.5;
var h=2*camh;

instance_deactivate_object(parent_enemy);
instance_deactivate_object(parent_keyItem);
instance_deactivate_object(obj_gold);
instance_deactivate_object(parent_attack);
instance_activate_region(x1,y1,w,h,true);