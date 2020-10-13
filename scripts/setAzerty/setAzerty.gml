//Sets Azerty on and off

var turnOn=argument0;
var leftyFlipped;

if (global.inputMap[? "left"]==vk_left)
	leftyFlipped=false;
else
	leftyFlipped=true;
	
global.azerty=global.azerty^1;	//Bitflip

if (turnOn)	{
	if (!leftyFlipped)	{
		ds_map_set(global.inputMap,"shoot left",ord("Q"));
		ds_map_set(global.inputMap,"shoot up",ord("Z"));
	}
	else	{
		ds_map_set(global.inputMap,"left",ord("Q"));
		ds_map_set(global.inputMap,"up",ord("Z"));
	}
}
else	{
	if (!leftyFlipped)	{
		ds_map_set(global.inputMap,"shoot left",ord("A"));
		ds_map_set(global.inputMap,"shoot up",ord("W"));
	}
	else	{
		ds_map_set(global.inputMap,"left",ord("A"));
		ds_map_set(global.inputMap,"up",ord("W"));
	}
}