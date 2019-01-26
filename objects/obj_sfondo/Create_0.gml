depth = 1;
global.world_angle = 50;
global.cam_distance = 200;

world_angle_set = global.world_angle;
world_angle_act = world_angle_set;
tempo_scorrimento = 1;



vertex_format_begin(); 
	vertex_format_add_position_3d(); 
	vertex_format_add_normal(); 
	vertex_format_add_colour();
	vertex_format_add_textcoord(); 
global.d3dPrimVF=vertex_format_end();

general_load_all_3D_models();

