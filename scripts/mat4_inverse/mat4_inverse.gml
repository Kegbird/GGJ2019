///@author		Giacomo Marton
///@version		1.0.0


///@description					Returns the inverse of the given matrix
///@param	{Mat4} matrix		The matrix to invert
///@return	{Mat4}


var mat0  = argument0[Mat4.m00];
var mat1  = argument0[Mat4.m01];
var mat2  = argument0[Mat4.m02];
var mat3  = argument0[Mat4.m03];
var mat4  = argument0[Mat4.m10];
var mat5  = argument0[Mat4.m11];
var mat6  = argument0[Mat4.m12];
var mat7  = argument0[Mat4.m13];
var mat8  = argument0[Mat4.m20];
var mat9  = argument0[Mat4.m21];
var mat10 = argument0[Mat4.m22];
var mat11 = argument0[Mat4.m23];
var mat12 = argument0[Mat4.m30];
var mat13 = argument0[Mat4.m31];
var mat14 = argument0[Mat4.m32];
var mat15 = argument0[Mat4.m33];
var dst;
dst[Mat4.m33] = 0;

var tmp0 = mat10 * mat15;
var tmp1 = mat14 * mat11;
var tmp2 = mat6 * mat15;
var tmp3 = mat14 * mat7;
var tmp4 = mat6 * mat11;
var tmp5 = mat10 * mat7;
var tmp6 = mat2 * mat15;
var tmp7 = mat14 * mat3;
var tmp8 = mat2 * mat11;
var tmp9 = mat10 * mat3;
var tmp10 = mat2 * mat7;
var tmp11 = mat6 * mat3;

dst[0] = tmp0*mat5 + tmp3*mat9 + tmp4*mat13
- (tmp1*mat5 + tmp2*mat9 + tmp5*mat13);
dst[1] = tmp1*mat1 + tmp6*mat9 + tmp9*mat13
- (tmp0*mat1 + tmp7*mat9 + tmp8*mat13);
dst[2] = tmp2*mat1 + tmp7*mat5 + tmp10*mat13
- (tmp3*mat1 + tmp6*mat5 + tmp11*mat13);
dst[3] = tmp5*mat1 + tmp8*mat5 + tmp11*mat9
- (tmp4*mat1 + tmp9*mat5 + tmp10*mat9);
dst[4] = tmp1*mat4 + tmp2*mat8 + tmp5*mat12
- (tmp0*mat4 + tmp3*mat8 + tmp4*mat12);
dst[5] = tmp0*mat0 + tmp7*mat8 + tmp8*mat12
- (tmp1*mat0 + tmp6*mat8 + tmp9*mat12);
dst[6] = tmp3*mat0 + tmp6*mat4 + tmp11*mat12
- (tmp2*mat0 + tmp7*mat4 + tmp10*mat12);
dst[7] = tmp4*mat0 + tmp9*mat4 + tmp10*mat8
- (tmp5*mat0 + tmp8*mat4 + tmp11*mat8);

tmp0 = mat8*mat13;
tmp1 = mat12*mat9;
tmp2 = mat4*mat13;
tmp3 = mat12*mat5;
tmp4 = mat4*mat9;
tmp5 = mat8*mat5;
tmp6 = mat0*mat13;
tmp7 = mat12*mat1;
tmp8 = mat0*mat9;
tmp9 = mat8*mat1;
tmp10 = mat0*mat5;
tmp11 = mat4*mat1;

dst[8] = tmp0*mat7 + tmp3*mat11 + tmp4*mat15
- (tmp1*mat7 + tmp2*mat11 + tmp5*mat15);
dst[9] = tmp1*mat3 + tmp6*mat11 + tmp9*mat15
- (tmp0*mat3 + tmp7*mat11 + tmp8*mat15);
dst[10] = tmp2*mat3 + tmp7*mat7 + tmp10*mat15
- (tmp3*mat3 + tmp6*mat7 + tmp11*mat15);
dst[11] = tmp5*mat3 + tmp8*mat7 + tmp11*mat11
- (tmp4*mat3 + tmp9*mat7 + tmp10*mat11);
dst[12] = tmp2*mat10 + tmp5*mat14 + tmp1*mat6
- (tmp4*mat14 + tmp0*mat6 + tmp3*mat10);
dst[13] = tmp8*mat14 + tmp0*mat2 + tmp7*mat10
- (tmp6*mat10 + tmp9*mat14 + tmp1*mat2);
dst[14] = tmp6*mat6 + tmp11*mat14 + tmp3*mat2
- (tmp10*mat14 + tmp2*mat2 + tmp7*mat6);
dst[15] = tmp10*mat10 + tmp4*mat2 + tmp9*mat6
- (tmp8*mat6 + tmp11*mat10 + tmp5*mat2);

var det = mat0*dst[0]+mat4*dst[1]+mat8*dst[2]+mat12*dst[3];
if (det == 0) return undefined;

det = 1 / det;	//multiplication is faster than division
dst[Mat4.m00] *= det;
dst[Mat4.m01] *= det;
dst[Mat4.m02] *= det;
dst[Mat4.m03] *= det;
dst[Mat4.m10] *= det;
dst[Mat4.m11] *= det;
dst[Mat4.m12] *= det;
dst[Mat4.m13] *= det;
dst[Mat4.m20] *= det;
dst[Mat4.m21] *= det;
dst[Mat4.m22] *= det;
dst[Mat4.m23] *= det;
dst[Mat4.m30] *= det;
dst[Mat4.m31] *= det;
dst[Mat4.m32] *= det;
dst[Mat4.m33] *= det;

return dst;