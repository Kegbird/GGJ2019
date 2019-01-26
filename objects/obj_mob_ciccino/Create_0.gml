
image_speed = 0;
image_index = 0;
direction = irandom_range(0,359);

killed = false;
mob_hp = 5;
timer = 0;
time = irandom_range(60,180);
state = "walk";
spd = .5;
aggro = false;
agg_timer = 0;
agg_time = 120;
pDist = 200;
ftimes = 0;
ftimes_max = 3;

anim_idle = spr_mob_ciccino_idle;
anim_walk = spr_mob_ciccino_walk;
anim_shoot = spr_mob_ciccino_hit;
bullet = obj_mob_bullet_01;