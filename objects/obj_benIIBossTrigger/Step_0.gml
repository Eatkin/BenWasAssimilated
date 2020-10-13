/// @description

if (place_meeting(x,y,obj_hero))	{
	tickerAdd("ITS LOOKING A BIT BLACK OVER BILLS MOTHER");
	
	playSound(snd_block,0,false);
	
	//Set a solid tile so we can't escape
	var tileAtX=x;
	var tileAtY=y-global.gridSize;
	var lay_id = layer_get_id("solidTiles");
	var map_id = layer_tilemap_get_id(lay_id);

	var cellx=floor(tileAtX/16);
	var celly=floor(tileAtY/16);

	myTile=tilemap_get(map_id,cellx,celly);
	tilemap_set(map_id,1,cellx,celly);		//Cleverly, this is a dirt patch, which I've put there for 'cosmetic' purposes ;)
	mpGridAddCell(tileAtX,tileAtY);
	
	//Create the padlock
	var lock=instance_create_layer(tileAtX,tileAtY,layer,obj_padlock);
	lock.colour=Colour.Blue;
	
	//Finally activate the boss then destroy
	obj_ben2_boss.active=true;
	global.inBossFight=true;
	instance_destroy();
}