var P = scr_get_player();

if (!instance_exists(P)) {
	sprite_index = anim_idle;
	exit;
}

switch state {
    case "walk": {
        if (aggro) {
            if (distance_to_object(P) < pDist) {
                time = 30;
                if (timer < time) {
                    //move_towards_point(P.x,P.y,spd);
					mp_potential_step_object(P.x, P.y, spd, obj_solid);
					sprite_index = anim_walk;
                    timer ++;
                } 
				else {
                    timer = 0;
                    speed = 0;
					sprite_index = anim_idle;
                    state = "stop";
                }
            }
        } 
		else {
			//move_towards_point(obj_home.x, obj_home.y,spd/2);
			var home = scr_get_home();
			if (instance_exists(home)) {
				mp_potential_step_object(home.x, home.y, spd * 0.5, obj_solid);
				sprite_index = anim_walk;
			}
		}
		break;
	}

    case "stop": {
        time = 20;
		sprite_index = anim_idle;

        if (timer < time) {
            timer ++;
		}
        else {
            timer = 0;
            state = "fire";
        }
		break;
	}

    case "fire": {
        time = 20;

        if (timer < time) {
            timer ++;
		}
        else {
            if (ftimes < ftimes_max) {
                direction = point_direction(x, y, P.x, P.y);
                var b = instance_create_layer(x, y, "Instances", bullet);
                b.direction = direction;
                timer = 0;
                ftimes ++;
                state = "fire";
            } 
			else {
                ftimes = 0;
                timer = 0;
                time = irandom_range(60, 180);
                state = "walk";
            }
        }
		break;
	}
}

if (aggro) {
    if (agg_timer < agg_time) {
        agg_timer ++;
	}
    else {
        agg_timer = 0;
        aggro = false;
    }
}

if (image_index >= image_number-1) {
    if (mob_hp < 1) instance_destroy();
    image_speed = 0;
    image_index = 0;
}