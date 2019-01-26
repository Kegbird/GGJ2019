///@author		Giacomo Marton
///@version		1.0.0


///@description						Importa un file modello di GM
///@param	{String} filename		Il nome del file da importare
///@return	{Vertex Buffer}

var buf = buffer_load(argument0);
var vtxbuf = vertex_create_buffer_from_buffer(buf, global.d3dPrimVF);
vertex_freeze(vtxbuf);

return vtxbuf;