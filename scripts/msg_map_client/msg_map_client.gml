var buff = async_load[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdMap.SpawnVehicle:
		var vehicleid = buffer_read(buff, buffer_gameid);
		show_debug_message("msg_map_client: vehicleid: " + vehicleid);
		var px = buffer_read(buff, buffer_u32);
		var py = buffer_read(buff, buffer_u32);
		var inst = instance_create_depth(px, py, 0, obj_car);
		inst.vehicleid = vehicleid;
		ds_list_add(vehicle_list, inst);
		vehicle_map[? vehicleid] = inst; 
	break;
	
	default:
		show_message("msg_client_user received cmd: " + string(cmd));
	break;
}
