max_players = 8;

players_game_id = 0;
socket_list = ds_list_create();


server = network_create_server(network_socket_tcp, global.port, 8);

if(server < 0)
{
	show_message("host: can't create server on port " + string(global.port));
	instance_destroy();
	exit;
}

show_debug_message("server: " + string(server));
var car = instance_create_depth(100, 100, 0, obj_car);
car.gameid = -2;
room_goto(room_lobby);
	 