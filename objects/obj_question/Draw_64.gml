/// @description

if (!drawStats)
	exit;
	
//Draw stats about the weapon
//We need to measure width of the weapon's name and compare to min width for stats
//Will probably take up 80 px in height
//Code copied from HUD:
//Modify as needed

/*Bitmask for 9 slice
 1
8x2
 4
*/
var ydraw=16;			//High up
var vrepeats=5;
var minwidth=144;
minwidth=max(minwidth,round(string_width(weaponName)/16)*16);
var hrepeats=2+minwidth/16;

var xdraw=240-minwidth/2;
xdraw=16;					//Try it to the left

for (var i=0; i<hrepeats; i+=1)
	for (var j=0; j<vrepeats; j+=1)	{
		var mask=0;
		//Cell to the left
		if (i>0)
			mask=mask|8
		//Cell to the right
		if (i<hrepeats-1)
			mask=mask|2;
			
		//Cell above
		if (j>0)
			mask=mask|1;
		//Cell below
		if (j<vrepeats-1)
			mask=mask|4;
			
		draw_sprite_part(spr_9slice,0,16*mask,0,16,16,xdraw+16*i,ydraw+16*j);
		
	}
	
ydraw+=16;
xdraw+=16;

var _xdraw=xdraw;				//Save this coordinate

draw_set_halign(fa_left);
draw_text(xdraw,ydraw,weaponName);
draw_set_halign(fa_center);

ydraw+=16;

//Damage
draw_sprite(spr_dagger,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
var dam=weaponStrength;
xdraw+=16;
draw_text(xdraw+8,ydraw,dam);
	
//Uses
xdraw+=32;
draw_sprite(spr_uses,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
xdraw+=16;
if (weaponUses<0)
	draw_sprite(spr_infinity,0,xdraw,ydraw);
else	{
	var letters=string_length(weaponUses);
	var textx=xdraw+8;
	if (letters>1)
		textx+=string_width(string_char_at(weaponUses,2))*0.5;
	draw_text(textx,ydraw,weaponUses);
}
		
//Cooldown
xdraw+=32;
draw_sprite(spr_cooldown,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
xdraw+=16;
draw_text(xdraw+8,ydraw,wepaonCooldown);			//Okay I typo'd so carrying it forward lol

xdraw=_xdraw;
ydraw+=16;

//Now draw length and width
draw_sprite(spr_width,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
xdraw+=16;
draw_text(xdraw+8,ydraw,weaponWidth);
	
xdraw+=32;
draw_sprite(spr_height,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
xdraw+=16;
draw_text(xdraw+8,ydraw,weaponHeight);