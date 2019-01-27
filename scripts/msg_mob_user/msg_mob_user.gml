var buff = async_load[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdMob.Spawn:
		var type = buffer_read(buff, buffer_u8);
		var mobid = buffer_read(buff, buffer_u16);
		var px = buffer_read(buff, buffer_u16);
		var py = buffer_read(buff, buffer_u16);
		mob_create(type, mobid, px, py);
	break;
	
	case CmdMob.Destroy:
		var mobid = buffer_read(buff, buffer_u16);
		ds_list_delete(mob_list, ds_list_find_index(mob_list, mob_map[? mobid]));
		instance_destroy(mob_map[? mobid]);
	break;
	
	default:
		show_message("msg_mob_user received cmd: " + string(cmd));
	break;
}
