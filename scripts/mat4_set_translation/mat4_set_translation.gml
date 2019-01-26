///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a translation matrix with the given values
///@param	{Real} x		x component of the transform vector
///@param	{Real} y		y component of the transform vector
///@param	{Real} z		z component of the transform vector
///@return	{Mat4}


var mtx;
//identity
mtx[Mat4.m33] = 1;
mtx[Mat4.m22] = 1;
mtx[Mat4.m11] = 1;
mtx[Mat4.m00] = 1;

//translation
mtx[Mat4.m30] = argument0;
mtx[Mat4.m31] = argument1;
mtx[Mat4.m32] = argument2;
return mtx;