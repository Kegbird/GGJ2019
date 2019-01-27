if (stage == 0) exit;
if (!instance_exists(target)) target = self.id;
var hh = -28;

var vw = window_get_width();
var vh = window_get_height();

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(64, vh - 128, vw - 64, vh, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(font0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(vw * 0.5, vh - 64, testo);

/*if (surface_exists(surf)) {
	//draw_surface(surf, target.x, target.y);
	draw_surface(surf, 0, 0);
}
else {
	var len = 0, middle = 17 * scale;
	var rep = string_width(testo) / middle;
	for (var i=0; i<rep; i++) {
		len += middle;
	}
	len += 20;
	surf = surface_create(len, 32);
	
	surface_set_target(surf);
	var tx = 13, ty = 27;
	
	draw_sprite_ext(ui_messagebox, 0, tx, ty, scale, scale, 0, c_white, a);
	var rep = string_width(testo) / middle, tail = 0;


	for (var i=0; i<rep; i++) {
		draw_sprite_ext(ui_messagebox, 1, tx + (middle * i * (1/sqrt(2))), ty - (middle * i), scale, scale, 0, c_white, a);
		if (i < rep-1) tail += middle;
	}

	draw_sprite_ext(ui_messagebox, 2, tx + tail, ty - tail, scale, scale, 0, c_white, a);

	draw_set_font(font);
	draw_set_color(c_black);

	draw_text(tx + 6, ty - string_height(testo) - (!doppio ? 12 : 4), show);

	surface_reset_target();
}




exit;
draw_sprite_ext_jak(ui_messagebox, 0, target.x, target.y, scale, scale, 0, c_white, a, hh);

var middle = 17 * scale;
var rep = string_width(testo) / middle, tail = 0;

for (var i=0; i<rep; i++) {
	draw_sprite_ext_jak(ui_messagebox, 1, target.x + (middle * i * (1/sqrt(2))), target.y - (middle * i), scale, scale, 0, c_white, a, hh);
	if (i < rep-1) tail += middle;
}

draw_sprite_ext_jak(ui_messagebox, 2, target.x + tail, target.y - tail, scale, scale, 0, c_white, a, hh);


draw_set_font(font);
draw_set_color(c_black);

draw_text_jak(target.x + 6, target.y - string_height(testo) - (!doppio ? 12 : 4), show, 0.4, -24);
*/

