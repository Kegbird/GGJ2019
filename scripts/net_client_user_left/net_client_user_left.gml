var buff = argument0;

var gameid = buffer_read(buff, buffer_gameid);
show_debug_message("User left, gameid: " + string(gameid));

for(var i = 0; i < ds_list_size(car_list); i++)
{
	var car = car_list[| i];
	if(car.gameid == gameid)
	{
		ds_list_delete(car_list, i); 
		instance_destroy (car);
		break;
	}
}