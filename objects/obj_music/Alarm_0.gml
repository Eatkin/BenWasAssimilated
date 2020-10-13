/// @description actually play music

if (musicPlaying!=noone)
	audio_sound_gain(musicPlaying,0,1000);

musicPlaying=audio_play_sound(music,0,false);
audio_sound_gain(musicPlaying,0,0);		//Fade it in
audio_sound_gain(musicPlaying,1,1000);