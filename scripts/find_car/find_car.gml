///@function find_car(gameid)
for(var i = 0; i < ds_list_size(car_list); i++)
{
	var car = car_list[| i];
	if(car.gameid == argument0)
	{ 
		return car;
	}
}
return noone;