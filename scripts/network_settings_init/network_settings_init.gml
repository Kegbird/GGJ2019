ini_open("settings.ini");
global.ip = ini_read_string("net", "ip", "127.0.0.1");
global.port = ini_read_real("net", "port", 10000);


enum Cmd
{
	None,
	Accepted,
	Rejected,
	Joined,
	Left,
	PlayerRequest,
	PlayerUpdate
}

// From client to server
enum CmdPlayerRequest
{
	None,
	Name,
	Input
}

// Data update sent from server to client 
enum CmdPlayerUpdate
{
	None,
	Name,
	Position,
	Velocity,
	TakeVehicle,
	LeftVehicle,
	Damage
}
 

globalvar sendbuffer; 
globalvar player_list; 
globalvar player_map;

sendbuffer = buffer_create(256, buffer_grow, 1); 
player_list = ds_list_create();
player_map = ds_map_create();

#macro buffer_gameid buffer_s8
#macro buffer_cmd buffer_u8