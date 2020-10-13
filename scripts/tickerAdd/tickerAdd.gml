//Just deletes the ticker list and replaces it

//Clears list then adds text
ds_list_clear(global.tickerList);

var text;
for (var i=0; i<argument_count; i+=1)	{
	text[i]=argument[i];
	text[i]=string_upper(text[i]);
	ds_list_add(global.tickerList,text[i]);
}

with (obj_hero)	{
	inputCooldown=inputCooldownMaxTicker;
}