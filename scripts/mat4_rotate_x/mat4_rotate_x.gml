///@author		Giacomo Marton
///@version		1.0.0


///@description				Rotates the given matrix with the given angle around the X axis (in degrees)
///@param	{Mat4} mtx		The matrix to rotate
///@param	{Real} angle	The angle of rotation
///@return	{Mat4}


var mtx = mat4_set_rotation_x(argument1);
return matrix_multiply(argument0, mtx);