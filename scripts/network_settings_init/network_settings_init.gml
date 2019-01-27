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
	PlayerUpdate,
	Mob,
	Map
	
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
	Fire,
	Position, //send the position of all the players 
	Velocity, //send the velocity change (spd, dir) of each player
	TakeVehicle, 
	LeftVehicle,
	Damage
}
  
enum CmdMob {
	None,
	Spawn
}

enum CmdMap{
	None,
	SpawnVehicle,
}
  
globalvar sendbuffer;
globalvar player_list;
globalvar player_map;

globalvar vehicle_map;
globalvar vehicle_list;

globalvar mob_list;
globalvar mob_map;
globalvar mob_next_id;
globalvar mobtype;
globalvar vehicle_next_id;
globalvar queue_damage_mob;
globalvar queue_velocity_change;

sendbuffer = buffer_create(256, buffer_grow, 1); 
player_list = ds_list_create();
player_map = ds_map_create();

vehicle_list = ds_list_create();
vehicle_map = ds_map_create();

mob_list = ds_list_create();
mob_map = ds_map_create();
mob_next_id = 0;
vehicle_next_id = 0;
mobtype[0] = obj_mob_ciccino_host;

#macro buffer_gameid buffer_s8
#macro buffer_cmd buffer_u8

queue_damage_mob = ds_queue_create();
queue_velocity_change = ds_queue_create();