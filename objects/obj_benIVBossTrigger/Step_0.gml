/// @description

if (place_meeting(x,y,obj_hero))	{
	tickerAdd("BEN III", "COME AND JOIN ME", "THIS IS YOUR LIFES TRUE PURPOSE", "BECOME ONE WITH THE HIVEMIND");
	
	playSound(snd_block,0,false);
	
	//Set a solid tile so we can't escape
	var tileAtX=x-global.gridSize;
	var tileAtY=y;
	var lay_id = layer_get_id("solidTiles");
	var map_id = layer_tilemap_get_id(lay_id);

	var cellx=floor(tileAtX/16);
	var celly=floor(tileAtY/16);

	myTile=tilemap_get(map_id,cellx,celly);
	tilemap_set(map_id,624,cellx,celly);		//It's a block
	mpGridAddCell(tileAtX,tileAtY);
	
	//Finally activate the boss then destroy
	obj_ben4_boss.active=true;
	global.inBossFight=true;
	instance_destroy();
}