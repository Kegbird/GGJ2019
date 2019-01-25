 
 
var sock = async_load[? "socket"];

if(ds_list_size(player_list) < max_players)
{
	show_debug_message("added " + string(sock) + " | id " + string(async_load[? "id"]));
	ds_list_add(socket_list, sock);
	
	var car = instance_create_depth(100, 100, 0, obj_car_other);
	car.playerid = players_game_id++;
	car.sid = sock;
	ds_list_add(player_list, car);
	
	write_begin(Cmd.Accepted);
	buffer_write(sendbuffer, buffer_gameid, car.playerid);
	net_host_send(sock);
	
	write_begin(Cmd.Joined);
	buffer_write(sendbuffer, buffer_gameid, car.playerid);
	net_host_send_all_except(sock);
	
	if(instance_number(obj_lobby) > 0)
		obj_lobby.lobby_time = 30;
	
}
else
{
	write_begin(Cmd.Rejected);
	net_host_send(sock);
}