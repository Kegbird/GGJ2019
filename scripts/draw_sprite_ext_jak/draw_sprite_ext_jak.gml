///@author		Giacomo Marton
///@version		1.0.0


///@description				Disegna lo sprite alla jak

mtx = mat4_set_translation( 0, 0, -depth);
//var mtx = mat4_identity();
//mtx = mat4_translate(mtx, 0, 0, -depth);
mtx = mat4_scale(mtx, image_xscale, image_yscale, 1);
mtx = mat4_rotate_z(mtx, image_angle);
mtx = mat4_rotate_z(mtx, 45);
mtx = mat4_rotate_axis(mtx, dsin(45), -dsin(45), 0, -80);

mtx = mat4_translate(mtx, argument[2], argument[3], argument[9]);

matrix_set(matrix_world, mtx);
draw_sprite_ext(argument[0], argument[1], 0, 0, argument[4], argument[5], argument[6], argument[7], argument[8]);
matrix_set(matrix_world, mat4_identity());