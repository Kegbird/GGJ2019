// net
playerid = -1;
sockid = -1;
username = "unknown"; 
enum Key {
	Released = -1,
	Idle = 0,
	Pressed = 1,
}

// vars
active = true;
target = noone;
velocity = 1.2;
spd = 0;
dir = 0;
delay = 0;
delay_cooldown = 0.25;
delay_max = 5;
 
 
k_right = false;
k_up = false;
k_left = false;
k_down = false;
k_fire = false;
k_action = false;
fire_dir = 0;

old_xspd = 0;
old_yspd = 0;