event_inherited();
Size = 1.25;
var Texture = sprite_get_texture(sTitleTex_TV, 0);

function fx(arg0, arg1)
{
    return x + (((arg0 * dcos(image_angle * -1)) - (arg1 * dsin(image_angle * -1))) * Size * -1);
}

function fy(arg0, arg1)
{
    return y + (((arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1))) * Size * -1);
}

function fz(arg0)
{
    return depth + (arg0 * Size) + 108;
}

VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var left = 16;
var right = -16;
var upper_back = -5;
var upper_front = -20.5;
var lower_back = 5.47;
var lower_front = -9.56;
vertex_set_point(VertexBuffer, fx(right, lower_front), fy(right, lower_front), fz(-20.51), 0.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, upper_front), fy(right, upper_front), fz(9.56), 0.5, 0);
    vertex_set_point(VertexBuffer, fx(left, lower_front), fy(left, lower_front), fz(-20.51), 0, 1);
}

vertex_set_point(VertexBuffer, fx(left, upper_front), fy(left, upper_front), fz(9.56), 0, 0);
vertex_set_point(VertexBuffer, fx(right, lower_back), fy(right, lower_back), fz(-15.04), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, upper_back), fy(right, upper_back), fz(15.04), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, lower_back), fy(left, lower_back), fz(-15.04), 0, 0);
}

vertex_set_point(VertexBuffer, fx(left, upper_back), fy(left, upper_back), fz(15.04), 0, 0);
vertex_set_point(VertexBuffer, fx(left, lower_front), fy(left, lower_front), fz(-20.51), 0.75, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, upper_front), fy(left, upper_front), fz(9.56), 0.75, 0);
    vertex_set_point(VertexBuffer, fx(left, lower_back), fy(left, lower_back), fz(-15.04), 0.5, 1);
}

vertex_set_point(VertexBuffer, fx(left, upper_back), fy(left, upper_back), fz(15.04), 0.5, 0);
vertex_set_point(VertexBuffer, fx(right, lower_front), fy(right, lower_front), fz(-20.51), 0.75, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, upper_front), fy(right, upper_front), fz(9.56), 0.75, 0);
    vertex_set_point(VertexBuffer, fx(right, lower_back), fy(right, lower_back), fz(-15.04), 0.5, 1);
}

vertex_set_point(VertexBuffer, fx(right, upper_back), fy(right, upper_back), fz(15.04), 0.5, 0);
vertex_set_point(VertexBuffer, fx(right, upper_front), fy(right, upper_front), fz(9.56), 0.75, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, upper_back), fy(right, upper_back), fz(15.04), 1, 1);
    vertex_set_point(VertexBuffer, fx(left, upper_front), fy(left, upper_front), fz(9.56), 0.75, 0);
}

vertex_set_point(VertexBuffer, fx(left, upper_back), fy(left, upper_back), fz(15.04), 1, 0);
vertex_set_point(VertexBuffer, fx(right, lower_front), fy(right, lower_front), fz(-20.51), 0.75, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, lower_back), fy(right, lower_back), fz(-15.04), 1, 1);
    vertex_set_point(VertexBuffer, fx(left, lower_front), fy(left, lower_front), fz(-20.51), 0.75, 0);
}

vertex_set_point(VertexBuffer, fx(left, lower_back), fy(left, lower_back), fz(-15.04), 1, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
