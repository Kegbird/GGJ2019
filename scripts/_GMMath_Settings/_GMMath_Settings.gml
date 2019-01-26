///@author		Giacomo Marton
///@version		1.0.0


///@description			General settings and enums for the GMMath library


//Macros
#macro GMM_epsilon 0.0001
#macro GMM_coordinate_system GMM_CS.left_handed
#macro GMM_depth_clip_space GMM_DCS.zero_to_one





//Enums
enum GMM_CS
{
	left_handed,
	right_handed
}

enum GMM_DCS
{
	zero_to_one,
	minus_one_to_one,
	game_maker
}