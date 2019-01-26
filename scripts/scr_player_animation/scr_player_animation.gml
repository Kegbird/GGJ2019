// args:  speed, spr

var spd = argument[0];

if (argument_count == 1) {
	sprite_index = spr_player;
}
else {
	sprite_index = argument[1];
}


if (mouse_x > x) image_xscale = -1; else image_xscale = 1;

if (abs(spd) > 0) {
	image_speed = 1;
	//image_xscale = (dir > 90 && dir < 271 ? -1 : 1);
}
else {
	image_speed = 0;	
}