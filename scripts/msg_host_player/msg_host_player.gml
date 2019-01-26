var buff = async_load[? "buffer"]; 
var sid = async_load[? "id"];
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdPlayerRequest.Name: 
		var playerid = buffer_read(buff, buffer_gameid);
		
		var player = player_map[? playerid];
		if(instance_exists(player))
		{
			if(player.sid != sid)
			{
				show_message_async("Hacking attempt detected");
				return;
			}
			player.username = buffer_read(buff, buffer_string);
			
			//send username change
			write_begin(Cmd.PlayerUpdate);
			buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Name);
			buffer_write(sendbuffer, buffer_gameid, player.playerid);
			buffer_write(sendbuffer, buffer_string, player.username);
			net_host_send_all_except (sid);
		}
		else
			show_message("host: can't find player");

	break;

	
	case CmdPlayerRequest.Input: 
	
		var playerid = buffer_read(buff, buffer_gameid); 
		var player = player_map[? playerid];
		
		//W,A,S,D,E,MOUSE
		player.w = buffer_read(buff, buffer_s8);
		player.a = buffer_read(buff, buffer_s8);
		player.s = buffer_read(buff, buffer_s8);
		player.d = buffer_read(buff, buffer_s8);
		player.e = buffer_read(buff, buffer_s8);
		player.m = buffer_read(buff, buffer_s8);
		player.ma = buffer_read(buff, buffer_u16); 
		
		
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
