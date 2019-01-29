var dtc = 1000000;

if (stage != 5) {
	if (instance_exists(request)) {
		if (point_distance(x, y, request.x, request.y) > 100) {
			stage = 5;	
		}
	}
	else {
		stage = 5; 
	}
}

if (stage == 0)
{
	// divide il testo in righe (cerca di fare righe di lungh. simile)
	draw_set_font(font);
	var len = string_length(testo), w = string_width(testo);
	
	if (w > boxw)
	{
		doppio = true;
		var line = "", line2 = false;
		for (var i=1; i<string_length(testo); i++) {
			var c = string_char_at(testo, i);
			if (c == " " && !line2) {
				if (string_width(line) > (boxw - 20)) {
					line2 = true;
					line += "\n";
				}
				else {
					line += c;	
				}
			}
			else {
				line += c;	
			}
		}
		testo = line;
	}
	
	//event_perform(ev_other, ev_user0);
	
	stage = 4;
}
else if (stage == 4) {
	if (a < 1) {
		a += delta_time * fade_in_velocity / dtc;
	}
	else {
		stage = 1;
		alarm[0] = delay_text;
	}
}
else if (stage == 5) {
	a -= delta_time * fade_out_velocity / dtc;
	if (a <= 0) {
		instance_destroy();	
	}
}



//update_depth_jak();
depth = -1;