///@author		Giacomo Marton
///@version		1.0.0


///@description				Translates the given matrix
///@param	{Mat4} mtx		The matrix to translate
///@param	{Real} x		x component of the transform vector
///@param	{Real} y		y component of the transform vector
///@param	{Real} z		z component of the transform vector
///@return	{Mat4}


var mtx = mat4_set_translation(argument1, argument2, argument3);
return matrix_multiply(argument0, mtx);