/// @description

if (room==rm_game)	{
	//First we should set all weapons already in the game as collectible because they won't be on the floor otherwise
	with (parent_attack)
		collectible=true;
	
	tileMapGlobals();
	mpGridInit();
	
	//Randomise stuff
	if (randomiser)
		instance_create_layer(0,0,layer,obj_randomiser);
}