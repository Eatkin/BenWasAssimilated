//Sets up the enemy grid which contains object_index, hp, damage, evasion, range, jitter, move primary, move secondary
//...Melee weapon, ranged weapon, primary attack, secondary attack, attack failure rate

//Notes:
//0 is the min hp requiring one damage to kill
//Smaller evasion values give better evasion, i.e. 0=always avoid attacks where possible
//Range - in cells how close does the player have to be for primary attack script
//Jitter - how often movement script will fail (1/n)
//Attack failure rate - 1/n chance of not attacking

global.enemyGrid=ds_grid_create(EnemyStat.Max,0);

addEnemyToGrid(obj_chicken, 0 , 0 , 10 , 10 , 0 , 
				moveRandom, moveEvade,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_farmer, 1 , 1 , 5 , 8 , 5 , 
				movePathfindBasic, moveRandom,
				obj_spade, noone,
				enemyAttackMelee, enemyAttackMelee, 5);
addEnemyToGrid(obj_cow, 1 , 0 , 5 , 3 , 3 , 
				moveRandom, moveEvade,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_farmer2, 2 , 1 , 4 , 10 , 4 ,
				movePathfindBasic, moveRandom,
				obj_sythe, noone,
				enemyAttackMelee, enemyAttackMelee, 4);
addEnemyToGrid(obj_ghost, 3 , 2 , 2 , 5 , 2 ,
				movePathfindBasic, moveRandom,
				noone, obj_ghostlyProjectile,
				enemyAttackProjectile, enemyAttackProjectile, 4);
addEnemyToGrid(obj_ben2_boss, 6 , 4 , 0 , 3 , 0 ,
				movePathfindBasic, moveAway,
				obj_spikedClub, obj_basicBow,
				enemyAttackMelee, enemyAttackProjectile, 0);
addEnemyToGrid(obj_bat, 1 , 1 , 4 , 7 , 5 ,
				movePathfindToPlayer, moveRandom,
				obj_fangs, noone,
				enemyAttackMelee, enemyAttackMelee, 4);
addEnemyToGrid(obj_spider, 4 , 1 , 6 , 5 , 5 ,
				movePathfindBasic, moveRandom,
				obj_fangs, noone,
				enemyAttackMelee, enemyAttackMelee, 4);
addEnemyToGrid(obj_duck, 1, 0, 10, 10, 5,
				moveRandom, moveEvade,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_villageLady, 4 , 3 , 2 , 6 , 4 ,
				movePathfindBasic, moveRandom,
				noone, obj_bone,
				enemyAttackProjectile, enemyAttackProjectile, 3);
addEnemyToGrid(obj_ben3_boss, 8 , 6 , 0 , 4 , 0 ,
				movePathfindBasic, moveAway,
				obj_greatAxe, obj_dualStaff,
				enemyAttackMelee, enemyAttackProjectile, 0);
addEnemyToGrid(obj_bee, 8 , 3 , 1 , 6 , 1 ,
				movePathfindToPlayer, moveRandom,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_mage, 11 , 3 , 2 , 8 , 2 ,
				movePathfindBasic, moveRandom,
				noone, obj_dualStaff,
				enemyAttackProjectile, enemyAttackProjectile, 2);
addEnemyToGrid(obj_horse, 5 , 0 , 3 , 4 , 2 , 
				moveRandom, moveEvade,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_golem, 16 , 5 , 10 , 5 , 5 , 
				moveRandom, moveRandom,
				obj_golemSmash, noone,
				enemyAttackMelee, enemyAttackMelee, 2);
addEnemyToGrid(obj_sprite, 16 , 5 , 1 , 8 , 1 , 
				movePathfindBasic, moveRandom,
				obj_club, obj_crossbow,
				enemyAttackProjectile, enemyAttackMelee, 1);
addEnemyToGrid(obj_pig, 4 , 0 , 2 , 3 , 1 , 
				moveRandom, moveEvade,
				noone, noone,
				returnFalse, returnFalse, 0);
addEnemyToGrid(obj_shopkeep, 100000 , 0 , 0 , 10 , 20, 
				moveRandom, returnTrue, 
				noone, noone,
				returnFalse, returnFalse,0);
addEnemyToGrid(obj_ben4_boss, 1000 , 1000 , 0 , 10 , 0, 
				returnTrue, returnTrue,
				noone, noone,
				returnFalse, returnFalse, 0);