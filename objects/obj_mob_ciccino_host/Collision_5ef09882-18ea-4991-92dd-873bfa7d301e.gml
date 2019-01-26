mob_hp -= other.dmg;

image_index = 0;
sprite_index = anim_hit;

if (mob_hp <= 0) {
	killed = true;
	instance_destroy();
}

with (other) {
	instance_destroy();	
}