depth = Height;
var top = -16;
var left = -16;
var right = 16;
var bottom = 16;
var upper = 24;
var lower = 16;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_GiftBox, 1));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, 0), fy(right, 0), fz(upper), 1, 0.25);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, 0), fy(right, 0), fz(upper + 8), 1, 0);
    vertex_set_point(VertexBuffer, fx(left, 0), fy(left, 0), fz(upper), 0, 0.25);
}

vertex_set_point(VertexBuffer, fx(left, 0), fy(left, 0), fz(upper + 8), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 0.25);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0.5);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0.25);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 0.25);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0.5);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0.25);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 0.25);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0.5);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0.25);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1, 0.25);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0.5);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0.25);
top = -14;
left = -14;
right = 14;
bottom = 14;
upper = 16;
lower = 0;
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0.9375, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0.9375, 0.5);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0.0625, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0.0625, 0.5);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0.9375, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0.9375, 0.5);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0.0625, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0.0625, 0.5);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0.9375, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0.9375, 0.5);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0.0625, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.0625, 0.5);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0.9375, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0.9375, 0.5);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0.0625, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.0625, 0.5);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_GiftBox, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
