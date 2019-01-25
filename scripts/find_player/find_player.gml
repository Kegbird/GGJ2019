///@function find_player(playerid)
for(var i = 0; i < ds_list_size(player_list); i++)
{
	var car = player_list[| i];
	if(car.playerid == argument0)
	{ 
		return car;
	}
}
return noone;