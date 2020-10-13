var grid=global.enemyGrid;
var gridHeight=ds_grid_height(grid);

var damage=0;
//Loop through until we find the obj index
for (var i=0; i<gridHeight; i+=1)
	if (grid[# EnemyStat.ObjIndex, i]==object_index)	{
		damage=grid[# EnemyStat.Damage, i];
		break;
	}
	
return damage;