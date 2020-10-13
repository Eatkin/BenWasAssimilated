var grid=global.weaponGrid;
var gridHeight=ds_grid_height(grid);

var obj=argument0;
var height=1;

//Loop through until we find the obj index
for (var i=0; i<gridHeight; i+=1)
	if (grid[# WeaponStat.ObjIndex, i]==obj)	{
		height=grid[# WeaponStat.Height, i];
		break;
	}
	
return height;