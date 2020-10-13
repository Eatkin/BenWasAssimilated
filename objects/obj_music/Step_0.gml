/// @description
	
if (loops)	{
	var pos=audio_sound_get_track_position(musicPlaying);
	if (pos>loopEnd)	{
		var resetPoint=pos-loopEnd
		audio_sound_set_track_position(musicPlaying,loopStart+resetPoint);
	}
}

if (audio_is_playing(musicPlaying) and room==rm_gameOver or room==rm_end)	{
	var pos=audio_sound_get_track_position(musicPlaying);
	if (pos>4)
		audio_sound_gain(musicPlaying,0,700);
}