/// @description

if (keyboard_check(vk_escape) and room==rm_game)
	holdingEscTimer-=1;
else
	holdingEscTimer=holdingEscTimerMax;
	
if (holdingEscTimer<=0)
	room_goto(rm_title);
	
if (os_browser!=browser_not_a_browser)	{
	
	//Set up display
	var windowWidth=480;
	var windowHeight=270;

	var scale=1;
	var displayWidth=display_get_width();
	var displayHeight=display_get_height();

	while (windowWidth*(scale)<displayWidth and windowHeight*(scale)<displayHeight)
		scale+=1;

	window_set_size(windowWidth*scale,windowHeight*scale);
	}