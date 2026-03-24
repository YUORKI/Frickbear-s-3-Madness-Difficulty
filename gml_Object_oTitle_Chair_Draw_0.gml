event_inherited();

function fx(arg0, arg1)
{
    return round((x + (arg0 * dcos(image_angle * -1))) - (arg1 * dsin(image_angle * -1)));
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
vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(16), 1, 2/3);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, -16), fy(16, -16), fz(16), 1, 1);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(16), 0, 2/3);
}

vertex_set_point(VertexBuffer, fx(-16, -16), fy(-16, -16), fz(16), 0, 1);
vertex_set_point(VertexBuffer, fx(16, 0), fy(16, 0), fz(16), 1, 2/3);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(16, 4), fy(16, 4), fz(48), 1, 0);
    vertex_set_point(VertexBuffer, fx(-16, 0), fy(-16, 0), fz(16), 0, 2/3);
}

vertex_set_point(VertexBuffer, fx(-16, 4), fy(-16, 4), fz(48), 0, 0);
vertex_set_point(VertexBuffer, fx(2, 0), fy(2, 0), fz(0), 0.5, 0.99);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(2, 0), fy(2, 0), fz(16), 0.5, 1);
    vertex_set_point(VertexBuffer, fx(-2, 0), fy(-2, 0), fz(0), 0.5, 0.99);
}

vertex_set_point(VertexBuffer, fx(-2, 0), fy(-2, 0), fz(16), 0.5, 1);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Chair, 0));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
