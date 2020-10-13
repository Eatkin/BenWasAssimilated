/// @description

//Get all hero variables
var pHp=obj_hero.hp;
pHp=max(pHp,0);		//Don't let this go below 0 or weird shit happens with the HUD
var pHpMax=obj_hero.hpmax;
var pMWeapon=obj_hero.currentWeapon;
var pPWeapon=obj_hero.currentProjectile;
var currentW=obj_hero.weapon;
var pEquipment=obj_hero.equipmentHolding;
var pKeyItem=obj_hero.keyItemHolding;
if (pMWeapon!=noone)	{
	var MWeaponUses=obj_hero.weaponUses;
	var MWeaponCooldown=obj_hero.meleeCooldown;
}
if (pPWeapon!=noone)	{
	var PWeaponUses=obj_hero.projectileUses;
	var PWeaponCooldown=obj_hero.projCooldown;
}
if (pEquipment!=noone)	{
	var pArmour=obj_hero.equipmentArmour;
	var pArmourMax=obj_hero.equipmentArmourMax;
}

var pGold=obj_hero.gold;

var guiTop=222;

draw_set_colour(c_black);
draw_rectangle(0,guiTop,480,guiTop+48,false);

draw_set_colour(c_white);
draw_set_font(global.tickerFont);
draw_set_halign(fa_center);
if (!ds_list_empty(global.tickerList))	{
	var tickerText=ds_list_find_value(global.tickerList,0);
	draw_text(240,222,tickerText);
}

//Draw hp
var xdraw=16;
var ydraw=guiTop+16;

//If we're Ben IV we do a tile count
if (instance_exists(obj_BenIV))	{
	var _tiles=obj_BenIV.tileCount;
	draw_set_halign(fa_left);
	draw_text(xdraw,ydraw,_tiles);
	draw_set_halign(fa_middle);
}

var fullHearts=floor(pHp/2);
var halfHearts=pHp%2;
var emptyHearts=floor((pHpMax-pHp)/2);

var c=getColour(Colour.Red);

repeat (fullHearts)	{
	draw_sprite_ext(spr_heartFull,0,xdraw,ydraw,1,1,0,c,1);
	xdraw+=16;
}

//We draw either half hearts, empty heart or neither
repeat(halfHearts)	{
	draw_sprite_ext(spr_heartHalf,0,xdraw,ydraw,1,1,0,c,1);
	xdraw+=16;
}
	
repeat(emptyHearts)	{
	draw_sprite_ext(spr_heartEmpty,0,xdraw,ydraw,1,1,0,c,1);
	xdraw+=16;
}
	
//Equipment
xdraw=192;
ydraw=guiTop+16;
if (pEquipment!=noone)	{
	var spr=object_get_sprite(pEquipment);
	draw_sprite(spr,0,xdraw,ydraw);
	
	//Draw armour
	var fullArmours=floor(pArmour/2);
	var halfArmours=pArmour%2;
	var emptyArmours=floor((pArmourMax-pArmour)/2);
	xdraw=16;
	ydraw+=16;
	repeat (fullArmours)	{
		draw_sprite(spr_heartFull,0,xdraw,ydraw);
		xdraw+=16;
	}
	repeat (halfArmours)	{
		draw_sprite(spr_heartHalf,0,xdraw,ydraw);
		xdraw+=16;
	}
	repeat (emptyArmours)	{
		draw_sprite(spr_heartEmpty,0,xdraw,ydraw);
		xdraw+=16;
	}
	
	//Revert back to the correct draw positions
	xdraw=192;
	ydraw=guiTop+16;
}
//Key items
if (pKeyItem!=noone)	{
	var spr=object_get_sprite(pKeyItem);
	draw_sprite(spr,0,xdraw+32,ydraw);
}
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
draw_sprite(spr_bigFrame,0,xdraw+32,ydraw);

//Gold
xdraw+=64;
draw_sprite(spr_bigFrame,0,xdraw,ydraw);
var subimg=floor(pGold/20);
subimg=min(subimg,sprite_get_number(spr_gold)-1);
draw_sprite(spr_gold,subimg,xdraw,ydraw);
xdraw+=16;
var letters=string_length(pGold);
var textx=xdraw+8;
if (letters>1)
	textx+=string_width(string_char_at(pGold,2))*0.5;
draw_text(textx,ydraw,pGold);


//Weapons
//Melee
xdraw=308; //This gives us 10 cells to use + 1 for the border
ydraw=guiTop+16;
draw_sprite(spr_frame,0,xdraw,ydraw);
if (pMWeapon!=noone)	{
	var c=Colour.White;
	if (currentW==Weapon.Melee)
		c=Colour.Yellow;
	c=getColour(c);
	var spr=object_get_sprite(pMWeapon);
	draw_sprite_ext(spr,0,xdraw,ydraw,1,1,0,c,1);
	
	xdraw+=32;
	//Damage
	draw_sprite(spr_dagger,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	var dam=retrieveWeaponDamage(pMWeapon);
	xdraw+=16;
	draw_text(xdraw+8,ydraw,dam);
	
	//Uses
	xdraw+=32;
	draw_sprite(spr_uses,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	xdraw+=16;
	if (MWeaponUses<0)
		draw_sprite(spr_infinity,0,xdraw,ydraw);
	else	{
		var letters=string_length(MWeaponUses);
		var textx=xdraw+8;
		if (letters>1)
			textx+=string_width(string_char_at(MWeaponUses,2))*0.5;
		draw_text(textx,ydraw,MWeaponUses);
	}
		
	//Cooldown
	xdraw+=32;
	draw_sprite(spr_cooldown,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	xdraw+=16;
	draw_text(xdraw+8,ydraw,MWeaponCooldown);
}
//Projectile
xdraw=308;
ydraw+=16;
draw_sprite(spr_frame,0,xdraw,ydraw);
if (pPWeapon!=noone)	{
	var spr=object_get_sprite(pPWeapon);
	var c=Colour.White;
	if (currentW==Weapon.Projectile)
		c=Colour.Yellow;
	c=getColour(c);
	var xoffset=sprite_get_xoffset(spr);
	var yoffset=sprite_get_yoffset(spr);
	draw_sprite_ext(spr,0,xdraw+xoffset,ydraw+yoffset,1,1,0,c,1);
	
	xdraw+=32;
	//Damage
	draw_sprite(spr_dagger,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	var dam=retrieveWeaponDamage(pPWeapon);
	xdraw+=16;
	draw_text(xdraw+8,ydraw,dam);
	
	//Uses
	xdraw+=32;
	draw_sprite(spr_uses,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	xdraw+=16;
	if (PWeaponUses<0)
		draw_sprite(spr_infinity,0,xdraw,ydraw);
	else	{
		//xdraw+=16;
		if (PWeaponUses<0)
			draw_sprite(spr_infinity,0,xdraw,ydraw);
		else	{
			var letters=string_length(PWeaponUses);
			var textx=xdraw+8;
			if (letters>1)
				textx+=string_width(string_char_at(PWeaponUses,2))*0.5;
			draw_text(textx,ydraw,PWeaponUses);
		}
	}
		
	//Cooldown
	xdraw+=32;
	draw_sprite(spr_cooldown,0,xdraw,ydraw);
	draw_sprite(spr_bigFrame,0,xdraw,ydraw);
	xdraw+=16;
	draw_text(xdraw+8,ydraw,PWeaponCooldown);
}