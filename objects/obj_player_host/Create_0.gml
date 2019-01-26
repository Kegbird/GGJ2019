playerid = -1;
sockid = -1;
username = "unknown";

k_right = false;
k_up = false;
k_left = false;
k_down = false;
k_fire = false;
k_action = false;
fire_dir = 0;

enum Key {
	Released = -1,
	Idle = 0,
	Pressed = 1,
}

// Vars
active = true;
target = id;
velocity = 3;
delay = 0;
delay_cooldown = 0.25;
delay_max = 5;
dir = 0;
spd = 0;

position_set = false;

old_xspd = 0;
old_yspd = 0;