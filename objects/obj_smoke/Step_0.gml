image_angle += rot_speed;
image_xscale = (1.2 + sin(t) * 0.5) * start_scale;
image_yscale = image_xscale;
t += 0.1;
if(image_index >= image_number - 1)
	instance_destroy();