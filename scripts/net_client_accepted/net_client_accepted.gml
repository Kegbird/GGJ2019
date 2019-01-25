var buff = argument0;

var playerid = buffer_read(buff, buffer_gameid);
show_debug_message("Accepted, playerid: " + string(playerid));


var car = instance_create_depth(100, 100, 0, obj_car);
car.playerid = playerid;

var car_host = instance_create_depth(100, 100, 0, obj_car_other);
car_host.playerid = -2;
ds_list_add(player_list, car_host);
room_goto(room_lobby);