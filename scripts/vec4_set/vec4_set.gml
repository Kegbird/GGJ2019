///@author		Giacomo Marton
///@version		1.0.0


///@description				Creates a four component vector
///@param	{Real} x		Component x
///@param	{Real} y		Component y
///@param	{Real} z		Component z
///@param	{Real} w		Component w
///@return	{Vec4}


var vect;
vect[Vec4.w] = argument3;
vect[Vec4.z] = argument2;
vect[Vec4.y] = argument1;
vect[Vec4.x] = argument0;
return vect;