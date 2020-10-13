var grid=global.equipGrid;
var gridHeight=ds_grid_height(grid);
var gridWidth=ds_grid_width(grid);
ds_grid_resize(grid,gridWidth,gridHeight+1);

var obj=argument0;
var armour=argument1;

ds_grid_set(grid,EquipStat.ObjIndex,gridHeight,obj);
ds_grid_set(grid,EquipStat.Armour,gridHeight,armour);