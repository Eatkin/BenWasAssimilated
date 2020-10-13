/// @description select a track to play

var musicToPlay=noone;
switch (room)	{
	case rm_title:
	case rm_options:
		musicToPlay=mus_menuMusic;
		loops=false;
		delay=0;
		break;
	case rm_game:
		musicToPlay=mus_chiptune;
		loopStart=0;
		loopEnd=44.308;
		loops=true;
		delay=0;
		break;
	case rm_gameOver:
		musicToPlay=mus_gameover;
		loops=false;
		delay=60;
		break;
	case rm_end:
		musicToPlay=mus_end;
		loops=false;
		delay=60;
		break;
	default:
		musicToPlay=noone;
		break;
}


//Early exit if we're already playing the music because we don't need to do anything else
if (music==musicToPlay)
	exit;

	
if (musicToPlay!=noone)	{
	//Start playing the music but there might be a delay, so it gets played in the alarm event
	music=musicToPlay;					//Save the sound index of what's playing
	alarm[0]=delay;
	//The alarm won't trigger at 0
	if (delay==0)
		event_perform(ev_alarm,0);
}