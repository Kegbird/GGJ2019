/// @function net_client_send ()
/// @description sends the buffer to the server

network_send_packet(obj_client.client, sendbuffer, buffer_tell(sendbuffer));
