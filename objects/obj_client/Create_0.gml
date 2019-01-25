client = network_create_socket(network_socket_tcp);

var success = network_connect(client, global.ip, global.port);
if (success < 0)
{
	show_message("client: can't connect to " + string(global.ip) + ":" + string(global.port));
	instance_destroy();
}
