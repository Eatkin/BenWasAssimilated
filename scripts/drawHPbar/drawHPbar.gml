//Draw empty bar
var xx=argument0;
var yy=argument1;
draw_sprite(spr_hpBarEmpty,0,xx,yy);

//Now draw the full bar
//A fraction of it
var hpFrac=hp/hpmax
var sprWidth=sprite_get_width(spr_hpBarFull);
var sprHeight=sprite_get_height(spr_hpBarFull);
var offset=4;		//How far along we draw it
draw_sprite_part(spr_hpBarFull,0,0,0,hpFrac*sprWidth,sprHeight,xx+offset,yy);