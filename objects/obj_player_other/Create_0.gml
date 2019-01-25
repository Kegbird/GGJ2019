ready = false;
playerid = -1;
username = "unknown";
spd = 0;
dir = 0;
dir_car = 0;
boost = 100;
drifting = false;
boost_snd = -1;
boost_amount = 100;

//parameters
controller_deadzone = 0.1;
boost_strength = 2;
brake_strength = 0.7;
turn_radius = 3;
max_speed = 10;
max_speed_boost = 20; 
retro_speed = 5;
spd_decrease = 0.1;
turn_speed_decrease = 0.2;
acceleration = 0.5;

sockid = -1;

sound_engine = audio_play_sound(snd_engine, 1, true);
audio_sound_gain(sound_engine,1, 300);
audio_sound_pitch(sound_engine, 0.3);


