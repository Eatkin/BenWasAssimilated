//Sets Azerty on and off

//create a temp map
var tempMap=ds_map_create();
ds_map_copy(tempMap,global.inputMap);

global.lefty=global.lefty^1;	//Bit flip

//Now copy the temp map to the regular map
ds_map_set(global.inputMap,"up",tempMap[? "shoot up"]);
ds_map_set(global.inputMap,"down",tempMap[? "shoot down"]);
ds_map_set(global.inputMap,"left",tempMap[? "shoot left"]);
ds_map_set(global.inputMap,"right",tempMap[? "shoot right"]);
ds_map_set(global.inputMap,"shoot up",tempMap[? "up"]);
ds_map_set(global.inputMap,"shoot down",tempMap[? "down"]);
ds_map_set(global.inputMap,"shoot left",tempMap[? "left"]);
ds_map_set(global.inputMap,"shoot right",tempMap[? "right"]);

ds_map_destroy(tempMap);