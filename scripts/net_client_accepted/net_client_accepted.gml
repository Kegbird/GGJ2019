var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
var px = buffer_read(buff, buffer_u32);
var py = buffer_read(buff, buffer_u32); 
show_debug_message("Accepted, playerid: " + string(playerid));

var player = instance_create_depth(px, py, 0, obj_player);
player.playerid = playerid;

room_goto(room_game);