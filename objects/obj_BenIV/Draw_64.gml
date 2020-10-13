/// @description draws an icon to show where tiles are when <200 tiles left

if (tileCount>200 or tileCount==0)
	exit;
	
if (warningIndex==0)
	exit;
	
var xx=firstTileX*16;
var yy=firstTileY*16;

var cam=view_camera[0];
xx-=camera_get_view_x(cam);
yy-=camera_get_view_y(cam);

var guiWidth=display_get_gui_width();
var guiHeight=display_get_gui_height();

xx=clamp(xx,8,guiWidth-8);
yy=clamp(yy,8,guiHeight-56);		//-56 because 3 tiles are for the HUD at the bottom

draw_sprite(spr_warning,0,xx,yy);