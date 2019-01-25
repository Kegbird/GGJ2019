var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
show_debug_message("User left, playerid: " + string(playerid));

for(var i = 0; i < ds_list_size(player_list); i++)
{
	var player = player_list[| i];
	if(player.playerid == playerid)
	{
		ds_list_delete(player_list, i); 
		instance_destroy (player);
		break;
	}
}