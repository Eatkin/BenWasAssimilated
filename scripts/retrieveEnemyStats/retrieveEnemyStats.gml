var grid=global.enemyGrid;
var gridHeight=ds_grid_height(grid);

hp=1;
damage=1;
evasion=1;
range=1;
moveScriptPrimary=returnTrue;
moveScriptSecondary=returnTrue;;

//Loop through until we find the obj index
for (var i=0; i<gridHeight; i+=1)
	if (grid[# EnemyStat.ObjIndex, i]==object_index)	{
		hp=grid[# EnemyStat.Hp, i];
		damage=grid[# EnemyStat.Damage, i];
		evasion=grid[# EnemyStat.Evasion, i];
		range=grid[# EnemyStat.Range,i];
		jitter=grid[# EnemyStat.Jitter,i];
		moveScriptPrimary=grid[# EnemyStat.MovePrimary,i];
		moveScriptSecondary=grid[# EnemyStat.MoveSecondary,i];
		meleeWeapon=grid[# EnemyStat.MeleeWeapon,i];
		rangedWeapon=grid[# EnemyStat.RangedWeapon,i];
		attackScriptPrimary=grid[# EnemyStat.AttackPrimary,i];
		attackScriptSecondary=grid[# EnemyStat.AttackSecondary,i];
		attackFailureRate=grid[# EnemyStat.AttackFailureRate,i];
		break;
	}
	
hpmax=hp;
