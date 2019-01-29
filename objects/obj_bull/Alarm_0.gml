if (scale > 0) 
{
	scale -= 0.025;
	image_xscale = scale;
	image_yscale = scale;
	alarm[0] = 1;
} 
else {
	instance_destroy();	
}