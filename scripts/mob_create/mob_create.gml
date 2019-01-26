var type = argument0;
var mobid = argument1;
var px = argument2;
var py = argument3;

show_debug_message("PPP");
var inst = instance_create_layer(px, py, "Instances", obj_mob_client);
inst.mobid = mobid;
inst.type = type;

ds_list_add(mob_list, inst);
mob_map[? mobid] = inst;

return inst;