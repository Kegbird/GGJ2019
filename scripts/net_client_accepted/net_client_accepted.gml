var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
var px = buffer_read(buff, buffer_u32);
var py = buffer_read(buff, buffer_u32); 
show_debug_message("Accepted, playerid: " + string(playerid));

// instantiate player
var player = instance_create_depth(px, py, 0, obj_player);
player.playerid = playerid;
player.username = global.username;
player.text = global.meaning;

//send username /text  on join
write_begin(Cmd.PlayerRequest);
buffer_write(sendbuffer, buffer_cmd, CmdPlayerRequest.Name);
buffer_write(sendbuffer, buffer_gameid, player.playerid);
buffer_write(sendbuffer, buffer_string, player.username);
buffer_write(sendbuffer, buffer_string, player.text);
net_client_send();

room_goto(room_game);