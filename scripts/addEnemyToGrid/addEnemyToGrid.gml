/// @function addEnemyToGrid(obj, hp, damage, evasion, range, jitter, moveScrPrimary, moveScrSeconary, melee, ranged, attackScrPrimary, attackScrSecondary, attackFail);
/// @description attempts to shoot a projectile, returns true if succesful
/// @param {real} obj object index
/// @param {real} hp health
/// @param {real} damage how much damage on contact
/// @param {real} evasion how likely they are to avoid projectiles (lower=more likely)
/// @param {real} range distance to hero (in cells) to be within to execute primary move script
/// @param {real} jitter chance of failing primary move script
/// @param {real} moveScrPrimary primary movement script
/// @param {real} moveScrSecondary secondary movement script
/// @param {real} melee melee weapon
/// @param {real} ranged ranged weapon
/// @param {real} attackScrPrimary primary attack script
/// @param {real} attackScrSecondary secondary attack script
/// @param {real} attackFail attack failure probability

var grid=global.enemyGrid;
var gridHeight=ds_grid_height(grid);
var gridWidth=ds_grid_width(grid);
ds_grid_resize(grid,gridWidth,gridHeight+1);

var obj=argument0;
var hp=argument1;
var damage=argument2;		//How much damage ON CONTACT because enemies have weapons
var evasion=argument3;		//Note: evasion of 0 means they'll never get hit
var range=argument4;
var jitter=argument5;		//How likely they are to fail their move primary script - jitter/(jitter+1) chance of failing
var moveScrPrimary=argument6;
var moveScrSecondary=argument7;
var melee=argument8;
var ranged=argument9;
var attackScrPrimary=argument10;
var attackScrSecondary=argument11;
var attackFailure=argument12;

ds_grid_set(grid,EnemyStat.ObjIndex,gridHeight,obj);
ds_grid_set(grid,EnemyStat.Hp,gridHeight,hp);
ds_grid_set(grid,EnemyStat.Damage,gridHeight,damage);
ds_grid_set(grid,EnemyStat.Evasion,gridHeight,evasion);
ds_grid_set(grid,EnemyStat.Range,gridHeight,range);
ds_grid_set(grid,EnemyStat.Jitter,gridHeight,jitter);
ds_grid_set(grid,EnemyStat.MovePrimary,gridHeight,moveScrPrimary);
ds_grid_set(grid,EnemyStat.MoveSecondary,gridHeight,moveScrSecondary);
ds_grid_set(grid,EnemyStat.MeleeWeapon,gridHeight,melee);
ds_grid_set(grid,EnemyStat.RangedWeapon,gridHeight,ranged);
ds_grid_set(grid,EnemyStat.AttackPrimary,gridHeight,attackScrPrimary);
ds_grid_set(grid,EnemyStat.AttackSecondary,gridHeight,attackScrSecondary);
ds_grid_set(grid,EnemyStat.AttackFailureRate,gridHeight,attackFailure);