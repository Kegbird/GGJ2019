// center

var xx, yy, h = argument0, i = 15, k = 0, s = 1;
xx = h.x;
yy = h.y;

while (instance_place(xx, yy, obj_player_other)) {
	var r = irandom(359);
	xx = h.x + lengthdir_x(r, i * s);
	yy = h.y + lengthdir_y(r, i * s);
	
	k++;
	if (k > 8) s++;
	if (s > 4) {
		xx = h.x;
		yy = h.y;
		break;
	}
}

return [xx, yy];