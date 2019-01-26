///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a rotation matrix with the given angle around the Z axis (in degrees)
///@param	{Real} angle	The angle of rotation
///@return	{Mat4}


var COS = dcos(-argument0);
var SIN = dsin(-argument0);

var temp;
temp[Mat4.m33] = 1;
temp[Mat4.m00] = COS;
temp[Mat4.m10] = -SIN;
temp[Mat4.m01] = SIN;
temp[Mat4.m11] = COS;
temp[Mat4.m22] = 1;
return temp;