alarm[0] = room_speed * random_range(5, 10);

var index = irandom(array_length_1d(mobtype) - 1);
var inst = instance_create_depth(x, y, 0, mobtype[index]);
inst.mobid = mob_next_id++;

ds_list_add(mob_list, inst);
mob_map[? inst.mobid] = inst;

write_begin(Cmd.Mob);
buffer_write(sendbuffer, buffer_cmd, CmdMob.Spawn);
buffer_write(sendbuffer, buffer_u8, index);
buffer_write(sendbuffer, buffer_u16, inst.mobid);
buffer_write(sendbuffer, buffer_u16, floor(x));
buffer_write(sendbuffer, buffer_u16, floor(y));
net_host_send_all();
