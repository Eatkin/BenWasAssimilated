/// @description

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var optionsLength=array_length_1d(option);
var colour=getColour(Colour.White);

var xdraw=16;
var ydraw=16;
var spacing=24;

var spr=spr_checkBox;
//Draw all the check boxes and shit
for (var i=0; i<optionsLength; i+=1)	{
	if (i==0)
		spr=spr_hero;
	if (optionSelected==i)
		colour=getColour(Colour.Yellow);
	//Non browser only
	if (!isBrowser and i==optionsLength-1)
		spr=spr_quitButton;
	
	var imgIndex=(optionChoices&power(2,i)==power(2,i)) ? 1 : 0;
	draw_sprite_ext(spr,imgIndex,xdraw,ydraw+spacing*i,1,1,0,colour,1);
	draw_text(xdraw+32,ydraw+spacing*i,option[i]);
	
	if (optionSelected==i)
		colour=getColour(Colour.White);
	if (i==0)
		spr=spr_checkBox;
}

ydraw=room_height-32;

draw_text(xdraw,ydraw,"PRESS SPACE TO SELECT AN OPTION");
//draw_text(xdraw,ydraw+16,"PRESS ENTER TO START GAME");

//Now draw keys - set up all the strings appropriately
var bitmask=4;		//AZERTY option
if (isBrowser)
	bitmask=2;
var AZERTY=optionChoices&bitmask;
var WASDtext="WASD";
if (AZERTY)
	WASDtext="ZQSD";

var arrowsText="ARROW KEYS"
var bitmask=8;

if (isBrowser)
	bitmask=4;
var WASDmovement=optionChoices&bitmask;
var movementText=arrowsText;
var shootText=WASDtext;
if (WASDmovement)	{
	movementText=WASDtext;
	shootText=arrowsText;
}


draw_set_halign(fa_center);
//This is centred above the first set of keys
xdraw=384+24;
ydraw=16+32;
draw_text(xdraw,ydraw,movementText);
draw_text(xdraw,ydraw+16,"MOVEMENT");

//Second set
ydraw=96+16
draw_text(xdraw,ydraw,shootText);
draw_text(xdraw,ydraw+16,"USE WEAPON");

//Swap weapon
xdraw=392+16;
ydraw=160;
draw_text(xdraw,ydraw,"LEFT SHIFT");
draw_text(xdraw,ydraw+16,"SWAP WEAPON");