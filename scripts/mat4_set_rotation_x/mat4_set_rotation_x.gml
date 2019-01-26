///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a rotation matrix with the given angle around the X axis (in degrees)
///@param	{Real} angle	The angle of rotation
///@return	{Mat4}


var COS = dcos(-argument0);
var SIN = dsin(-argument0);

var temp;
temp[Mat4.m33] = 1;
temp[Mat4.m00] = 1;
temp[Mat4.m11] = COS;
temp[Mat4.m21] = -SIN;
temp[Mat4.m12] = SIN;
temp[Mat4.m22] = COS;
return temp;