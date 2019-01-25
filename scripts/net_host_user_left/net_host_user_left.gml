 
var sock = async_load[? "socket"];
var idx = ds_list_find_index(socket_list, sock);
if(idx > -1)
{
	var car = ds_list_find_value(player_list, idx);
	if(instance_exists(car))
	{
		show_debug_message("socket left: " + string(sock));
		//handle car disconnection, sending to all the clients
		write_begin(Cmd.Left);
		buffer_write(sendbuffer, buffer_gameid, car.playerid); 
		net_host_send_all();
		instance_destroy (car);
	}

	ds_list_delete(socket_list, idx); 
	ds_list_delete(player_list, idx);
}