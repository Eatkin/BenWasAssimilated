/// @description

//Choose a random sprite
if (!spriteSelected)	{
	spriteSelected=true;
	sprite_index=irandom_range(spr_fireball,spr_cornDog);
}

if (destroy)
	instance_destroy();