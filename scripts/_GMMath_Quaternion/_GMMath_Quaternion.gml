///@author		Giacomo Marton
///@version		1.0.0


///@description			Enumerations definition for GMMath


//Quaternion
enum Quat
{
	x = 0,
	y = 1,
	z = 2,
	w = 3
}

//Dual Quaternion
enum DQuat
{
	//real part
	rx = 0,
	ry = 1,
	rz = 2,
	rw = 3,
	
	//dual part
	dx = 4,
	dy = 5,
	dz = 6,
	dw = 7
}