/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 0;
direction = irandom_range(0,359);
mob_hp = 10;
timer = 0;
time = irandom_range(60,120);
state = "walk";
spd = 1;
aggro = false;
agg_timer = 0;
agg_time = 120;
pDist = 200;
ftimes = 0;
ftimes_max = 3;

anim_idle = sprite_index;
anim_walk = sprite_index;
anim_shoot = sprite_index;
bullet = obj_mob_bullet_01;