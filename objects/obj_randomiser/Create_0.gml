/// @description

var randomiserList=ds_list_create();

//I'll use object indices in the list to add things to the list
var loopStart=obj_basicStaff;
var loopEnd=obj_cornDog;

//Weapons
for (var i=loopStart; i<=loopEnd; i+=1)	{
	//Uncollectable exceptions
	if (i==obj_ghostlyProjectile or i==obj_golemSmash)
		continue;
	ds_list_add(randomiserList,i);
}

loopStart=obj_terribleShield;
loopEnd=obj_stylishBoots;

//Equipment
for (var i=loopStart; i<=loopEnd; i+=1)
	ds_list_add(randomiserList,i);
	
//Randomise weapons
var listSize=ds_list_size(randomiserList)-1;
var weaponCount=instance_number(parent_attack);
var equipCount=instance_number(parent_equipment);
//Loop for array first
//I need to do this because some of the instances get replaced and return noone for some reason that only gamemaker knows
var inst;
for (var i=0; i<weaponCount; i+=1)
	inst[i]=instance_find(parent_attack,i);
	
//Also array of equipment
var _equip;
//Randomise equipment
for (var i=0; i<equipCount; i+=1)
	_equip[i]=instance_find(parent_equipment,i);
	
//Now start the replacement process
for (var i=0; i<weaponCount; i+=1)	{
	with (inst[i])	{
		var rand=irandom(listSize);
		var randInst=ds_list_find_value(randomiserList,rand);
		var myCost=cost;
		//Add replacement and make sure it's flagged as collectible
		var replacement=instance_create_layer(x,y,layer,randInst);
		replacement.cost=myCost;
		if (object_is_ancestor(replacement.object_index,parent_attack))
			replacement.collectible=true;
		instance_destroy();
	}
}

for (var i=0; i<equipCount; i+=1)	{
	with (_equip[i])	{
		var rand=irandom(listSize);
		var randInst=ds_list_find_value(randomiserList,rand);
		
		//Flag replacement as collectible
		var replacement=instance_create_layer(x,y,layer,randInst);
		if (object_is_ancestor(replacement.object_index,parent_attack))
			replacement.collectible=true;
		instance_destroy();
	}
}

//Randomise boss weapons
var boss=obj_ben2_boss;
repeat (2)	{
	with (boss)	{
		//Replace melee
		var newMelee;
		do		{
			var rand=irandom(listSize);
			newMelee=ds_list_find_value(randomiserList,rand);
		}
		until (object_is_ancestor(newMelee,parent_melee));
		//Replace projectile
		var newProj;
		do		{
			var rand=irandom(listSize);
			newProj=ds_list_find_value(randomiserList,rand);
		}
		until (object_is_ancestor(newProj,parent_projectile));
		
		meleeWeapon=newMelee;
		rangedWeapon=newProj;
	}

	//Then repeat with the next boss
	boss=obj_ben3_boss;
}

ds_list_destroy(randomiserList);
instance_destroy();