var P = instance_nearest(x, y, obj_player_parent);

switch state {
    case "walk": {
        if (aggro) {
            if (distance_to_object(P) < pDist) {
                time = 30;
                if (timer < time) {
                    move_towards_point(P.x,P.y,spd);
                    timer ++;
                } 
				else {
                    timer = 0;
                    speed = 0;
                    state = "stop";
                }
            }
        } 
		else {
			move_towards_point(obj_home.x, obj_home.y,spd/2);
		}
		break;
	}

    case "stop": {
        time = 20;

        if (timer < time)
            timer ++;
        else {
            timer = 0;
            state = "fire";
        }
		break;
	}

    case "fire": {
        time = 20;

        if (timer < time)
            timer ++;
        else {
            if (ftimes < ftimes_max) {
                direction = point_direction(x,y,P.x,P.y);
                _bull = instance_create_layer(x,y,"Instances",obj_mob_bull);
                _bull.direction = direction;
                timer = 0;
                ftimes ++;
                state = "fire";
            } else {
                ftimes = 0;
                timer = 0;
                time = irandom_range(60,180);
                state = "walk";
            }
        }
		break;
	}
}

if (aggro) {
    if (agg_timer < agg_time)
        agg_timer ++;
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