ini_open("settings.ini");
global.ip = ini_read_string("net", "ip", "127.0.0.1"); // 192.168.43.59
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
	Sync,
	Position, //send the position of all the players 
	Velocity, //send the velocity change (spd, dir) of each player
	TakeVehicle, 
	LeftVehicle,
	Damage
}
  
globalvar sendbuffer;
globalvar player_list;
globalvar player_map;

globalvar queue_damage_mob;
globalvar queue_velocity_change;

sendbuffer = buffer_create(256, buffer_grow, 1); 
player_list = ds_list_create();
player_map = ds_map_create();

#macro buffer_gameid buffer_s8
#macro buffer_cmd buffer_u8

queue_damage_mob = ds_queue_create();
queue_velocity_change = ds_queue_create();