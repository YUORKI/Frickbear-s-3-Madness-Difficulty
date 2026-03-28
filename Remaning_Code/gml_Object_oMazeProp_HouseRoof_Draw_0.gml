depth = Height;
var center = 0;
var top = (-16 * image_yscale) - 8;
var left = (-16 * image_xscale) - 8;
var right = (16 * image_xscale) + 8;
var bottom = (16 * image_yscale) + 8;
var upper = 128 + (8 * image_xscale);
var lower = 128;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0.5, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower + 8), 0.5, 0.5);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0.5, 0.5);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper + 8), 0.5, 0.5);
vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0.5, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower + 8), 0.5, 0.5);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0.5, 0.5);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper + 8), 0.5, 0.5);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, bottom), fz(lower), 0.5, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, bottom), fz(lower + 8), 0.5, 0.5);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, bottom), fz(upper), 0.5, 0.5);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, bottom), fz(upper + 8), 0.5, 0.5);
vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0.5, 0.5);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower + 8), 0.5, 0.5);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0.5, 0.5);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper + 8), 0.5, 0.5);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    vertex_set_point(VertexBuffer, fx(center, bottom), fy(center, bottom), fz(upper), 0, 0);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(center, bottom), fy(center, bottom), fz(upper), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower + 8), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower + 8), 0, 0);
    vertex_set_point(VertexBuffer, fx(center, bottom), fy(center, bottom), fz(upper + 8), 0, 0);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper + 8), 0, 0);
vertex_set_point(VertexBuffer, fx(center, bottom), fy(center, bottom), fz(upper + 8), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper + 8), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower + 8), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower + 8), 0, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower + 8), 0, 0);
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower + 8), 0, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower + 8), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower + 8), 0, 0);
top = -16 * image_yscale;
bottom = 16 * image_yscale;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
left = -16 * image_xscale;
right = 16 * image_xscale;
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_Doorway, 0));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var TexWidth = abs(left - center) / 32;
var TexHeight = abs(upper - lower) / 128;
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), TexWidth, TexHeight);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), TexWidth, TexHeight);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(lower), 0, TexHeight);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), TexWidth, TexHeight);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), TexWidth, TexHeight);
    vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(lower), 0, TexHeight);
}

vertex_set_point(VertexBuffer, fx(center, top), fy(center, top), fz(upper), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeWall_HouseExterior, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
