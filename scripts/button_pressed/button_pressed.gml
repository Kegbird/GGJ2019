/// @function button_pressed(spr,x,y,xscale,yscale, text)
/// @description draw button and check 
/// @param {real} sprite
/// @param {real} x
/// @param {real} y
/// @param {real} xscale
/// @param {real} yscale
/// @param {real} text
 
var s = argument0;
var px = argument1;
var py = argument2;
var xscale = argument3;
var yscale = argument4;
var text = argument5;
var sw = sprite_get_width(s) * xscale;
var sh = sprite_get_height(s) * yscale;
draw_set_color(c_black);
var ret = false;
if(mouse_x > min(px, px + sw) && mouse_y > min(py, py + sh)
	&& mouse_x < max(px, px + sw) && mouse_y < max(py, py + sh))
{
	draw_sprite_ext(s, 1, px, py, xscale, yscale, 0, -1, 1); 
    ret = mouse_check_button_pressed(mb_left);
}
else
	draw_sprite_ext(s, 0, px, py, xscale, yscale, 0, -1, 1);
	
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_text_transformed(px + sw / 2, py + sh / 2, text, xscale, yscale, 0);
draw_set_valign(fa_left);
draw_set_halign(fa_top);

return ret;
