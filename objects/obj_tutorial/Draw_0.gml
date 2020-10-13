/// @description

draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var v_spacing=40;

var xdraw=16;
var ydraw=32;
var c=Colour.Red;
var colour=getColour(c);
draw_sprite_ext(spr_farmer2,0,xdraw,ydraw,2,2,0,colour,1);

draw_text(xdraw+64,ydraw+16,"RED CHARACTERS WILL ATTACK YOU\nMAY DROP WEAPONS");

var colour=getColour(Colour.Green);

ydraw+=v_spacing;
draw_sprite_ext(spr_cow,0,xdraw,ydraw,2,2,0,colour,1);

draw_text(xdraw+64,ydraw+16,"GREEN CHARACTERS ARE HARMLESS\nMAY DROP HEALTH PICKUPS");

ydraw+=v_spacing;
draw_sprite_ext(spr_dagger,0,xdraw,ydraw,2,2,0,c_white,1);
draw_text(xdraw+64,ydraw+16,"WEAPON STRENGTH");

ydraw+=v_spacing;
draw_sprite_ext(spr_uses,0,xdraw,ydraw,2,2,0,c_white,1);
draw_text(xdraw+64,ydraw+16,"WEAPON USES");

ydraw+=v_spacing;
draw_sprite_ext(spr_cooldown,0,xdraw,ydraw,2,2,0,c_white,1);
draw_text(xdraw+64,ydraw+16,"WEAPON COOLDOWN");

draw_set_valign(fa_top);
xdraw=16;
ydraw=room_height-32;

draw_text(xdraw,ydraw,"PRESS SPACE TO CONTINUE");