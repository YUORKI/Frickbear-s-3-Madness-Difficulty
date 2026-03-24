event_inherited();

function fx(arg0, arg1)
{
    return round(x + (((arg0 * dcos(image_angle * -1)) - (arg1 * dsin(image_angle * -1))) * image_xscale));
}

function fy(arg0, arg1)
{
    return round(y + (arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1)));
}

function fz(arg0)
{
    return round(depth + arg0);
}

VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(16, -24), fy(16, -24), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, -24), fy(16, -24), fz(16), 0, 0);
    vertex_set_point(VertexBuffer, fx(-16, -24), fy(-16, -24), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(-16, -24), fy(-16, -24), fz(16), 0, 0);
vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(16), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, -24), fy(16, -24), fz(16), 1, 0);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(16), 0, 1);
}

vertex_set_point(VertexBuffer, fx(-16, -24), fy(-16, -24), fz(16), 0, 0);
vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(16), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(48), 1, 0);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(16), 0, 1);
}

vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(48), 0, 0);
vertex_set_point(VertexBuffer, fx(16, 8), fy(16, 8), fz(48), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(48), 0, 0);
    vertex_set_point(VertexBuffer, fx(-16, 8), fy(-16, 8), fz(48), 0, 0);
}

vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(48), 0, 0);
vertex_set_point(VertexBuffer, fx(16, 8), fy(16, 8), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, 8), fy(16, 8), fz(48), 0, 0);
    vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(48), 0, 0);
vertex_set_point(VertexBuffer, fx(16, -24), fy(16, -24), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, -24), fy(16, -24), fz(16), 0, 0);
    vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(16), 0, 0);
vertex_set_point(VertexBuffer, fx(-16, 8), fy(-16, 8), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-16, 8), fy(-16, 8), fz(48), 0, 0);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(48), 0, 0);
vertex_set_point(VertexBuffer, fx(-16, -24), fy(-16, -24), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-16, -24), fy(-16, -24), fz(16), 0, 0);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(16), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Booth, 0));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
