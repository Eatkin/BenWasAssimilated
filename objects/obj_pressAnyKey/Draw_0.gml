/// @description

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(global.tickerFont);

var ydraw=room_height*0.5;
var xdraw=room_width*0.5;

if (room==rm_title)
	draw_text_transformed(xdraw,ydraw*0.5,"BEN WAS\nASSIMILATED",2,2,0);

draw_set_alpha(alpha);
draw_text(xdraw,ydraw,"PRESS ANY KEY TO CONTINUE");
draw_set_alpha(1);