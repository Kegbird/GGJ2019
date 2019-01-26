///@author		Giacomo Marton
///@version		1.0.0


///@description				Rotates the given matrix around a particular axis with the given angle(in degrees)
///@param	{Mat4} mtx		The matrix to rotate
///@param	{Real} x		x component of the transform vector
///@param	{Real} y		y component of the transform vector
///@param	{Real} z		z component of the transform vector
///@param	{Real} angle	The angle of rotation
///@return	{Mat4}


var mtx = mat4_set_rotation_axis(argument1, argument2, argument3, argument4);
return matrix_multiply(argument0, mtx);