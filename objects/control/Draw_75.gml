/// @description exiting game

if (holdingEscTimer==holdingEscTimerMax)
	exit;

draw_set_halign(fa_middle);

//Screen centre
var xdraw=240;
var ydraw=135;

var time=holdingEscTimer div 60;
time+=1;

//Outlined text
draw_set_colour(c_black);
for (var i=-1; i<=1; i+=1)
	for (var j=-1; j<=1; j+=1)
		draw_text(xdraw+i,ydraw+j,"EXITING TO MENU IN "+string(time));
		
draw_set_colour(c_white);
draw_text(xdraw,ydraw,"EXITING TO MENU IN "+string(time));