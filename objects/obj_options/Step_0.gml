/// @description

//Count down cooldown
coolDown=max(0,coolDown-1);

var optionsLength=array_length_1d(option);

var input=global.inputMap;

var vinput=keyboard_check(input[? "down"])-keyboard_check(input[? "up"]);
if (vinput==0)
	vinput=keyboard_check(input[? "shoot down"])-keyboard_check(input[? "shoot up"]);
var hinput=keyboard_check(input[? "right"])-keyboard_check(input[? "left"]);
var select=keyboard_check_pressed(vk_space);

//If we aren't holding anything, cooldown goes to 0
if (vinput==0 and hinput==0)
	coolDown=0;

//If cooldown isn't zero, blank inputs
if (coolDown!=0)	{
	vinput=0;
	hinput=0;
}

//Update the input queue
if (vinput!=0 or hinput!=0)	{
	var addToQueue=abs(vinput)*(vinput+2)+abs(hinput)*(hinput+2)*2;		//i.e. up=1, down=3, left=2, right=6
	inputQueue=string(addToQueue)+inputQueue
	inputQueue=string_copy(inputQueue,1,8);
	if (inputQueue=="62623311")	{		//UUDDLRLR		NOTE: THESE ARE BACKWARDS TO KEEP THE CORRECT STRING LENGTH
		audio_play_sound(snd_easterEgg1,0,false);
		inputQueue="";
	}
	if (inputQueue=="31316622")	{		//LLRRUDUD
		audio_play_sound(snd_easterEgg2,0,false);
		inputQueue="";
	}
}
	
//If we have pressed a button, set cooldown to max
if (vinput!=0 or hinput!=0)	{
	coolDown=coolDownMax;
	playSound(snd_menuMove,0,false);
}
	
optionSelected+=vinput;
//Mod doesn't work with negatives for some reason
if (optionSelected<0)
	optionSelected+=optionsLength;
optionSelected=optionSelected % optionsLength;

if (select)	{
	playSound(snd_menuSelect,0,false);
	var bitmask=power(2,optionSelected);
	optionChoices=optionChoices^bitmask;		//Set the bit mask
	var turnedOn=optionChoices&bitmask;
	
	//Set the option and we need to offset by 1 if a browser because we don't have the fullscreen option
	var _option=optionSelected;
	if (isBrowser and _option>0)
		_option+=1;
		
	switch (_option)	{
		case 0:
			room_goto_next();
			break;
		case 1:
			window_set_fullscreen(turnedOn);
			break;
		case 2:
			//AZERTY mode
			setAzerty(turnedOn);
			break;
		case 3:
			//FLIP keys
			leftyFlip();
			break;
		case 4:
			control.randomiser=turnedOn;
			break;
		case 5:
			control.permadeath=turnedOn;
			break;
		case 6:
			game_end();
			break;
	}
}