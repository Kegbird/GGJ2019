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
	
	case CmdPlayerUpdate.VelocityCar: 
	
		var size = buffer_read(buff, buffer_u8);
		for (var i = 0; i < size; i++)
		{
			var vehicleid = buffer_read(buff, buffer_gameid);
			
			show_debug_message("msg_client_user: vehicleid: " + vehicleid);
			//show_debug_message("Velocity change for car: " + string(playerid));
			var xSpd = buffer_read(buff, buffer_f32);
			var ySpd = buffer_read(buff, buffer_f32);
			var vehicle = vehicle_map[? vehicleid];
			if (vehicle != undefined && instance_exists(vehicle)) 
			{ 
				vehicle.xSpd = xSpd;
				vehicle.ySpd = ySpd;
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
				player.active = vis;
				player.visible = vis; 
				player.x = x_coord;
				player.y = y_coord;
				player.xSpd = xSpd;
				player.ySpd = ySpd;
			}
		}
		size = buffer_read(buff, buffer_u8);
		show_debug_message("MOBS : " + string(size));
		for (var i = 0; i < size; i++)
		{
			var type = buffer_read(buff, buffer_u8);
			var mobid = buffer_read(buff, buffer_gameid);
			var hp = buffer_read(buff, buffer_u8);
			var x_coord = buffer_read(buff, buffer_u16);
			var y_coord = buffer_read(buff, buffer_u16);
			show_debug_message("x : " + string(x_coord) + " y: " + string(y_coord));
			var inst = mob_create(type, mobid, x_coord, y_coord);
			inst.mob_hp = hp;
			
		}
		
		size = buffer_read(buff, buffer_u8); 
		for (var i = 0; i < size; i++)
		{
			var vehicleid = buffer_read(buff, buffer_gameid);
			
			show_debug_message("msg_client_user (97): vehicleid: " + string(vehicleid));
			var px = buffer_read(buff, buffer_u32);
			var py = buffer_read(buff, buffer_u32);
			var inst = instance_create_depth(px, py, 0, obj_car);
			inst.vehicleid = vehicleid;
			ds_list_add(vehicle_list, inst);
			vehicle_map[? vehicleid] = inst; 
			
		}
		
		
	break;
	
	case CmdPlayerUpdate.Position:
		var size = buffer_read(buff, buffer_u8);
		for (var i = 0; i < size; i++)
		{
			var playerid = buffer_read(buff, buffer_gameid);
			var x_coord = buffer_read(buff, buffer_u16);
			var y_coord = buffer_read(buff, buffer_u16);
			if (playerid == obj_player.playerid) {
				obj_player.x = x_coord;
				obj_player.y = y_coord;
			}
			else
			{
				var p = player_map[? playerid];
				p.x = x_coord;
				p.y = y_coord;
			}
		}
		
		//var size = buffer_read(buff, buffer_u8);
		//for (var i = 0; i < size; i++)
		//{
		//	var vehicleid = buffer_read(buff, buffer_gameid);
		//	var x_coord = buffer_read(buff, buffer_u16);
		//	var y_coord = buffer_read(buff, buffer_u16);
		//	var angle = buffer_read(buff, buffer_u16);
			  
		//	var v = vehicle_map[? vehicleid];
		//	v.x = x_coord;
		//	v.y = y_coord; 
		//	v.direction = angle; 
		//}
	break;
	
	case CmdPlayerUpdate.Fire:
		var playerid = buffer_read(buff, buffer_gameid);
		var fire_dir = buffer_read(buff, buffer_u16);
		var type = buffer_read(buff, buffer_u8);		// Not used
		
		var player = player_map[? playerid];
		var b = instance_create_layer(player.x, player.y, "Instances", obj_bull);	
		b.direction = fire_dir;
	break;
	
	case CmdPlayerUpdate.TakeVehicle:
		var playerid = buffer_read(buff, buffer_gameid);
		var vehicleid = buffer_read(buff, buffer_gameid); 
		
		var vehicle = vehicle_map[? vehicleid];
		
		if(obj_player.playerid == playerid)
		{
			show_debug_message("entering vehicle " + string(vehicleid) + string(object_get_name(vehicle.object_index)));
			//enter vehicle	  
			vehicle.active = true;
			obj_player.active = false;
			obj_player.target = vehicle;
		}
		else
		{
			show_debug_message("other player entering vehicle");
			var player = player_map[? playerid]; 
			player.visible = false; 
		}
		
	break;
	
	case CmdPlayerUpdate.LeftVehicle:
		var playerid = buffer_read(buff, buffer_gameid); 
		var vehicleid = buffer_read(buff, buffer_gameid); 
		
		var vehicle = vehicle_map[? vehicleid]; 
		
		if(obj_player.playerid == playerid)
		{
			show_debug_message("leaving vehicle " + string(vehicleid)) ;
			//exit vehicle	
			obj_player.active = true;
			obj_player.target = noone; 
			vehicle.active = false;
		}
		else
		{
			show_debug_message("other player leaving vehicle");
			var player = player_map[? playerid];   
			player.visible = true; 
		}
		
	break;
	
	default:
		show_message("msg_client_user received cmd: " + string(cmd));
	break;
}
