if (tempo_scorrimento == 1)
{
	global.world_angle = world_angle_set;
	world_angle_act = world_angle_set;
}
else
{
	global.world_angle = ease_expo_out(world_angle_act, world_angle_set, tempo_scorrimento);
}
tempo_scorrimento += 1/240;

//global.world_angle = world_angle_set;


//var mtx_view = matrix_build_lookat(obj_player.x + 200, obj_player.y + 200, - sqrt(200*200 + 200*200), obj_player.x, obj_player.y, 0, 0, 0, 1);
var mtx_view = matrix_build_lookat(global.cam_distance * dsin(global.world_angle), global.cam_distance * dsin(global.world_angle), 0, 0, 0, 0, 0, 0, 1);
mtx_view = mat4_rotate_x(mtx_view, -90+global.world_angle);
//mtx_view = matrix_multiply(mat4_set_translation(-obj_player.x, -obj_player.y, 300), mtx_view);
mtx_view = matrix_multiply(mat4_set_translation(-obj_player.x, -obj_player.y, sqrt(global.cam_distance*global.cam_distance*2) * dcos(global.world_angle)), mtx_view);

var mtx_proj = mat4_perspective(degtorad(30), 1024/756, 0.1, 4000)

camera_set_view_mat(view_camera[0], mtx_view);
camera_set_proj_mat(view_camera[0], mtx_proj);





//puntatore mouse
var mtx_cam = matrix_multiply(mat4_inverse(mtx_view), mat4_inverse(mtx_proj));
//var mtx_cam = matrix_multiply(mtx_proj, mtx_view);
//mtx_cam = mat4_rotate_z(mtx_cam, 90);
//mtx_cam = mat4_inverse(mtx_cam);

var vect_ray = vec4_set(window_mouse_get_x()-500, window_mouse_get_y()-400, -1, 1);
mtx_cam = matrix_multiply(mat4_set_translation(0, 0, 1), mtx_cam);
var vect_ray_transf = vec4_transform(vect_ray, mtx_cam);
//var vect_ray_transf = matrix_transform_vertex(mtx_cam, window_mouse_get_x(), window_mouse_get_y(), 0);
obj_puntatore.x = vect_ray_transf[0];
obj_puntatore.y = vect_ray_transf[1];
obj_puntatore.z = vect_ray_transf[2];
//x = window_mouse_get_x();
//y = window_mouse_get_y();


