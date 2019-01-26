if (active) {
	mouse_dir = point_direction(x,y,mouse_x,mouse_y);

	var xSpd = 0, ySpd = 0;

	if (delay > 0)
		delay -= delay_cooldown;

	///MOVIMENTO
	#region KEYBOARD
	if (keyboard_check(global.k_right) && !instance_position(x + velocity, y, obj_solid)) {
		xSpd += velocity;
	}

	if (keyboard_check(global.k_left) && !instance_position(x - velocity, y, obj_solid)) {
		xSpd -= velocity;
	}

	if (keyboard_check(global.k_up) && !instance_position(x, y - velocity, obj_solid)) {
		ySpd -= velocity;
	}

	if (keyboard_check(global.k_down) && !instance_position(x, y + velocity, obj_solid)) {
		ySpd += velocity;
	}
	#endregion
	

	spd = point_distance(x, y, x + xSpd, y + ySpd);
	dir = point_direction(x, y, x + xSpd, y + ySpd);
	
	x += xSpd;
	y += ySpd;
	
	scr_player_animation(spd);
	
	///FAI FUOCO
	if (mouse_check_button(global.k_fire) && delay <= 0) {
		delay = delay_max;
		var b = instance_create_layer(x, y, "Instances", obj_bull);	
		b.direction = mouse_dir;
	}

	///ENTRA NELLE VETTURE
	if (keyboard_check_pressed(global.k_action)) {
		var car = instance_place(x, y, obj_car);
		if (car) {
			active = false;
			target = car;
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

write_begin(Cmd.PlayerRequest);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerRequest.Input);
buffer_write(sendbuffer, buffer_gameid, playerid);

buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_up) ? 1 : (keyboard_check_released(global.k_up) ? -1 : 0));
buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_left) ? 1 : (keyboard_check_released(global.k_left) ? -1 : 0));
buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_down) ? 1 : (keyboard_check_released(global.k_down) ? -1 : 0));
buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_right) ? 1 : (keyboard_check_released(global.k_right) ? -1 : 0));
buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_action) ? 1 : (keyboard_check_released(global.k_action) ? -1 : 0));
buffer_write(sendbuffer, buffer_s8, mouse_check_button_pressed(global.k_fire) ? 1 : (mouse_check_button_released(global.k_fire) ? -1 : 0));
buffer_write(sendbuffer, buffer_u16, floor(mouse_dir));


net_client_send();