depth = 0;
var Texture = sprite_get_texture(Sprite, 0);

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
tcoord_x = 0;
tcoord_y = 1 - (Top / 128);
tcoord_w = image_xscale / (sprite_get_width(Sprite) / 32);
tcoord_h = (Top - Bottom) / 128;
var _x1 = sprite_width / -2;
var _x2 = _x1 * -1;
vertex_set_point(VertexBuffer, fx(_x2, 0), fy(_x2, 0), fz(Bottom), tcoord_x + tcoord_w, tcoord_y + tcoord_h);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, 0), fy(_x2, 0), fz(Top), tcoord_x + tcoord_w, tcoord_y);
    vertex_set_point(VertexBuffer, fx(_x1, 0), fy(_x1, 0), fz(Bottom), tcoord_x, tcoord_y + tcoord_h);
}

vertex_set_point(VertexBuffer, fx(_x1, 0), fy(_x1, 0), fz(Top), tcoord_x, tcoord_y);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
