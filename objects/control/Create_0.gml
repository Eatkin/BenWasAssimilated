/// @description


//Globals
global.gridSize=16;

//Inputs
inputMapInit();

//Enemies
enemyGridInit();

//Weapons
weaponGridInit();
projectilePairsInit();
equipmentGridInit();

//Set up display
var windowWidth=480;
var windowHeight=270;

var scale=1;
var displayWidth=display_get_width();
var displayHeight=display_get_height();

if (os_browser!=browser_not_a_browser)	{
	var displayWidth=browser_width;
	var displayHeight=browser_height;
}



while (windowWidth*(scale+1)<displayWidth and windowHeight*(scale+1)<displayHeight)
	scale+=1;

window_set_size(windowWidth*scale,windowHeight*scale);
display_set_gui_size(windowWidth,windowHeight);
window_set_caption("BEN WAS ASSIMILATED");

alarm[0]=1;

//Fonts
global.tickerFont=font_add_sprite(spr_font,ord("."),true,2);

//Ticker
global.tickerList=ds_list_create();

//Boss fight
global.inBossFight=false;

//Palette
createColourPalette();

randomise();

//Randomiser
randomiser=false;
//randomiser=true;

//Permadeath
permadeath=false;

//Turn off cursor
window_set_cursor(cr_none);

//Exit game
holdingEscTimerMax=180;
holdingEscTimer=holdingEscTimerMax;

//Music
instance_create_layer(x,y,layer,obj_music);

//Options
global.azerty=false;
global.lefty=false;		//leftyFlip but that names already taken by a script

global.tutorial=false;		//Has viewed tutorial