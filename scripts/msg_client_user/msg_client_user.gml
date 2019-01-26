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
			show_debug_message("Velocity change for: " + string(playerid));
			var xSpd = buffer_read(buff, buffer_f32);
			var ySpd = buffer_read(buff, buffer_f32);
			var player = player_map[? playerid];
			if (player != undefined && instance_exists(player)) 
			{ 
				player.xSpd = xSpd;
				player.ySpd = ySpd;
			}
		}
		 
	break;
	
	case CmdPlayerUpdate.Sync:		// Megapack
		
		var size = buffer_read(buff, buffer_u8);
		for (var i = 0; i < size; i++)
		{
			var playerid = buffer_read(buff, buffer_gameid);
			var vis = buffer_read(buff, buffer_u8);
			var x_coord = buffer_read(buff, buffer_u16);
			var y_coord = buffer_read(buff, buffer_u16);
			var xSpd = buffer_read(buff, buffer_f32);
			var ySpd = buffer_read(buff, buffer_f32);
			if (playerid != obj_player.playerid) {
				var player = instance_create_depth(0, 0, 0, obj_player_other);
				ds_list_add(player_list, player);
				player_map[? playerid] = player;
				player.playerid = playerid;
				player.visible = vis;
				player.x = x_coord;
				player.y = y_coord;
				player.xSpd = xSpd;
				player.ySpd = ySpd;
			}
		}
	break;
	
	default:
		show_message("msg_client_user received cmd: " + string(cmd));
	break;
}
