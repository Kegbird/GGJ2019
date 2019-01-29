
image_angle = direction - 90;


if(!global.server)
{
	k_right = keyboard_check(global.k_right);
	k_up = keyboard_check(global.k_up);
	k_left = keyboard_check(global.k_left);
	k_down = keyboard_check(global.k_down);
	k_fire = mouse_check_button(global.k_fire) ; 
}

if (delay > 0)
	delay -= delay_cooldown;

if (active)
{
	if (k_right) {
		if (spd > 0)
			direction -= dirSpd;
		if (spd < 0)
			direction += dirSpd;
	}

	if (k_left) {
		if (spd > 0)
			direction += dirSpd;
		if (spd < 0)
			direction -= dirSpd;
	}
 
	var collision = (collision_line(x, y, 
		x + lengthdir_x(sprite_height * 0.5 + abs(speed), direction + (spd > 0 || k_up ? 0 : 180)), 
		y + lengthdir_y(sprite_height * 0.5 + abs(speed), direction + (spd > 0 || k_up ? 0 : 180)), 
		obj_solid, true, true));
	
	if (!collision) 
	{
		if (k_up) 
			spd += spdAcc; 
			
		else if (k_down) 
			spd -= spdAcc;
			
		collision_enter = false;
	}
	else 
	{
		if (spd > 0 && !collision_enter) 
		{
			bounce = clamp(spd * 0.5, 0, 5);
			collision_enter = true;
		}
		spd = 0; 
	}
	

	if (!k_up && !k_down) 
	{
		if (spd > 0) spd -= 0.1;
		if (spd < 0) spd += 0.1;
	}

	spd = clamp(spd, -spdMax * 0.4, spdMax);
	speed = (spd - abs(bounce));
	
	if (bounce != 0)
		bounce = lerp(bounce, 0, 0.5);


	if (type == 1) 
	{
		if (k_fire & !delay) 
		{
			delay = delay_max;
			_bull = instance_create_layer(x, y, "Instances", obj_bull);	
			
			_bull.direction = direction;
		}
	}
	
	
	if(!global.server)
	{
		update_depth_jak();

		write_begin(Cmd.PlayerRequest);
		buffer_write(sendbuffer, buffer_cmd, CmdPlayerRequest.InputVehicle);
		buffer_write(sendbuffer, buffer_gameid, vehicleid);

		buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_up) ? 1 : (keyboard_check_released(global.k_up) ? -1 : 0));
		buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_left) ? 1 : (keyboard_check_released(global.k_left) ? -1 : 0));
		buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_down) ? 1 : (keyboard_check_released(global.k_down) ? -1 : 0));
		buffer_write(sendbuffer, buffer_s8, keyboard_check_pressed(global.k_right) ? 1 : (keyboard_check_released(global.k_right) ? -1 : 0));
 
		 //buffer_write(sendbuffer, buffer_u16, floor(fire_dir));

		net_client_send();

		update_aim();
	}
} 


if(global.server)
{
	if(!active)
	{
		if (spd > 0.1) spd -= 0.1;
		else if (spd < 0.1) spd += 0.1;
		else 
		{
			spd = 0;
			speed = spd;
		}
		
		if(instance_place(x, y, obj_solid))
		{
			spd = 0;
			speed = 0;
		}
			
	}
	
	if (old_direction != direction || old_speed != speed) 
		ds_queue_enqueue(queue_velocity_change_car, id);
	
	old_direction = direction;
	old_speed = speed;
}

