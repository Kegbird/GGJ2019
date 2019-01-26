


if (active) { 

	var xSpd = 0, ySpd = 0, yCor = 0, xCor = 0;

	if (delay > 0)
		delay -= delay_cooldown;

	///MOVIMENTO
	#region KEYBOARD
	if (k_right && !instance_position(x + velocity, y, obj_solid)) {
		xSpd += velocity;
		yCor -= velocity;
	}

	if (k_left && !instance_position(x - velocity, y, obj_solid)) {
		xSpd -= velocity;
		yCor += velocity;
	}

	if (k_up && !instance_position(x, y - velocity, obj_solid)) {
		ySpd -= velocity;
		xCor -= velocity;
	}

	if (k_down && !instance_position(x, y + velocity, obj_solid)) {
		ySpd += velocity;
		xCor += velocity;
	}
	#endregion
	
	var xFinal = (xSpd + xCor) * 0.5, yFinal = (ySpd + yCor) * 0.5;
	
	spd = point_distance(x, y, x + xFinal, y + yFinal);
	dir = point_direction(x, y, x + xFinal, y + yFinal);
	
	x += xFinal;
	y += yFinal;
	
	scr_player_animation(spd);
	
	///FAI FUOCO
	if (k_fire && delay <= 0) {
		delay = delay_max;
		
		//porcata by jak & cla
		with (obj_puntatore) event_perform(ev_other, ev_user0);
		var xspd = obj_puntatore.x;
		var yspd = obj_puntatore.y;
		fire_dir = point_direction(x, y, xspd, yspd);
		
		//TODO	ADD TO FIRE QUEUE
		//net_host_notify_fire(sid, playerid, fire_dir, 0);
	}

	///ENTRA NELLE VETTURE
	if (k_action) {
		//TODO enter car notify
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
	if (keyboard_check_pressed(global.k_action)) {
		visible = true;
		active = true;
		target.active = false;
		target = id;
	}
}

update_depth_jak();
 