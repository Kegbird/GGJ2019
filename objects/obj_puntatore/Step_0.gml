var mtx = mat4_set_translation( (window_mouse_get_x() - 800/2), (window_mouse_get_y() - 600/2) + (window_mouse_get_y()/600 - 0.5)*300, 0);
mtx = mat4_rotate_z(mtx, 45);
mtx = mat4_translate(mtx, obj_player.x, obj_player.y, 0);

var pos = vec4_set(0,0,0,1);
pos = vec4_transform(pos, mtx);

var factor = 1 - (window_mouse_get_y()/600 - 0.5)/2.5;
pos[0] = obj_player.x + ((pos[0] - obj_player.x) / 4) * factor;
pos[1] = obj_player.y + ((pos[1] - obj_player.y) / 4) * factor;

//draw_line(obj_player.x, obj_player.y, pos[0], pos[1]);

var vect_normal = vec2_to_vec3(pos);
vect_normal[Vec3.x] -= obj_player.x;
vect_normal[Vec3.y] -= obj_player.y;
vect_normal = vec3_normalize(vect_normal);
x = vect_normal[Vec3.x];
y = vect_normal[Vec3.y];
