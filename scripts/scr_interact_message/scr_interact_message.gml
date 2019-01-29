var nearest = instance_nearest(x, y, obj_player_other);
if(instance_exists(nearest))
{
	var d = point_distance(x, y, nearest.x, nearest.y);
	if (d < 30 && instance_number(obj_nuvoletta) == 0) 
	{
		var nuvola = instance_create_layer(x, y, "Instances", obj_nuvoletta);
		nuvola.target = nearest;
		nuvola.request = id;
		nuvola.testo = nearest.text;
	}
}