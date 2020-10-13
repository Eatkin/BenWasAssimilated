/// @description

if (!ds_list_empty(global.tickerList))	{
	ds_list_delete(global.tickerList,0);
	
	if (!ds_list_empty(global.tickerList))
		with (obj_hero)
			inputCooldown=inputCooldownMaxTicker;
}