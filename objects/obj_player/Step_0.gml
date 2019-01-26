if (active) {
	direction = point_direction(x,y,mouse_x,mouse_y);
	if (mouse_x > x) image_xscale = -1; else image_xscale = 1;

	var xSpd = 0, ySpd = 0;

	if (delay > 0)
		delay -= delay_cooldown;

	///MOVIMENTO
	var moving = false;
	
	if (keyboard_check(global.k_right)) {
		xSpd += velocity;
		moving = true;
	}

	if (keyboard_check(global.k_left)) {
		xSpd -= velocity;
		moving = true;
	}

	if (keyboard_check(global.k_up)) {
		ySpd -= velocity;
		moving = true;
	}

	if (keyboard_check(global.k_down)) {
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
	if (mouse_check_button(global.k_fire) && !delay) {
		delay = delay_max;
		//_bull = instance_create_layer(x, y, "Instances", obj_bull);	
		//_bull.direction = direction;
	}

	///ENTRA NELLE VETTURE
	if (false) {
		var _car = instance_place(x, y, obj_car);
		if (_car && keyboard_check_pressed(global.k_action)) {
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
	if (keyboard_check_pressed(global.k_action)) {
		visible = true;
		active = true;
		target.active = false;
		target = id;
	}
}