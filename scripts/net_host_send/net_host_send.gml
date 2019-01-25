/// @function net_host_send (sockid)
/// @description sends the buffer to a precise client
/// @param {real} sock_id sock id of the receiver

with(obj_host)
{
	network_send_packet(argument0, sendbuffer, buffer_tell(sendbuffer));
}