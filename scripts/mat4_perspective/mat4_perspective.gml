///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a perspective projection matrix with the given parameters, default handedness, default clip space
///@param	{Real} fovy		Specifies the field of view angle in the y direction. Expressed in radians
///@param	{Real} aspect	Aspect ratio between horizontal and vertical size of the view
///@param	{Real} near		The near clipping plane
///@param	{Real} far		The far clipping plane
///@return	{Mat4}


var fov_d = 1.0 / tan(argument0 * 0.5);

var mtx;
mtx[Mat4.m33] = 0;
mtx[Mat4.m00] = fov_d / argument1;
mtx[Mat4.m11] = fov_d;

if (GMM_coordinate_system == GMM_CS.left_handed)
{
	mtx[Mat4.m23] = 1.0;
	
	if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
	{
		mtx[Mat4.m22] = argument3 / (argument3 - argument2);
		mtx[Mat4.m32] = - (argument3 * argument2) / (argument3 - argument2);
	}
	else
	{
		mtx[Mat4.m22] = (argument3 + argument2) / (argument3 - argument2);
		mtx[Mat4.m32] = - (2.0 * argument3 * argument2) / (argument3 - argument2);
	}
}
else
{
	mtx[Mat4.m23] = -1.0;
	
	if (GMM_depth_clip_space == GMM_DCS.zero_to_one)
	{
		mtx[Mat4.m22] = argument3 / (argument2 - argument3);
		mtx[Mat4.m32] = - (argument3 * argument2) / (argument3 - argument2);
	}
	else
	{
		mtx[Mat4.m22] = - (argument3 + argument2) / (argument3 - argument2);
		mtx[Mat4.m32] = - (2.0 * argument3 * argument2) / (argument3 - argument2);
	}
}

return mtx;
