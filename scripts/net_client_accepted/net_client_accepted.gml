var buff = argument0;

var gameid = buffer_read(buff, buffer_gameid);
show_debug_message("Accepted, gameid: " + string(gameid));


var car = instance_create_depth(100, 100, 0, obj_car);
car.gameid = gameid;

var car_host = instance_create_depth(100, 100, 0, obj_car_other);
car_host.gameid = -2;
ds_list_add(car_list, car_host);
room_goto(room_lobby);