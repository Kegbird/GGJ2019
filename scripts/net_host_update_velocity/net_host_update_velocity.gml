var size = ds_queue_size(queue_velocity_change);
if (size > 0)
{ 
	write_begin(Cmd.PlayerUpdate);
	buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Velocity);
	buffer_write(sendbuffer, buffer_u8, size); 
	while (!ds_queue_empty(queue_velocity_change))
	{
		var inst = ds_queue_dequeue(queue_velocity_change);
		buffer_write(sendbuffer, buffer_gameid, inst.playerid);
		buffer_write(sendbuffer, buffer_f32, inst.old_xspd);
		buffer_write(sendbuffer, buffer_f32, inst.old_yspd); 
	}

	net_host_send_all ();
}


size = ds_queue_size(queue_velocity_change_car);
if (size > 0)
{ 
	write_begin(Cmd.PlayerUpdate);
	buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.VelocityCar);
	buffer_write(sendbuffer, buffer_u8, size); 
	while (!ds_queue_empty(queue_velocity_change_car))
	{
		var inst = ds_queue_dequeue(queue_velocity_change_car);
		buffer_write(sendbuffer, buffer_gameid, inst.vehicleid);
		buffer_write(sendbuffer, buffer_f32, inst.old_speed);
		buffer_write(sendbuffer, buffer_f32, inst.old_direction); 
	}

	net_host_send_all ();
}