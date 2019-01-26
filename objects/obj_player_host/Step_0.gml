k_up = w == Key.Idle ? k_up : (w == Key.Pressed ? true : false);
k_left = a == Key.Idle ? k_left : (a == Key.Pressed ? true : false);
k_right = d == Key.Idle ? k_right : (d == Key.Pressed ? true : false);
k_down = s == Key.Idle ? k_down : (s == Key.Pressed ? true : false);
k_fire = m == Key.Pressed;
k_action = e == Key.Idle ? k_action : (e == Key.Pressed ? true : false);

if (active) {
	direction = point_direction(x,y,mouse_x,mouse_y);
	if (mouse_x > x) image_xscale = -1; else image_xscale = 1;

	var xSpd = 0, ySpd = 0;

	if (delay > 0)
		delay -= delay_cooldown;

	///MOVIMENTO
	var moving = false;
	
	if (k_right) {
		xSpd += velocity;
		moving = true;
	}

	if (k_left) {
		xSpd -= velocity;
		moving = true;
	}

	if (k_up) {
		ySpd -= velocity;
		moving = true;
	}

	if (k_down) {
		ySpd += velocity;
		moving = true;
	}
	
	if (!moving) {
		image_speed = 1;
	}  
	else {
		image_speed = 0; 
		image_index = 0;
	}

	//spd = point_distance(x, y, x + xSpd, y + ySpd);
	//dir = point_direction(x, y, x + xSpd, y + ySpd);
	
	x += xSpd;
	y += ySpd;
	
	///FAI FUOCO
	if (mouse_check_button(k_fire) && !delay) {
		delay = delay_max;
		//_bull = instance_create_layer(x, y, "Instances", obj_bull);	
		//_bull.direction = direction;
	}

	///ENTRA NELLE VETTURE
	if (false) {
		var _car = instance_place(x, y, obj_car);
		if (_car && keyboard_check_pressed(k_action)) {
			active = false;
			target = _car;
			target.active = true;
		}
	}
} 
else {
	x = target.x;
	y = target.y;
	visible = false;
	if (keyboard_check_pressed(k_action)) {
		visible = true;
		active = true;
		target.active = false;
		target = id;
	}
}
