 
 
var sock = async_load[? "socket"];

if(ds_list_size(player_list) < max_players)
{
	show_debug_message("added " + string(sock) + " | id " + string(async_load[? "id"]));
	ds_list_add(socket_list, sock);
	
	var point = calculate_spawnpoint();
	var player = instance_create_depth(point[0], point[1], 0, obj_player);
	player.playerid = players_game_id++;
	player.sid = sock;
	ds_list_add(player_list, player);
	player_map[? player.playerid] = player;
	
	write_begin(Cmd.Accepted);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	buffer_write(sendbuffer, buffer_u32, floor(point[0]));
	buffer_write(sendbuffer, buffer_u32, floor(point[1]));
	net_host_send(sock);
	
	write_begin(Cmd.Joined);
	buffer_write(sendbuffer, buffer_gameid, player.playerid);
	net_host_send_all_except(sock);
	
	// Sync new user
	write_begin(Cmd.PlayerUpdate);
	buffer_write(sendbuffer, buffer_cmd, CmdPlayerUpdate.Sync);
	var size = ds_list_size(player_list);
	// Add all players coordinates
	buffer_write(sendbuffer, buffer_u8, size);
	for (var i = 0; i < size; i++) {
		buffer_write(sendbuffer, buffer_gameid, player_list[| i].playerid);
		buffer_write(sendbuffer, buffer_u8, player_list[| i].active);
		buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].x));
		buffer_write(sendbuffer, buffer_u16, floor(player_list[| i].y));
		buffer_write(sendbuffer, buffer_f32, player_list[| i].old_xspd);
		buffer_write(sendbuffer, buffer_f32, player_list[| i].old_yspd);
	}
	// Add all mobs coordinates
	size = ds_list_size(mob_list);
	buffer_write(sendbuffer, buffer_u8, size);
	for (var i = 0; i < size; i++) {
		buffer_write(sendbuffer, buffer_u8, mob_list[| i].type);
		buffer_write(sendbuffer, buffer_gameid, mob_list[| i].mobid);
		buffer_write(sendbuffer, buffer_u8, mob_list[| i].mob_hp);
		buffer_write(sendbuffer, buffer_u16, floor(mob_list[| i].x));
		buffer_write(sendbuffer, buffer_u16, floor(mob_list[| i].y));
	}
	
	// Add all vehicles coordinates
	size = ds_list_size(vehicle_list);
	buffer_write(sendbuffer, buffer_u8, size);
	for (var i = 0; i < size; i++) { 
		buffer_write(sendbuffer, buffer_gameid, vehicle_list[| i].vehicleid); 
		buffer_write(sendbuffer, buffer_u32, floor(vehicle_list[| i].x));
		buffer_write(sendbuffer, buffer_u32, floor(vehicle_list[| i].y));
	}
	
	
	net_host_send(sock);
	 
	
}
else
{
	write_begin(Cmd.Rejected);
	net_host_send(sock);
}