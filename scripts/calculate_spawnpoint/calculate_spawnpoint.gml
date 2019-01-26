var pos;

if(instance_exists(obj_home))
{
	pos[0] = obj_home.x;
	pos[1] = obj_home.y; 
	show_debug_message("HOUSE EXISTS, SPAWNING");
}
else
{
	show_debug_message("HOUSE DOES NOT EXISTS, SPAWNING 100,100");
	pos[0] = 100;
	pos[1] = 100; 
}

return pos;