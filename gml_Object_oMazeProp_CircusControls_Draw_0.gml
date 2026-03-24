depth = Height;
var top = y - 16;
var left = x - 48;
var right = x + 48;
var bottom = y + 24;
var upper = 48;
var lower = 0;
var TW = 0.16666666666666666;
var TH = 0.2;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, right, bottom, lower, 6 * TW, 5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, bottom, 32, 6 * TW, 3 * TH);
    vertex_set_point(VertexBuffer, left, bottom, lower, 0 * TW, 5 * TH);
}

vertex_set_point(VertexBuffer, left, bottom, 32, 0 * TW, 3 * TH);
vertex_set_point(VertexBuffer, right, bottom, 32, 6 * TW, 3 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, y - 8, upper, 6 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 32, 0 * TW, 3 * TH);
}

vertex_set_point(VertexBuffer, left, y - 8, upper, 0 * TW, 0 * TH);
vertex_set_point(VertexBuffer, right, y - 8, upper, 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, top, upper, 0, 0);
    vertex_set_point(VertexBuffer, left, y - 8, upper, 0, 0);
}

vertex_set_point(VertexBuffer, left, top, upper, 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, left, bottom, 0, 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, left, bottom, 32, 0, 0);
        vertex_set_point(VertexBuffer, left, top, 0, 0, 0);
    }
    
    vertex_set_point(VertexBuffer, left, top, 32, 0, 0);
    vertex_set_point(VertexBuffer, left, bottom, 32, 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, left, y - 8, upper, 0, 0);
        vertex_set_point(VertexBuffer, left, top, 32, 0, 0);
    }
    
    vertex_set_point(VertexBuffer, left, top, upper, 0, 0);
    left = x + 48;
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_CircusControls, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
