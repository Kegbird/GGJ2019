if(button_pressed(spr_button, 10, 10, 1, 1, "client"))
{
	instance_create_depth(0, 0, 0, obj_client); 
}

if(button_pressed(spr_button, 10, 50, 1, 1, "host"))
{	
	instance_create_depth(0, 0, 0, obj_host); 
}