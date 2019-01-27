write_begin(Cmd.Mob);
buffer_write(sendbuffer, buffer_cmd, CmdMob.Destroy);
buffer_write(sendbuffer, buffer_gameid, mobid);
net_host_send_all();

instance_create_layer(x,y,"Instances", obj_explosion);

if (killed) {
	m = instance_create_layer(x, y-4, "Instances", obj_mob_dead);
	m.sprite_index = sprite_index;
}