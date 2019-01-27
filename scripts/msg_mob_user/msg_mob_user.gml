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
		var mobid = buffer_read(buff, buffer_gameid);
		ds_list_delete(mob_list, ds_list_find_index(mob_list, mob_map[? mobid]));
		instance_destroy(mob_map[? mobid]);
	break;
	
	case CmdMob.Update:
		var size = buffer_read(buff, buffer_u8);
		for (var i = 0; i < size; i++)
		{
			//id, x, y
			var mobid = buffer_read(buff, buffer_gameid);
			var mob = mob_map[? mobid];
			if (mob != undefined)
			{
				mob.x = buffer_read(buff, buffer_u16);
				mob.y = buffer_read(buff, buffer_u16);
			}
		}
	break;
	
	default:
		show_message("msg_mob_user received cmd: " + string(cmd));
	break;
}
