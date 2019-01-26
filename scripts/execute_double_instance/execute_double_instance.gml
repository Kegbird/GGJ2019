
if (parameter_count() == 3) 
{
	var s = 100;
	for (var i=0; i<1; i++) {
	    shell_execute(parameter_string(0),
	        parameter_string(1) + " " +
	        parameter_string(2) + " " +
	        parameter_string(3) + " -server");
			window_set_position(s - s*0.5 + i*s, window_get_y());
	}
		
}
else if (parameter_count() == 4) 
{ 
    window_set_caption("server");
    window_set_position(display_get_width() - window_get_width(), window_get_y());
}