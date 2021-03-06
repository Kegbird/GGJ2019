var mtx = mat4_set_translation( (window_mouse_get_x() - window_get_width()/2), (window_mouse_get_y() - window_get_height()/2) + (window_mouse_get_y()/window_get_height() - 0.5)*300, 0);
mtx = mat4_rotate_z(mtx, 45);
mtx = mat4_translate(mtx, obj_player.x, obj_player.y, 0);

var pos = vec4_set(0,0,0,1);
pos = vec4_transform(pos, mtx);

var factor = 1 - (window_mouse_get_y()/window_get_height() - 0.5)/2.5;
pos[0] = obj_player.x + ((pos[0] - obj_player.x) / 4) * factor;
pos[1] = obj_player.y + ((pos[1] - obj_player.y) / 4) * factor;

//draw_line(obj_player.x, obj_player.y, pos[0], pos[1]);

var vect_normal = vec2_to_vec3(pos);
vect_normal[Vec3.x] -= obj_player.x;
vect_normal[Vec3.y] -= obj_player.y;
vect_normal = vec3_normalize(vect_normal);
global.aim_xdir = vect_normal[Vec3.x];
global.aim_ydir = vect_normal[Vec3.y];
