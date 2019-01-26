write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Fire);
buffer_write(sendbuffer, buffer_gameid, argument1); // Player id
buffer_write(sendbuffer, buffer_u16, argument2);	// Direction
buffer_write(sendbuffer, buffer_u8, argument3);	// Type, currently not used
net_host_send_all_except(argument0);
