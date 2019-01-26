var buff = async_load[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdPlayerUpdate.Name: 
		var playerid = buffer_read(buff, buffer_gameid);
		var player = player_map[? playerid];
		if(instance_exists(player)) 
			player.username = buffer_read(buff, buffer_string);	 
		else
			show_message("client: can't find player");
	break;
	
	case CmdPlayerUpdate.Velocity: 
	
		var size = buffer_read(buff, buffer_u8);
		for (var i = 0; i < size; i++)
		{
			var playerid = buffer_read(buff, buffer_gameid);
			var player = player_map[? playerid];
			if(instance_exists(player)) 
			{ 
				player.xSpd = buffer_read(buff, buffer_f16);
				player.ySpd = buffer_read(buff, buffer_f16);
			}
		}
		 
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
