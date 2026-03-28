depth = Height;
var TexWidth = 0;
var top = -16;
var left = -16;
var right = 16;
var bottom = 16;
var upper = 32;
var lower = 0;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 1, 2/3);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 1/3);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 2/3);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 1/3);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 2/3);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 2/3);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 2/3);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 2/3);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 2/3);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 2/3);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 2/3);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 2/3);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 1/3);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(64), 1, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 1/3);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(64), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_Chair, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
