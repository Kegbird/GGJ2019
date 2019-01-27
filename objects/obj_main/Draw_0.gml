///DRAW

if (state == 0)
{
	//logo
	draw_sprite(spr_menu_logo, 0, camera_get_view_width(cam) * 0.5, camera_get_view_height(cam) * 0.5 - 64);

	//button
	draw_sprite(spr_menu_button, 0, camera_get_view_width(cam) * 0.5, camera_get_view_height(cam) - 64);
}
else if (state == 1)
{
	draw_set_font(font0);
	/*var txt_w = string_width(txt_temp);
	var txt_len = string_length(txt_temp);
	
	for (var i=0; i < txt_len; i++)
	{
		var txt_temp = string_replace(keyboard_string, keyboard_string, string_copy(keyboard_string, 1, 1 + i));
		txt_w = string_width(txt_temp);
		txt_len = string_length(txt_temp);
		
		if (txt_len > text_max_len * 0.5)
		{
			
		}
	}
	*/
	draw_text(64, 128, "What is your name?");
	draw_text(64, 196, keyboard_string + cursor);
}
else if (state == 2)
{
	draw_set_font(font0);
	draw_text(64, 128, "What does \"home\" mean to you?");
	draw_text(64, 196, keyboard_string + cursor);
}

