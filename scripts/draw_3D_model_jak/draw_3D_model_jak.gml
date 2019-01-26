///@author		Giacomo Marton
///@version		1.0.0


///@description						Disegna un modello importato da jak
///@param	{Model} modello			Il modello da disegnare
///@param	{Texture} texture		La texture del modello

gpu_set_cullmode(cull_clockwise);
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
//var mtx = mat4_set_translation( 0, 0, -depth);
var mtx = mat4_set_translation( 0, 0, 0);
mtx = mat4_scale(mtx, -image_xscale, -image_xscale, -image_xscale);
mtx = mat4_rotate_x(mtx, -90);
mtx = mat4_rotate_z(mtx, image_angle);
mtx = mat4_translate(mtx, x, y, 0);
matrix_set(matrix_world, mtx);

vertex_submit(argument0, pr_trianglelist, argument1);

matrix_set(matrix_world, mat4_identity());
gpu_set_cullmode(cull_noculling);
//gpu_set_zwriteenable(false);
//gpu_set_ztestenable(false);