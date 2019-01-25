var buff = async_load[? "buffer"]; 
var sid = async_load[? "id"];
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdLobby.Ready: 
		var playerid = buffer_read(buff, buffer_gameid);
		
		var car = find_car(playerid);
		if(instance_exists(car))
		{
			if(car.sid != sid)
			{
				show_message_async("Hacking attempt detected");
				return;
			}
			car.ready = buffer_read(buff, buffer_bool);
			
			//send car ready change
			write_begin(Cmd.Lobby);
			buffer_write(sendbuffer, buffer_cmd, CmdLobby.Ready);
			buffer_write(sendbuffer, buffer_gameid, car.playerid);
			buffer_write(sendbuffer, buffer_gameid, car.ready);
			net_host_send_all_except (sid);
		}
		else
			show_message("host: can't find car");
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
