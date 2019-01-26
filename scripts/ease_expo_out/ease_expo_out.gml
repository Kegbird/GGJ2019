///@author		Giacomo Marton
///@version		1.0.0


///@description					Returns the interpolation of two inputs by the given amount with an easing function
///@param	{Real} a			The first value
///@param	{Real} b			The second value
///@param	{Real} ammount		The ammount to interpolate
///@return	{Real}


return lerp(argument0, argument1, 1 - power( 2, -10 * argument2 ) );