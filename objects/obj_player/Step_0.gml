

if(!global.server)
{
	k_right = keyboard_check(global.k_right);
	k_up = keyboard_check(global.k_up);
	k_left = keyboard_check(global.k_left);
	k_down = keyboard_check(global.k_down);
	k_fire = mouse_check_button(global.k_fire) ;
	k_action = keyboard_check_pressed(global.k_action);
	fire_dir = 0;
}

if (active) {
	 
	fire_dir = point_direction(x, y, global.aim_xdir, global.aim_ydir);
	var xSpd = 0, ySpd = 0, yCor = 0, xCor = 0;
	
	if (delay > 0)
		delay -= delay_cooldown;
 
	///MOVIMENTO
	#region KEYBOARD
	if (k_right && !collision_line(x, y, x + velocity, y - velocity, obj_solid, true, false)) {
		xSpd += velocity;
		yCor -= velocity;
	}

	if (k_left && !collision_line(x, y, x - velocity, y + velocity, obj_solid, true, false)) {
		xSpd -= velocity;
		yCor += velocity;
	}

	if (k_up && !collision_line(x, y, x - velocity, y - velocity, obj_solid, true, false)) {
		ySpd -= velocity;
		xCor -= velocity;
	}

	if (k_down && !collision_line(x, y, x + velocity, y + velocity, obj_solid, true, false)) {
		ySpd += velocity;
		xCor += velocity;
	}
	
	var xFinal = (xSpd + xCor) * 0.5, yFinal = (ySpd + yCor) * 0.5;
	
	spd = point_distance(x, y, x + xFinal, y + yFinal);
	dir = point_direction(x, y, x + xFinal, y + yFinal);
	
	var radius = 6;
	if (!collision_circle(x + lengthdir_x(spd, dir), y + lengthdir_y(spd, dir), radius, obj_solid, true, false)) {
		x += xFinal;
		y += yFinal;
	}

	#endregion
	
	if(!global.server) 
		scr_player_animation(spd);
	else  if (k_fire && delay <= 0) 
	{
		delay = delay_max;
		
		var ist = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_bull);
		ist.hspeed = global.aim_xdir;
		ist.vspeed = global.aim_ydir;
	 
		fire_dir = point_direction(x, y, global.aim_xdir, global.aim_ydir);
		//METTERE IN CODA 
	}

	
	///ENTRA NELLE VETTURE
	if(global.server)
	{
			
		if (old_xspd != xSpd || old_yspd != ySpd) 
			ds_queue_enqueue(queue_velocity_change, id);
	
		old_xspd = xSpd;
		old_yspd = ySpd;
		
		if(k_action) {
			var car = collision_circle(x, y, 16, obj_car, 0, 1);
			if (car && !car.active) {
				active = false;
				target = car;
				car.active = true;
				write_begin(Cmd.PlayerUpdate);
				buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.TakeVehicle); 
				buffer_write(sendbuffer, buffer_gameid, playerid); 
				buffer_write(sendbuffer, buffer_gameid, car.vehicleid); 
				net_host_send_all();
				show_debug_message("entering vehicle");
				
			}
		}
	}
	
} 
else {
	
	if (global.server  && k_action) {
		
		write_begin(Cmd.PlayerUpdate);
		buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.LeftVehicle); 
		buffer_write(sendbuffer, buffer_gameid, playerid); 
		buffer_write(sendbuffer, buffer_gameid, target.vehicleid); 
		net_host_send_all();
		show_debug_message("leaving vehicle");
		visible = true;
		active = true;
		target.active = false;
		target = noone;
				
	}
	//else 
	//	visible = false;
	
}

if(target != noone)
{
	show_debug_message(string(x) + "," + string(y));
	x = target.x;
	y = target.y;
}
	
if(!global.server)
{
	update_depth_jak();

	write_begin(Cmd.PlayerRequest);
	buffer_write(sendbuffer, buffer_cmd, CmdPlayerRequest.Input);
	buffer_write(sendbuffer, buffer_gameid, playerid);

	buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_up) ? 1 : (keyboard_check_released(global.k_up) ? -1 : 0));
	buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_left) ? 1 : (keyboard_check_released(global.k_left) ? -1 : 0));
	buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_down) ? 1 : (keyboard_check_released(global.k_down) ? -1 : 0));
	buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_right) ? 1 : (keyboard_check_released(global.k_right) ? -1 : 0));
	buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_action) ? 1 : (keyboard_check_released(global.k_action) ? -1 : 0));
	buffer_write(sendbuffer, buffer_s8, mouse_check_button_pressed(global.k_fire) ? 1 : (mouse_check_button_released(global.k_fire) ? -1 : 0));
	buffer_write(sendbuffer, buffer_u16, floor(fire_dir));

	net_client_send();

	update_aim();
}