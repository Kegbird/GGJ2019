/// @function write_begin (Cmd)
/// @description clear the sendbuffer and start with a new command
/// @param {real}  Cmd command
 
buffer_seek(sendbuffer, buffer_seek_start, 0);
buffer_write(sendbuffer, buffer_cmd, argument0); 