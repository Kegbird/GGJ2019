 
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
	
	case Cmd.PlayerUpdate:
		msg_client_user();
	break;
	
	case Cmd.Mob:
		msg_mob_user();
	break;
	case Cmd.Map:
		msg_map_client();
	break;
	
	default:
		show_message("client received cmd: " + string(cmd));
	break;
}

