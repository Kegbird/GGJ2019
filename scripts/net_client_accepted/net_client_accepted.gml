var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
show_debug_message("Accepted, playerid: " + string(playerid));

var spawn = scr_get_spawnpoint(obj_home);

var player = instance_create_depth(spawn[0], spawn[1], 0, obj_player);
player.playerid = playerid;


room_goto(room_game);