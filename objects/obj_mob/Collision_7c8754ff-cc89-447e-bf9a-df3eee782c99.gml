aggro = true;
agg_timer = 0;

mob_hp -= other.dmg;
instance_destroy(other);

image_index = 0;
image_speed = 1;