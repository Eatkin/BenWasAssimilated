//Sets up the weapon grid
//Obj index, damage, cooldown, width and height (in cells), uses

global.weaponGrid=ds_grid_create(WeaponStat.Max,0);

addWeaponToGrid(obj_club				, 1 , 0 , 1 , 1 , -1, "CLUB");
addWeaponToGrid(obj_basicStaff			, 2 , 3 , 1 , 1 , 5, "BASIC STAFF");
addWeaponToGrid(obj_basicBow			, 1 , 3 , 1 , 1 , 10, "BASIC BOW");
addWeaponToGrid(obj_spade				, 2 , 0 , 1 , 1 , 10, "SPADE");
addWeaponToGrid(obj_sythe				, 1 , 1 , 3 , 1 , 10, "SCYTHE");
addWeaponToGrid(obj_ghostlyProjectile	, 2 , 2 , 1 , 1 , 5, "GHOSTLY PROJECTILE");
addWeaponToGrid(obj_spikedClub			, 2 , 1 , 1 , 2 , -1, "SPIKED CLUB");
addWeaponToGrid(obj_fastStaff			, 2 , 2 , 1 , 1 , 5, "FAST STAFF");
addWeaponToGrid(obj_fangs				, 1 , 1 , 1 , 1 , -1, "FANGS");
addWeaponToGrid(obj_throwingDagger		, 3 , 5 , 1 , 1 , 5, "THROWING DAGGER");
addWeaponToGrid(obj_bone				, 1 , 0 , 1 , 1 , 3, "BONE");
addWeaponToGrid(obj_dualStaff			, 5 , 3 , 1 , 2 , 10, "DUAL STAFF");
addWeaponToGrid(obj_greatAxe			, 5 , 3 , 3 , 2 , -1, "GREAT AXE");
addWeaponToGrid(obj_sword				, 5 , 2 , 1 , 3 , 20, "SWORD");
addWeaponToGrid(obj_grandStaff			, 10 , 0 , 3 , 2 , 5, "GRAND STAFF");
addWeaponToGrid(obj_golemSmash			, 8 , 6 , 1 , 3 , -1, "GOLEM SMASH");
addWeaponToGrid(obj_crossbow			, 8 , 3 , 5 , 1 , 10, "CROSSBOW");
addWeaponToGrid(obj_hotStaff			, 5 , 0 , 1 , 1 , 15, "HOT STAFF");
addWeaponToGrid(obj_greatSword			, 8 , 1 , 3 , 2 , 15, "GREAT SWORD");
addWeaponToGrid(obj_cornDog				, 20 , 0 , 3 , 3 , 15, "CORNDOG");
addWeaponToGrid(obj_glitch				, 50 , 1 , 13 , 13 , -1, "GLITCH");