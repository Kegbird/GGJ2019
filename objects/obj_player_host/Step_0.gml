if (active) {  

	var xSpd = 0, ySpd = 0;

	if (delay > 0)
		delay -= delay_cooldown;

	///MOVIMENTO
	#region KEYBOARD
	var moving = false;
	
	if (k_right && !instance_position(x + velocity, y, obj_solid)) {
		xSpd += velocity;
		moving = true;
	}

	if (k_left && !instance_position(x - velocity, y, obj_solid)) {
		xSpd -= velocity;
		moving = true;
	}

	if (k_up && !instance_position(x, y - velocity, obj_solid)) {
		ySpd -= velocity;
		moving = true;
	}

	if (k_down && !instance_position(x, y + velocity, obj_solid)) {
		ySpd += velocity;
		moving = true;
	}
	#endregion
 

	//spd = point_distance(x, y, x + xSpd, y + ySpd);
	dir = point_direction(x, y, x + xSpd, y + ySpd);
	
	x += xSpd;
	y += ySpd;
	
	///FAI FUOCO
	if (k_fire && delay <= 0) {
		delay = delay_max;
		var b = instance_create_layer(x, y, "Instances", obj_bull);	
		b.direction = fire_dir;
	}

	///ENTRA NELLE VETTURE
	if (k_action) {
		var car = instance_place(x, y, obj_car);
		if (car) {
			active = false;
			target = car;
			target.active = true;
		}
	}
	
	if (old_xspd != xSpd || old_yspd != ySpd) 
		ds_queue_enqueue(queue_velocity_change, id);
	
	old_xspd = xSpd;
	old_yspd = ySpd;
} 
else {
	x = target.x;
	y = target.y;
	visible = false;
	if (k_action) {
		visible = true;
		active = true;
		target.active = false;
		target = id;
	}
}
 