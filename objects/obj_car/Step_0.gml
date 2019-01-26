
image_angle = direction;


if (delay > 0)
	delay -= delay_cooldown;

if (active) {
	if (keyboard_check(global.k_right)) {
		if (spd > 0)
			direction -= dirSpd;
		if (spd < 0)
			direction += dirSpd;
	}

	if (keyboard_check(global.k_left)) {
		if (spd > 0)
			direction += dirSpd;
		if (spd < 0)
			direction -= dirSpd;
	}

	var k_up = keyboard_check(global.k_up), k_do = keyboard_check(global.k_down);
	var collision = (collision_line(x, y, 
		x + lengthdir_x(sprite_width * 0.5 + abs(speed), direction + (spd > 0 || k_up ? 0 : 180)), 
		y + lengthdir_y(sprite_width * 0.5 + abs(speed), direction + (spd > 0 || k_up ? 0 : 180)), 
		obj_solid, true, false));
	
	if (!collision) {
		if (k_up) {
			spd += spdAcc; 
		}
		else if (k_do) {
			spd -= spdAcc;
		}
		collision_enter = false;
	}
	else {
		if (spd > 0 && !collision_enter) {
			bounce = clamp(spd * 0.5, 0, 5);
			collision_enter = true;
		}
		spd = 0; 
	}
	

	if (!keyboard_check(global.k_up) && !keyboard_check(global.k_down)) {
		if (spd > 0) spd -= 0.1;
		if (spd < 0) spd += 0.1;
	}

	spd = clamp(spd, -spdMax * 0.4, spdMax);
	speed = (spd - abs(bounce));
	
	if (bounce != 0) bounce = lerp(bounce, 0, 0.5);
	
	if (old_xspd != xSpd || old_yspd != ySpd) 
		ds_queue_enqueue(queue_velocity_change, id);
	
	old_xspd = xSpd;
	old_yspd = ySpd;


	if (type == 1) {
		if (mouse_check_button(global.k_action) & !delay) {
			delay = delay_max;
			_bull = instance_create_layer(x, y, "Instances", obj_bull);	
			
			_bull.direction = direction;
		}
	}
} 
else {
	if (spd > 0) spd -= 0.1;
	if (spd < 0) spd += 0.1;
	speed = spd;
}