matrix_set(matrix_world, mat4_set_translation(0, 0, 0.02));

gpu_set_texrepeat(true);
gpu_set_tex_filter(false);
gpu_set_alphatestenable(true);

/*gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);

draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_background,0));
draw_vertex_texture(-8000,-8000,0,0);
draw_vertex_texture(8000,-8000,250,0);
draw_vertex_texture(-8000,8000,0,250);
draw_vertex_texture(8000,8000,250,250);
draw_primitive_end();*/

gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);