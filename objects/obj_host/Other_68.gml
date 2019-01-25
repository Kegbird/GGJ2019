
var type = async_load[? "type"];
var n_id = async_load[? "id"];

if (n_id == server)
{ 
 
	if(type == network_type_connect)
	{
		net_host_user_joined();	
	}
	else if (type == network_type_disconnect)
	{
		net_host_user_left();
	}
	else
	{
		show_message(string(type) + ": network connect error 1"); 
	}
}
else
{
	var user_idx = ds_list_find_index(socket_list, n_id);
	if(user_idx > -1)
		net_host_receive_data(async_load, user_idx); 
	else 
		show_message(string(n_id) + ": network connect error 2");  		
}