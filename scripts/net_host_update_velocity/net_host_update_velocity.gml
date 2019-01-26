var size = ds_queue_size(queue_velocity_change);
if (size <= 0)
	return; 
	
write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Velocity);
buffer_write(sendbuffer, buffer_u8, size); 
while (!ds_queue_empty(queue_velocity_change))
{
	var inst = ds_queue_dequeue(queue_velocity_change);
	buffer_write(sendbuffer, buffer_gameid, inst.playerid);
	buffer_write(sendbuffer, buffer_f16, inst.old_xspd);
	buffer_write(sendbuffer, buffer_f16, inst.old_yspd); 
}

net_host_send_all ();