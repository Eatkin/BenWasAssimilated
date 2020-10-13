/// @description

if (keyboard_check_pressed(vk_anykey))	{
	room_goto(rm_options);
	playSound(snd_menuSelect,0,false);
}

delay-=1;
if (delay>0)
	exit;

if (alphaDir=1)
	alpha+=0.005;
else
	alpha-=0.005;

if (alpha>=1)	{
	alpha=1;
	alphaDir=-1;
	delay=30;
}
if (alpha<=0)	{
	alpha=0;
	alphaDir=1;
	delay=30;
}