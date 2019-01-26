
switch state {
	case "walk": {
		var home = scr_get_home();
		if (instance_exists(home)) {
			move_towards_point(home.x, home.y, spd);
		}
		break;
	}
}


if (image_index >= image_number-1) {
	if (mob_hp < 1) {
		killed = true;
		instance_destroy();
	}
	image_speed = 0;
	image_index = 0;	
}
