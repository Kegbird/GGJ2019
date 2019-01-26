 
 
var sock = async_load[? "socket"];

if(ds_list_size(player_list) < max_players)
{
	show_debug_message("added " + string(sock) + " | id " + string(async_load[? "id"]));
	ds_list_add(socket_list, sock);
	
	var player = instance_create_depth(100, 100, 0, obj_player_host);
	player.playerid = players_game_id++;
	player.sid = sock;
	ds_list_add(player_list, player);
	player_map[? player.playerid] = player;
	
	write_begin(Cmd.Accepted);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	net_host_send(sock);
	
	write_begin(Cmd.Joined);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	net_host_send_all_except(sock);
	
	// Sync new user
	write_begin(Cmd.PlayerUpdate);
	buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Sync);
	var size = ds_list_size(player_list);
	buffer_write(sendbuffer, buffer_u8, size);
	// Add all players coordinates
	for (var i = 0; i < size; i++) {
		buffer_write(sendbuffer, buffer_gameid, player_list[| i].playerid);
		buffer_write(sendbuffer, buffer_u8, player_list[| i].visible);
		buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].x));
		buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].y));
		buffer_write(sendbuffer, buffer_f32, player_list[| i].old_xspd);
		buffer_write(sendbuffer, buffer_f32, player_list[| i].old_yspd);
	}
	net_host_send(sock);
	 
	
}
else
{
	write_begin(Cmd.Rejected);
	net_host_send(sock);
}