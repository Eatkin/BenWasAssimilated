/// @description

if (active)	{
	event_inherited();

	
	//Don't lose ammo or have a cooldown
	projectileUses=retrieveWeaponUses(rangedWeapon);
	weaponUses=retrieveWeaponUses(meleeWeapon);
	projCooldown=0;
	meleeCooldown=0;
	showHpBar=false;		//Also don't show the HP bar
}