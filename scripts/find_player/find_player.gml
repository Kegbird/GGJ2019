///@function find_player(playerid)
for(var i = 0; i < ds_list_size(player_list); i++)
{
	var player = player_list[| i];
	if(player.playerid == argument0)
	{ 
		return player;
	}
}
return noone;
