//CLICK

//join
if (state == 0)
{
	cam = view_get_camera(0);
	var mx = mouse_x;
	var my = mouse_y;
	var bx = camera_get_view_width(cam) * 0.5;
	var by = camera_get_view_height(cam) - 64;
	var bw = sprite_get_width(spr_menu_button);
	var bh = sprite_get_height(spr_menu_button);
	var over =	mx >= bx - bw * 0.5 &&
				mx < bx + bw * 0.5 &&
				my >= by - bh * 0.5 &&
				my < by + bh * 0.5;
	//over = true;
	if (mouse_check_button_released(mb_left) && over)
	{
		//joina
		state = 1;
	}

	//top secret host
	if (keyboard_check_released(ord("H")) || window_get_caption() == "server")
	{
		global.server = true;
		instance_create_depth(0, 0, 0, obj_host); 
	}
}
else if (state == 1)
{
	//input text
	string_replace(keyboard_string, keyboard_string, string_copy(keyboard_string, 1, text_max_len));
	
	//confirm
	if (keyboard_check_pressed(vk_enter))
	{
		global.username = keyboard_string;
		keyboard_string = "";
		state = 2;
	}
}
else if (state == 2)
{
	//input text
	string_replace(keyboard_string, keyboard_string, string_copy(keyboard_string, 1, text_max_len));
	
	//confirm
	if (keyboard_check_pressed(vk_enter))
	{
		global.meaning = keyboard_string;
		keyboard_string = "";
		instance_create_depth(0, 0, 0, obj_client);
	}
}
