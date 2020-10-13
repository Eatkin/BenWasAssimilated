/// @description

isBrowser=(os_browser==browser_not_a_browser)	?	false	:	true;

if (!isBrowser)	{
	option[0]="START GAME";
	option[1]="FULL SCREEN";
	option[2]="AZERTY";
	option[3]="FLIP WASD AND ARROWS KEYS";
	option[4]="RANDOMISER";
	option[5]="PERMADEATH";
	option[6]="EXIT GAME";
}
else	{
	option[0]="START GAME";
	option[1]="AZERTY";
	option[2]="FLIP WASD AND ARROWS KEYS";
	option[3]="RANDOMISER";
	option[4]="PERMADEATH";
}


optionSelected=0;

optionChoices=0;

//Set bitmasks
var mask=1;
if (!isBrowser)
	mask+=1;
	
if (global.azerty)
	optionChoices=optionChoices|power(2,mask);
	
if (global.lefty)
	optionChoices=optionChoices|power(2,mask+1);
	
if (control.randomiser)
	optionChoices=optionChoices|power(2,mask+2);
	
if (control.permadeath)
	optionChoices=optionChoices|power(2,mask+3);

coolDownMax=25;
coolDown=coolDownMax;

inputQueue="";