with (obj_player_other) {
	var d = point_distance(argument0.x, argument0.y, x, y);
	if (d < 90 && !instance_exists(nuvola)) {
		nuvola = instance_create_layer(x, y, "Instances", obj_nuvoletta);
		nuvola.target = id;
		nuvola.request = argument0.id;
	}
}