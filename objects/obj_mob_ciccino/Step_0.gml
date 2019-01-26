/// @description Insert description here
// You can write your code in this editor
//image_angle = direction;

switch state {
	case "walk":
		move_towards_point(obj_home.x,obj_home.y,spd);
	break;

}


if (image_index >= image_number-1) {
	if (mob_hp < 1) {
		killed = true;
		instance_destroy();
	}
	image_speed = 0;
	image_index = 0;	
}
