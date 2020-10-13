//Adds all inputs to a map

global.inputMap=ds_map_create();
ds_map_add(global.inputMap,"left",vk_left);
ds_map_add(global.inputMap,"right",vk_right);
ds_map_add(global.inputMap,"up",vk_up);
ds_map_add(global.inputMap,"down",vk_down);
ds_map_add(global.inputMap,"shoot left",ord("A"));
ds_map_add(global.inputMap,"shoot right",ord("D"));
ds_map_add(global.inputMap,"shoot up",ord("W"));
ds_map_add(global.inputMap,"shoot down",ord("S"));
ds_map_add(global.inputMap,"switch weapon",vk_shift);
ds_map_add(global.inputMap,"skip turn",190);		//Full stop key