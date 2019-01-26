var buff = argument0;
 
var player = instance_create_depth(100, 100, 0, obj_player_other);
player.playerid = buffer_read(buff, buffer_gameid); 
ds_list_add(player_list, player);
player_map[? player.playerid] = player;

show_debug_message("New User joined, playerid: " + string(player.playerid));

 