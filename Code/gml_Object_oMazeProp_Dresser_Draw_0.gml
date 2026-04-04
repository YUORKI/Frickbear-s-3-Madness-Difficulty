depth = Height;
var TexWidth = 2/3;
var top = -16;
var left = -16;
var right = 16;
var bottom = 16;
var upper = max(Size, 1) * 32;
var lower = 0;
var Textures = [sMazeTex_Dresser0, sMazeTex_Dresser1, sMazeTex_Dresser2, sMazeTex_Dresser3];
var Texture = Textures[Size];

if (Size == 0)
{
    TexWidth = 0.5;
}
else
{
    left *= 2;
    right *= 2;
}

shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), TexWidth, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), TexWidth, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), TexWidth, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), TexWidth, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), TexWidth, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), TexWidth, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), TexWidth, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), TexWidth, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(Texture, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
