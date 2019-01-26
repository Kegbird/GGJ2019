max_players = 8;

players_game_id = 0;
socket_list = ds_list_create();

server = network_create_server(network_socket_tcp, global.port, 8);
//show_debug_message(string(p) + " " + string(server));


if(server < 0)
{
	show_message("host: can't create server on port " + string(global.port));
	instance_destroy();
	exit;
}

show_debug_message("server: " + string(server));
 
room_goto(room_game);