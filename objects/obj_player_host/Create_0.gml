// Got from client
w = 0;
a = 0;
s = 0;
d = 0;
e = 0;
m = 0;
mx = 0;
my = 0; 

k_right = false;
k_up = false;
k_left = false;
k_down = false;
k_fire = false;
k_action = false;

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
