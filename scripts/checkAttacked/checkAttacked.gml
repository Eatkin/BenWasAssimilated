var projList=ds_list_create();
var num=instance_place_list(x,y,parent_attack,projList,false);
var proj=noone;

//This loops through and checks if we're valid for being attacked
for (var i=0; i<num; i+=1)	{
	var inst=ds_list_find_value(projList,i);
	if (inst.collectible)
		continue;			//Ignore collectible instances
	if (isHero() and isHero(inst.owner))
		continue;			//Hero doesn't get hit by his own weapons
	if (!isHero() and !isHero(inst.owner))
		continue;			//Enemies don't hurt each other
	proj=inst;
}

ds_list_destroy(projList);

if (proj==noone)
	return false;

//Don't let bosses get hit
if (object_is_ancestor(object_index,parent_boss))
	return false;
	
		
//Set the projectile as having attacked someone and what not, destroy things
proj.attacked=true;
if (isHero())	{
	heroGetHurt(proj.damage);
	var text=choose("AYE YE BUGGER", "WHAT A KERFUFFLE", "IM TAKIN A PASTIN", "THEY FLUMMOXED ME");
	tickerAdd(text);
	
	playSound(snd_hurt,0,false);
}
else	{
	hp-=proj.damage;
	if (!instance_exists(obj_BenIV))	{
		var text=choose("SOUND JOB!", "SOUND AS A POUND", "AV IT!","I'M A WIRKSORTHIAN TAKE THAT");
		tickerAdd(text);
	}
	playSound(snd_hitEnemy,0,false);
}
		
instance_destroy(proj);
if (hp<0)
	if (!isHero())
		instance_destroy();

return true;