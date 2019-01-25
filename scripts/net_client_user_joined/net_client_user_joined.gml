var buff = argument0;
 
var car = instance_create_depth(100, 100, 0, obj_car_other);
car.playerid = buffer_read(buff, buffer_gameid); 
ds_list_add(player_list, car);

show_debug_message("New User joined, playerid: " + string(car.playerid));


if(instance_number(obj_lobby) > 0)
	obj_lobby.lobby_time = 30;