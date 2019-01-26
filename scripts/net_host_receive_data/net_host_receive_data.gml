var map = argument0;
var user_idx = argument1;

var buff = async_load[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{ 
	case Cmd.PlayerRequest:
		show_debug_message("cmd user");
		msg_host_player();
	break;
	 
	default:
		show_message("host received cmd: " + string(cmd));
	break;
}

