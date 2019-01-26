var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
show_debug_message("Accepted, playerid: " + string(playerid));

var player = instance_create_depth(-100, -100, 0, obj_player);
player.playerid = playerid;


room_goto(room_game);