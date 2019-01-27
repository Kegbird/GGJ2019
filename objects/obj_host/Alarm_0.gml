
write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Position);
// Add all players coordinates
var size = ds_list_size(player_list);
buffer_write(sendbuffer, buffer_u8, size);
for (var i = 0; i < size; i++) {
	var p = player_list[| i]
	buffer_write(sendbuffer, buffer_gameid, p.playerid);
	buffer_write(sendbuffer, buffer_u16, floor(p.x + p.old_xspd));
	buffer_write(sendbuffer, buffer_u16, floor(p.y + p.old_yspd));
}

// Add all vehicles coordinates

//size = ds_list_size(vehicle_list);
//buffer_write(sendbuffer, buffer_u8, size);
//for (var i = 0; i < size; i++) {
//	var v = vehicle_list[| i]
//	buffer_write(sendbuffer, buffer_gameid, v.vehicleid);
//	buffer_write(sendbuffer, buffer_u16, floor(v.x + v.old_xspd));
//	buffer_write(sendbuffer, buffer_u16, floor(v.y + v.old_yspd));
//	buffer_write(sendbuffer, buffer_u16, floor(v.direction));
//}

net_host_send_all();


alarm[0] = correction_time;
