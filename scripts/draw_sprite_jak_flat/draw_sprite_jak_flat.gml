///@author		Giacomo Marton
///@version		1.0.0


///@description				Disegna lo sprite alla jak

mtx = mat4_set_translation( 0, 0, -0.1);
//var mtx = mat4_identity();
//mtx = mat4_translate(mtx, 0, 0, -depth);
mtx = mat4_scale(mtx, image_xscale, image_yscale, 1);
mtx = mat4_rotate_z(mtx, image_angle);
mtx = mat4_rotate_z(mtx, 45);
mtx = mat4_rotate_axis(mtx, dsin(45), -dsin(45), 0, 10);

if (argument_count == 0)
mtx = mat4_translate(mtx, x, y, 0);
else
mtx = mat4_translate(mtx, x, y, argument[0]);

matrix_set(matrix_world, mtx);
draw_sprite(sprite_index, image_index, 0, 0);
matrix_set(matrix_world, mat4_identity());