///@author		Giacomo Marton
///@version		1.0.0


///@description				Disegna lo sprite alla jak

mtx = mat4_set_translation( 0, 0, -depth);
mtx = mat4_scale(mtx, argument3, argument3, 1);
mtx = mat4_rotate_z(mtx, image_angle);
mtx = mat4_rotate_z(mtx, 45);
mtx = mat4_rotate_axis(mtx, dsin(45), -dsin(45), 0, -80);


mtx = mat4_translate(mtx, argument0, argument1, argument4);

matrix_set(matrix_world, mtx);
gpu_set_alphatestenable(false);
draw_set_halign(fa_center);
draw_text(0, 0, argument2);
gpu_set_alphatestenable(true);
matrix_set(matrix_world, mat4_identity());