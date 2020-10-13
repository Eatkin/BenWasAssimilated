//Projectiles have a different sprite when on the floor to what projectile they shoot
//This stores the projectiles that are shot

global.projectilePairs=ds_map_create();

ds_map_add(global.projectilePairs,obj_basicBow,spr_arrow);
ds_map_add(global.projectilePairs,obj_basicStaff,spr_fireball);
ds_map_add(global.projectilePairs,obj_fastStaff,spr_fireball);
ds_map_add(global.projectilePairs,obj_ghostlyProjectile,spr_ghostlyProjectile);
ds_map_add(global.projectilePairs,obj_bone,spr_bone);
ds_map_add(global.projectilePairs,obj_throwingDagger,spr_throwingDagger);
ds_map_add(global.projectilePairs,obj_dualStaff,spr_fireball);
ds_map_add(global.projectilePairs,obj_grandStaff,spr_fireball);
ds_map_add(global.projectilePairs,obj_crossbow,spr_arrow);
ds_map_add(global.projectilePairs,obj_hotStaff,spr_fireball);