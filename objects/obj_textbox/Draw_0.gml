if (focused && keyboard_lastkey != -1)
{
	var len = string_length(text);
	if(keyboard_lastkey == vk_backspace)
		text = string_delete(text, len, 1);
	else if (len < limit) 
		text += keyboard_lastchar;
	keyboard_lastkey = -1;
}


draw_set_color(c_black);
draw_rectangle(x, y, x + width, y + height, 0);

if(mouse_inside(x, y, x + width, y + height))
{
	draw_set_color(c_white);
	if(mouse_check_button_pressed(mb_left))
	{
		with(obj_textbox)
			focused = false;
		focused = true;
	}
}
else 
{
	if(mouse_check_button_pressed(mb_left)) 
		focused = false; 
	
	if(focused) 
		draw_set_color(c_white);
	else
		draw_set_color(c_gray);
}
draw_rectangle(x+1, y+1, x + width-1, y + height-1, 0);
 
draw_set_color(c_black);
draw_text(x + padding, y, text);