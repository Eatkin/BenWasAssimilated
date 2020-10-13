var grid=global.weaponGrid;
var gridHeight=ds_grid_height(grid);
var gridWidth=ds_grid_width(grid);
ds_grid_resize(grid,gridWidth,gridHeight+1);

var obj=argument0;
var damage=argument1;
var cooldown=argument2;
var width=argument3;
var height=argument4;
var uses=argument5;
var name=argument6;

ds_grid_set(grid,WeaponStat.ObjIndex,gridHeight,obj);
ds_grid_set(grid,WeaponStat.Damage,gridHeight,damage);
ds_grid_set(grid,WeaponStat.Cooldown,gridHeight,cooldown);
ds_grid_set(grid,WeaponStat.Width,gridHeight,width);
ds_grid_set(grid,WeaponStat.Height,gridHeight,height);
ds_grid_set(grid,WeaponStat.Uses,gridHeight,uses);
ds_grid_set(grid,WeaponStat.Name,gridHeight,name);