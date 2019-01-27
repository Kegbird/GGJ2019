

spd = point_distance(x, y, x + xSpd, y + ySpd);
dir = point_direction(x, y, x + xSpd, y + ySpd);
	
sprite_index = spr_player;
if (abs(spd) < 0.1) {
	image_index = 0;
	image_speed = 0;
}
else {
	image_speed = 1;
	image_xscale = (dir > 90 && dir < 271 ? 1 : -1);
}

x += xSpd;
y += ySpd;

update_depth_jak();