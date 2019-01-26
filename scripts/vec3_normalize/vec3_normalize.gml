///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a vector in the same direction as <vect> but with length of 1
///@param	{Vec3} vect		The vector to normalize
///@return	{Vec3}


var factor = sqrt(	argument0[Vec3.x] * argument0[Vec3.x] +
					argument0[Vec3.y] * argument0[Vec3.y] +
					argument0[Vec3.z] * argument0[Vec3.z] );
					
var vect;


if (factor != 0)
{
    argument0[Vec3.z] /=factor;
    argument0[Vec3.y] /=factor;
    argument0[Vec3.x] /=factor;
}

return argument0;