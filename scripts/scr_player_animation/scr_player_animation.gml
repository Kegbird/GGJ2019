// args:  speed

var spd = argument0;

sprite_index = spr_player;
if (mouse_x > x) image_xscale = -1; else image_xscale = 1;

if (abs(spd) > 0) {
	image_speed = 1;
	//image_xscale = (dir > 90 && dir < 271 ? -1 : 1);
}
else {
	image_speed = 0;	
}