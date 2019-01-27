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
		
		with(player) 
		{
			//W,A,S,D,E,MOUSE
			var w = buffer_read(buff, buffer_s8);
			var a = buffer_read(buff, buffer_s8);
			var s = buffer_read(buff, buffer_s8);
			var d = buffer_read(buff, buffer_s8);
			var e = buffer_read(buff, buffer_s8);
			var m = buffer_read(buff, buffer_s8);
			var ma = buffer_read(buff, buffer_u16); 
		
		
			k_up = w == Key.Idle ? k_up : (w == Key.Pressed ? true : false);
			k_left = a == Key.Idle ? k_left : (a == Key.Pressed ? true : false);
			k_right = d == Key.Idle ? k_right : (d == Key.Pressed ? true : false);
			k_down = s == Key.Idle ? k_down : (s == Key.Pressed ? true : false);
			k_fire = m == Key.Idle ? k_fire : (m == Key.Pressed ? true : false); 
			k_action = e;
			fire_dir = ma;
		}
		
	break;
	
	case CmdPlayerRequest.InputVehicle: 
	
		var vehicleid = buffer_read(buff, buffer_gameid); 
		var vehicle = vehicle_map[? vehicleid];
		
		with(vehicle) 
		{
			//W,A,S,D,E,MOUSE
			var w = buffer_read(buff, buffer_s8);
			var a = buffer_read(buff, buffer_s8);
			var s = buffer_read(buff, buffer_s8);
			var d = buffer_read(buff, buffer_s8);
			var e = buffer_read(buff, buffer_s8);
			var m = buffer_read(buff, buffer_s8);
			var ma = buffer_read(buff, buffer_u16); 
		
		
			k_up = w == Key.Idle ? k_up : (w == Key.Pressed ? true : false);
			k_left = a == Key.Idle ? k_left : (a == Key.Pressed ? true : false);
			k_right = d == Key.Idle ? k_right : (d == Key.Pressed ? true : false);
			k_down = s == Key.Idle ? k_down : (s == Key.Pressed ? true : false);
			k_fire = m == Key.Idle ? k_fire : (m == Key.Pressed ? true : false); 
			k_action = e;
			fire_dir = ma;
		}
		
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
