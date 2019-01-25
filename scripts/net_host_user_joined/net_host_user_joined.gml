 
 
var sock = async_load[? "socket"];

if(ds_list_size(player_list) < max_players)
{
	show_debug_message("added " + string(sock) + " | id " + string(async_load[? "id"]));
	ds_list_add(socket_list, sock);
	
	var player = instance_create_depth(100, 100, 0, obj_player_other);
	player.playerid = players_game_id++;
	player.sid = sock;
	ds_list_add(player_list, player);
	
	write_begin(Cmd.Accepted);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	net_host_send(sock);
	
	write_begin(Cmd.Joined);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	net_host_send_all_except(sock);
	 
	
}
else
{
	write_begin(Cmd.Rejected);
	net_host_send(sock);
}