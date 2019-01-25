/// @function net_host_send_all ()
/// @description sends the buffer to everyone
with(obj_host)
{
	var sz = ds_list_size(socket_list);
	var bl = buffer_tell(sendbuffer);
	for (var i = 0; i < sz; i++;) 
		network_send_packet(socket_list[| i], sendbuffer, bl); 
}