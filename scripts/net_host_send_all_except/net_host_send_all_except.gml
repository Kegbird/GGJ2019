/// @function net_host_send_except(sockid)
/// @description sends the buffer to everyone
/// @param {real} excluded sock id of the excluded receiver

with(obj_host)
{
	var sz = ds_list_size(socket_list);
	var bl = buffer_tell(sendbuffer);
	
	for (var i = 0; i < sz; i++;)
	{
		var sock = socket_list[| i];
		if(sock != argument0)
			network_send_packet(sock, sendbuffer, bl);
	}
}