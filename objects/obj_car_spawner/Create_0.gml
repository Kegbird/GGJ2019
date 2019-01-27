if (!instance_exists(obj_host))
	instance_destroy();

var inst = instance_create_depth(x,y,0, obj_car);
 
inst.vehicleid = vehicle_next_id++;
