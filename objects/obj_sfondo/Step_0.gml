if(!instance_exists(obj_player))
	exit;

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
cam_x = lerp(cam_x, -obj_player.x, 0.1);
cam_y = lerp(cam_y, -obj_player.y, 0.1);
mtx_view = matrix_multiply(mat4_set_translation(cam_x, cam_y, sqrt(global.cam_distance*global.cam_distance*2) * dcos(global.world_angle)), mtx_view);

var mtx_proj = mat4_perspective(degtorad(30), window_get_width()/window_get_height(), 0.1, 4000)

camera_set_view_mat(view_camera[0], mtx_view);
camera_set_proj_mat(view_camera[0], mtx_proj);



 
