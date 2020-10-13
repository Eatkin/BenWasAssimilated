//Plays a sound but randomly varies the pitch so it sounds better!

var snd=argument0;
var priority=argument1;
var loop=argument2;
var theSound=audio_play_sound(snd,priority,loop);

var pitchVariation=random(0.2)-0.1;

audio_sound_pitch(theSound,1+pitchVariation);

return theSound;