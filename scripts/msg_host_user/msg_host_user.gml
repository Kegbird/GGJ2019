var buff = async_load[? "buffer"]; 
var sid = async_load[? "id"];
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdUser.Name: 
		var playerid = buffer_read(buff, buffer_gameid);
		
		var player = find_player(playerid);
		if(instance_exists(player))
		{
			if(player.sid != sid)
			{
				show_message_async("Hacking attempt detected");
				return;
			}
			player.username = buffer_read(buff, buffer_string);
			
			//send username change
			write_begin(Cmd.Player);
			buffer_write(sendbuffer, buffer_cmd, CmdUser.Name);
			buffer_write(sendbuffer, buffer_gameid, player.playerid);
			buffer_write(sendbuffer, buffer_string, player.username);
			net_host_send_all_except (sid);
		}
		else
			show_message("host: can't find player");
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
