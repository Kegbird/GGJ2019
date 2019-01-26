write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Position);
var size = ds_list_size(player_list);
buffer_write(sendbuffer, buffer_u8, size);
// Add all players coordinates
for (var i = 0; i < size; i++) {
	buffer_write(sendbuffer, buffer_gameid, player_list[| i].playerid);
	buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].x));
	buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].y));
}
net_host_send_all();
