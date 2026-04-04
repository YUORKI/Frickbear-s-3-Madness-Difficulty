depth = Height;
var top = -16;
var left = -24;
var right = 24;
var bottom = 16;
var upper = 32;
var lower = 0;
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
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0.75, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.75, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
var ScreenFrame = 0.09375;

if (floor(Frame / 60) == 1)
    ScreenFrame = 0.15625;

vertex_set_point(VertexBuffer, fx(right, bottom - 2), fy(right, bottom - 2), fz(lower), 0.640625, ScreenFrame + 0.015625);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom - 2), fy(right, bottom - 2), fz(upper), 0.640625, ScreenFrame);
    vertex_set_point(VertexBuffer, fx(left, bottom - 2), fy(left, bottom - 2), fz(lower), 0.625, ScreenFrame + 0.015625);
}

vertex_set_point(VertexBuffer, fx(left, bottom - 2), fy(left, bottom - 2), fz(upper), 0.625, ScreenFrame);
left = -8;
right = 8;
bottom = 0;
lower = upper;
upper += 32;
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0.75, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.75, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_MikeTV, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
Frame = (Frame + 1) % 120;
