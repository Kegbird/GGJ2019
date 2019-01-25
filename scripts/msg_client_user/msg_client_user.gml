var buff = async_load[? "buffer"]; 
var cmd = buffer_read(buff, buffer_cmd);
switch (cmd)
{
	case CmdUser.Name: 
		var playerid = buffer_read(buff, buffer_gameid);
		var car = find_car(playerid);
		if(instance_exists(car)) 
			car.username = buffer_read(buff, buffer_string);	 
		else
			show_message("client: can't find car");
	break;
	
	default:
		show_message("received cmd: " + string(cmd));
	break;
}
