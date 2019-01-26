/// @description Insert description here
// You can write your code in this editor
aggro = true;
agg_timer = 0;
var _dmg = other.dmg;
instance_destroy(other);
mob_hp -= _dmg;
image_index = 0;
image_speed = 1;
