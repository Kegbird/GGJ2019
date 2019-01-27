if (!instance_exists(obj_host))
{
	instance_destroy();
	exit;
}

var inst = instance_create_depth(x,y,0, obj_car);
inst.vehicleid = vehicle_next_id++;
ds_list_add(vehicle_list, inst);
vehicle_map[? inst.vehicleid] = inst;
