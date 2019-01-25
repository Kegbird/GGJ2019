var boost = 1; 
if(boost_amount > 0)
{
	if(gamepad_button_check_pressed(0, gp_face2))
	{
		if(!audio_is_playing(snd_boost_loop))
		{ 
			boost_snd = audio_play_sound(snd_boost_loop, 1, true);
		}
		audio_sound_gain(boost_snd, 1, 100);
	}
 
	if(gamepad_button_check_released(0, gp_face2))
	{ 
		audio_sound_gain(boost_snd, 0, 500);
	}
	
	if(audio_sound_get_gain(boost_snd) <= 0)
		audio_stop_sound(snd_boost_loop);
	
	if(gamepad_button_check(0, gp_face2))
	{
		boost = boost_strength;
	}
	
	boost_amount = max(0, boost_amount - 0.25);
}
		
var accel_value = gamepad_button_value(0, gp_shoulderrb);
var brake_value = gamepad_button_value(0, gp_shoulderlb);
var axis = gamepad_axis_value(0, gp_axislh);

drifting = gamepad_button_check(0, gp_shoulderl);

if(boost > 1)
{
	if(spd < max_speed_boost)
		spd += accel_value * acceleration * boost;
		
	for(var i = 0; i < random_range(3,6); i++)
	{
		var xp = x + lengthdir_x(random_range(15,20), dir_car + 180 + random_range(-40,40));
		var yp = y + lengthdir_y(random_range(15,20), dir_car + 180 + random_range(-40,40));
		instance_create_depth(xp, yp, depth + 1 , choose( obj_turbo, obj_smoke));
	}
}
else if(accel_value > 0)
{
	if(spd < max_speed)
		spd = min(max_speed, spd + accel_value * acceleration);
		
	
	for(var i = 0; i < random_range(0,3); i++)
	{
		var xp = x + lengthdir_x(random_range(15,20), dir_car + 180 + random_range(-40,40));
		var yp = y + lengthdir_y(random_range(15,20), dir_car + 180 + random_range(-40,40));
		
		instance_create_depth(xp, yp, depth + 1 , obj_smoke);
	}
	
}
else if(brake_value > 0)
{
	spd = max(-retro_speed, spd - brake_value * brake_strength);
}
else
	spd = max(0, spd - spd_decrease); 

spd = min(max_speed_boost, spd);





//steering
if(abs(axis) > controller_deadzone && abs(spd) > 0.2)
{
	var turn_add = 0.5;
	if(drifting)
		turn_add = 1;
		
	dir_car -= axis * turn_radius * (2-spd/max_speed_boost + turn_add) ;
	
	while(dir_car < 0)
		dir_car += 360;
	dir_car = dir_car mod 360;
	
	
}
	
//drifting
var diff = angle_difference(dir_car, dir);
 
if(drifting)
{
	if(!audio_is_playing(snd_drift))
	{
		sound_drift = audio_play_sound(snd_drift, 1, true);
	}
	
		audio_sound_gain(sound_drift,  0.8 * spd/max_speed_boost, 0);
		audio_sound_pitch(sound_drift,  0.8 + 0.2 * spd/max_speed_boost);
	
	dir += diff / 20;
	image_blend = c_red;
	if(abs(diff) < 10)
	{
		drifting = false;	
	}
}
else
{
	dir += diff / 5;
	image_blend = c_white;
	if(abs(diff) > 5 && spd > 0)
		spd = max(0, spd - turn_speed_decrease); 
	 
	if(audio_is_playing(snd_drift))
	{ 
		audio_stop_sound(snd_drift);
	}
}
	
	 

audio_sound_pitch(sound_engine, 0.3 + 0.5 * spd/max_speed_boost);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
	
image_angle = dir_car;
