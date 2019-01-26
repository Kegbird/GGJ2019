///@author		Giacomo Marton
///@version		1.0.0


///@description			Returns an identity matrix
///@return	{Mat4}


var mtx;

mtx[Mat4.m33] = 1;
mtx[Mat4.m22] = 1;
mtx[Mat4.m11] = 1;
mtx[Mat4.m00] = 1;

return mtx;