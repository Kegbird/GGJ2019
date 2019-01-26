write_begin(Cmd.PlayerUpdate);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Position);
var size = ds_list_size(player_list);
buffer_write(sendbuffer, buffer_u8, size);
// Add all players coordinates
for (var i = 0; i < size; i++) {
	var p = player_list[| i]
	buffer_write(sendbuffer, buffer_gameid, p.playerid);
	buffer_write(sendbuffer, buffer_u16, floor(p.x + p.old_xspd));
	buffer_write(sendbuffer, buffer_u16, floor(p.y + p.old_yspd));
}
net_host_send_all();
