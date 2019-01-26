/// @description Insert description here
// You can write your code in this editor
instance_create_layer(x,y,"Instances",obj_explosion);
m = instance_create_layer(x,y-4,"Instances", obj_mob_dead);
m.sprite_index = sprite_index;