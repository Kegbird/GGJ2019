write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Velocity);
buffer_write(sendbuffer, buffer_u8, ds_queue_size(queue_velocity_change));
while (!ds_queue_empty(queue_velocity_change))
{
	var inst = ds_queue_dequeue(queue_velocity_change);
	buffer_write(sendbuffer, buffer_gameid, inst.playerid);
	buffer_write(sendbuffer, buffer_gameid, inst.old_xspd);
	buffer_write(sendbuffer, buffer_gameid, inst.old_yspd);

}