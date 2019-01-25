var buff = async_load[? "buffer"]; 
var sid = async_load[? "id"];
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdUser.Name: 
		var playerid = buffer_read(buff, buffer_gameid);
		
		var car = find_car(playerid);
		if(instance_exists(car))
		{
			if(car.sid != sid)
			{
				show_message_async("Hacking attempt detected");
				return;
			}
			car.username = buffer_read(buff, buffer_string);
			
			//send username change
			write_begin(Cmd.User);
			buffer_write(sendbuffer, buffer_cmd, CmdUser.Name);
			buffer_write(sendbuffer, buffer_gameid, car.playerid);
			buffer_write(sendbuffer, buffer_string, car.username);
			net_host_send_all_except (sid);
		}
		else
			show_message("host: can't find car");
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
