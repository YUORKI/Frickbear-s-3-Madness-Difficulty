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
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), 0, image_xscale, image_yscale);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), 0, image_xscale, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), 0, 0, image_yscale);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), 0, 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(Tex, 0));
vertex_delete_buffer(VertexBuffer);
