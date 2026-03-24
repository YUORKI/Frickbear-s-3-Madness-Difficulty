depth = Height;
var top = -16 * image_yscale;
var left = -16 * image_xscale;
var right = 16 * image_xscale;
var bottom = 16 * image_yscale;
var upper = 120;
var lower = 72;
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), image_xscale, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), image_xscale, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), image_xscale, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), image_xscale, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 1);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);
}

vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_KitchenCupboard, 0));
vertex_delete_buffer(VertexBuffer);
