/// @description Insert description here
// You can write your code in this editor

if (scale > 0) {
	scale -= .025;
	image_xscale = scale;
	image_yscale = scale;
	alarm[0] = 1;
} 
else {
	instance_destroy();	
}