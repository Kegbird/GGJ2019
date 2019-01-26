
execute_double_instance();
 
network_settings_init();
draw_set_font(fnt_consolas);
global.server = false;


global.k_left = ord("A");
global.k_right = ord("D");
global.k_up = ord("W");
global.k_down = ord("S");

global.k_fire = mb_left;
global.k_action = ord("E");

global.aim_xdir = 0;
global.aim_ydir = 0;
