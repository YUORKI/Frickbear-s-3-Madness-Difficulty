event_inherited();
var Texture = sprite_get_texture(sTitleTex_Door, 0);

function fx(arg0, arg1)
{
    return (x + (arg0 * dcos(image_angle * -1))) - (arg1 * dsin(image_angle * -1));
}

function fy(arg0, arg1)
{
    return y + (arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1));
}

function fz(arg0)
{
    return depth + arg0;
}

VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
tcoord_x = 0;
tcoord_w = tcoord_x + (1/3);
tcoord_y = 0;
tcoord_h = 1;
var _x1 = 0;
var _x2 = 48;
var _y1 = -6;
var _y2 = _y1 * -1;
var _z0 = 0;
var _z1 = 88;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z0), tcoord_w, tcoord_h);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), tcoord_w, tcoord_y);
        vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z0), tcoord_x, tcoord_h);
    }
    
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), tcoord_x, tcoord_y);
    _y1 *= -1;
    tcoord_x = DoorType / 3;
    tcoord_w = tcoord_x + (1/3);
}

vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z1), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 0, 0);
vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z1), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 0, 0);
vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z1), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z1), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
