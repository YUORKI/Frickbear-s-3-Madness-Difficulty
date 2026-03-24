event_inherited();
var Texture = sprite_get_texture(sTitleTex_Doorway, 0);

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
tcoord_y = Top / 128;
tcoord_w = image_xscale;
tcoord_h = 1 - (Bottom / 128);
var BarWidth = 8;
var _x1 = -32 * image_xscale;
var _x1sub = _x1 + BarWidth;
var _x2 = _x1 * -1;
var _x2sub = _x2 - BarWidth;
var _y1 = -10;
var _y2 = _y1 * -1;
var _z0 = 0;
var _z1 = 96;
var _z2 = 96 - BarWidth;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z0), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z2), 1, 0.75);
        vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z0), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 0, 0.75);
    vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z0), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z2), 1, 0.75);
        vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z0), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 0, 0.75);
    vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z2), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 1, 0);
        vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z2), 0.75, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 0.75, 0);
    _y1 *= -1;
}

vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z0), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z1), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z0), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 1, 1);
vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z0), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z1), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z0), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 1, 1);
vertex_set_point(VertexBuffer, fx(_x2, _y2), fy(_x2, _y2), fz(_z1), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, _y1), fy(_x2, _y1), fz(_z1), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x1, _y2), fy(_x1, _y2), fz(_z1), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x1, _y1), fy(_x1, _y1), fz(_z1), 1, 1);
vertex_set_point(VertexBuffer, fx(_x1sub, _y2), fy(_x1sub, _y2), fz(_z0), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x1sub, _y2), fy(_x1sub, _y2), fz(_z2), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z0), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z2), 1, 1);
vertex_set_point(VertexBuffer, fx(_x2sub, _y2), fy(_x2sub, _y2), fz(_z0), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2sub, _y2), fy(_x2sub, _y2), fz(_z2), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z0), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z2), 1, 1);
vertex_set_point(VertexBuffer, fx(_x2sub, _y2), fy(_x2sub, _y2), fz(_z2), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2sub, _y1), fy(_x2sub, _y1), fz(_z2), 1, 1);
    vertex_set_point(VertexBuffer, fx(_x1sub, _y2), fy(_x1sub, _y2), fz(_z2), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x1sub, _y1), fy(_x1sub, _y1), fz(_z2), 1, 1);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
