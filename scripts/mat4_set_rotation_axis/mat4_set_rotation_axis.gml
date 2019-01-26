///@author		Giacomo Marton
///@version		1.0.0


///@description				Returns a rotation matrix of a particular axis with the given angle (in degrees)
///@param	{Real} x		x component of the transform vector
///@param	{Real} y		y component of the transform vector
///@param	{Real} z		z component of the transform vector
///@param	{Real} angle	The angle of rotation
///@return	{Mat4}


var COS = dcos(-argument3);
var ICOS = 1 - COS;
var SIN = dsin(-argument3);
var L = argument0;
var M = argument1;
var N = argument2;
var sum = L * L + M * M + N * N;
if (sum != 0)
{
    var factor = 1 / sqrt(sum);
    L *= factor;
    M *= factor;
    N *= factor;
}


var temp;
temp[Mat4.m33] = 1;
temp[Mat4.m00] = L * L * ICOS + COS;
temp[Mat4.m10] = M * L * ICOS - N * SIN;
temp[Mat4.m20] = N * L * ICOS + M * SIN;
temp[Mat4.m01] = L * M * ICOS + N * SIN;
temp[Mat4.m11] = M * M * ICOS + COS;
temp[Mat4.m21] = N * M * ICOS - L * SIN;
temp[Mat4.m02] = L * N * ICOS - M * SIN;
temp[Mat4.m12] = M * N * ICOS + L * SIN;
temp[Mat4.m22] = N * N * ICOS + COS;
return temp;