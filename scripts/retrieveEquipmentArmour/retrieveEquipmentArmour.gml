var grid=global.equipGrid;
var gridHeight=ds_grid_height(grid);

var obj=argument0;
var armour=0;

//Loop through until we find the obj index
for (var i=0; i<gridHeight; i+=1)
	if (grid[# EquipStat.ObjIndex, i]==obj)	{
		//stats[0]=grid[# WeaponStat.Damage, i];
		armour=grid[# EquipStat.Armour, i];
		break;
	}
	
return armour;