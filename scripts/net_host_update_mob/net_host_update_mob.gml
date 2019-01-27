write_begin(Cmd.Mob);
buffer_write(sendbuffer, buffer_cmd, CmdMob.Update);
var size = ds_list_size(mob_list);
buffer_write(sendbuffer, buffer_u8, ds_list_size(mob_list));
for (var i = 0; i < size; i++)
{
	var mob = mob_list[| i];
	buffer_write(sendbuffer, buffer_gameid, mob.mobid);
	buffer_write(sendbuffer, buffer_u16, mob.x);
	buffer_write(sendbuffer, buffer_u16, mob.y);
}
net_host_send_all();
