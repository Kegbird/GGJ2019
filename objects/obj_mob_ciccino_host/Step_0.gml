switch state {
	case "walk": {
		var home = scr_get_home();
		if (instance_exists(home)) {
			//move_towards_point(home.x, home.y, spd);
			mp_potential_step_object(home.x, home.y, spd, obj_solid);
			image_xscale = (x < home.x ? -1 : 1);
		}
		break;
	}
}

var c = collision_circle(x, y, 8, obj_wall_home, 1, 1);
if (c) {
	instance_destroy();	
}