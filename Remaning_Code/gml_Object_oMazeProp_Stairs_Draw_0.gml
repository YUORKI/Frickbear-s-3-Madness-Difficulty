depth = Height;
var top = -16 * image_yscale;
var left = -16 * image_xscale;
var right = 16 * image_xscale;
var lower = depth;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var StepSize = 8;

for (var i = 0; i < (image_yscale * (32 / StepSize)); i++)
{
    var bottom = top + StepSize;
    var upper = lower + StepSize;
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.5, 0.5);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0.5, 0.5);
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0.5, 0.5);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0.5, 0.5);
    top += StepSize;
    lower += StepSize;
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_Doorway, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
