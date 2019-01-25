var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
show_debug_message("Accepted, playerid: " + string(playerid));


var player = instance_create_depth(100, 100, 0, obj_player);
player.playerid = playerid;

var player_host = instance_create_depth(100, 100, 0, obj_player_other);
player_host.playerid = -2;
ds_list_add(player_list, player_host);
room_goto(room_game);