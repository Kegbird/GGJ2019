var cam = view_get_camera(0);
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam); 
var vh = camera_get_view_height(cam); 

//host 
var is_host = instance_number(obj_host) == 1;

if(is_host)
	draw_text_transformed(vx, vy, "Host", 1, 1, 0);
else
	draw_text_transformed(vx, vy, "Client", 1, 1, 0);

draw_set_halign(fa_center);
draw_text_transformed(vx + vw / 2, vy, "WAITING FOR OTHER PLAYERS", 1, 1, 0);
draw_set_halign(fa_left);


draw_set_color(c_black);
var ready = true;
for (var i = 0; i < ds_list_size(car_list); i++)
{
	var car = car_list[| i];
	if(instance_exists(car))
	{
		var r = car.ready ? "[v]" : "[ ]";
		draw_text(vx + 10, vy + 50 + 12 * i, string(i) + ")" + r + car.username);
		ready &= car.ready;
	}
	else
		draw_text(vx + 10, vy + 50 + 12 * i, string(i) + ")" + "<BUG>"); 
}

var lastname = obj_car.username;
obj_car.username = textbox.text;

if(is_host)
{
	if(ds_list_size(car_list) > 0)
	{
		if(ready || lobby_time <= 0)
		{
			if(button_pressed(spr_button, vx, vy + vh - 100, 1, 1, "Start"))
			{
				//send start to all
				room_goto_next();
			}
		}
	}
	 
	if(obj_car.username != lastname)
	{ 
		write_begin(Cmd.User);
		buffer_write(sendbuffer, buffer_cmd, CmdUser.Name);
		buffer_write(sendbuffer, buffer_gameid, obj_car.gameid);
		buffer_write(sendbuffer, buffer_string, obj_car.username);
		net_host_send_all();
	}
}
else
{
	if(button_pressed(spr_button, vx, vy + vh - 100, 1, 1, "Ready"))
	{ 
		write_begin(Cmd.Lobby);
		buffer_write(sendbuffer, buffer_cmd, CmdLobby.Ready);
		buffer_write(sendbuffer, buffer_gameid, obj_car.gameid);
		buffer_write(sendbuffer, buffer_gameid, true);
		net_client_send();
	}
	
			
	if(obj_car.username != lastname)
	{ 
		write_begin(Cmd.User);
		buffer_write(sendbuffer, buffer_cmd, CmdUser.Name);
		buffer_write(sendbuffer, buffer_gameid, obj_car.gameid);
		buffer_write(sendbuffer, buffer_string, obj_car.username);
		net_client_send();
	}
}

draw_text(vx, vy + vh - 120, "time: " + string(ceil(lobby_time)));
lobby_time = max(0, lobby_time - 1/room_speed);