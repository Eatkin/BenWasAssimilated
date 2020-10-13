/// @description

var hudHeight=48;
var cam=view_camera[0];
var camx=camera_get_view_x(cam);
var camy=camera_get_view_y(cam);
var camw=camera_get_view_width(cam);
var camh=camera_get_view_height(cam)-hudHeight;
var following=(instance_exists(obj_hero)) ? obj_hero : noone;

if (following==noone)
	exit;
	
var targetx=following.x;
var targety=following.y;

camx=lerp(camx,targetx-camw*0.5,0.2);
camy=lerp(camy,targety-camh*0.5,0.2);
camx=clamp(camx,0,room_width-camw);
camy=clamp(camy,0,room_height-camh);

camera_set_view_pos(cam,camx,camy);

//This makes sure things don't spontaneously re-activate when Ben moves after dying
if (death)	{
	if (!onCamera(obj_hero))	{
		with (control)
			event_user(0);
	}
}
else
	death=false;