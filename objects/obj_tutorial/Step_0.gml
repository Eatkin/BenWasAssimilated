/// @description

if (keyboard_check_pressed(vk_space))	{
	playSound(snd_menuSelect,0,false);
	room_goto_next();
}