///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a scaling matrix with the given values
///@param	{Real} x		x component of the transform vector
///@param	{Real} y		y component of the transform vector
///@param	{Real} z		z component of the transform vector
///@return	{Mat4}


var mtx;
//identity
mtx[Mat4.m33] = 1;

//scaling
mtx[Mat4.m00] = argument0;
mtx[Mat4.m11] = argument1;
mtx[Mat4.m22] = argument2;
return mtx;