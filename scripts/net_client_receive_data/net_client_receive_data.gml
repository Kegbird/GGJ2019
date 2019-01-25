 
var map = argument0;

var buff = map[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case Cmd.Accepted:
		net_client_accepted(buff);
	break;
	
	case Cmd.Rejected:
		net_client_rejected(buff);
	break;
	
	case Cmd.Joined:
		net_client_user_joined(buff);
	break;
	
	case Cmd.Left:
		net_client_user_left(buff);
	break;
	
	case Cmd.User:
		msg_client_user();
	break;
	 
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}

