///@author		Giacomo Marton
///@version		1.0.0


///@description					Transforms a vector using the given matrix
///@param	{Vec4} vect			The vector to transform
///@param	{Matrix} mtx		The matrix used for transformation
///@return	{Vec4}


var vec_0 = argument0[0];
var vec_1 = argument0[1];
var vec_2 = argument0[2];
var vec_3 = argument0[3];

var vect;

vect[3] =
    vec_0 * argument1[3]+
    vec_1 * argument1[7]+
    vec_2 * argument1[11]+
    vec_3 * argument1[15];
vect[2] =
    vec_0 * argument1[2]+
    vec_1 * argument1[6]+
    vec_2 * argument1[10]+
    vec_3 * argument1[14];
vect[1] =
    vec_0 * argument1[1]+
    vec_1 * argument1[5]+
    vec_2 * argument1[9]+
    vec_3 * argument1[13];
vect[0] =
    vec_0 * argument1[0]+
    vec_1 * argument1[4]+
    vec_2 * argument1[8]+
    vec_3 * argument1[12];
    
return vect;