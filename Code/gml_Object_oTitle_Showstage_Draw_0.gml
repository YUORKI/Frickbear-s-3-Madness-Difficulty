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

tcoord_x = 0;
tcoord_y = Top / 128;
tcoord_w = image_xscale;
tcoord_h = 1 - (Bottom / 128);
var Texture = sprite_get_texture(sTitleTex_StageFloor, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(0, 128), fy(0, 128), fz(32), 0, 8);
vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), -3, 8);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), -3, 8);
vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(32), -5, 7);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(32), -5, 7);
vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(32), -6, 5);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(32), -6, 5);
vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(32), -6, -5);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(32), -6, -5);
vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(32), -5, -7);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(32), -5, -7);
vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), -3, -8);
vertex_set_point(VertexBuffer, fx(0, 0), fy(0, 0), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), -3, -8);
vertex_set_point(VertexBuffer, fx(0, -128), fy(0, -128), fz(32), 0, -8);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
Texture = sprite_get_texture(sTitleTex_StageEdge, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(0), 1.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), 1.5, 0);
    vertex_set_point(VertexBuffer, fx(0, 128), fy(0, 128), fz(0), 0, 1);
}

vertex_set_point(VertexBuffer, fx(0, 128), fy(0, 128), fz(32), 0, 0);
vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(0), 2.62, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(32), 2.62, 0);
    vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(0), 1.5, 1);
}

vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), 1.5, 0);
vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(0), 3.74, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(32), 3.74, 0);
    vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(0), 2.62, 1);
}

vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(32), 2.62, 0);
vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(0), 7.74, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(32), 7.74, 0);
    vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(0), 3.74, 1);
}

vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(32), 3.74, 0);
vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(0), 7.86, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(32), 7.86, 0);
    vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(0), 6.74, 1);
}

vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(32), 6.74, 0);
vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(0), 8.96, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), 8.96, 0);
    vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(0), 7.86, 1);
}

vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(32), 7.86, 0);
vertex_set_point(VertexBuffer, fx(0, -128), fy(0, -128), fz(0), 10.46, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(0, -128), fy(0, -128), fz(32), 10.46, 0);
    vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(0), 8.96, 1);
}

vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), 8.96, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
Texture = sprite_get_texture(sTitleTex_Curtain, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), 1.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(128), 1.5, 0.25);
    vertex_set_point(VertexBuffer, fx(0, 128), fy(0, 128), fz(32), 0, 1);
}

vertex_set_point(VertexBuffer, fx(0, 128), fy(0, 128), fz(128), 0, 0.25);
vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(96), 3.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(128), 3.5, 0.5);
    vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(32), 1.5, 1);
}

vertex_set_point(VertexBuffer, fx(-48, 128), fy(-48, 128), fz(128), 1.5, 0.25);
vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(112), 1.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(128), 1.5, 0.75);
    vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(96), 0, 1);
}

vertex_set_point(VertexBuffer, fx(-80, 112), fy(-80, 112), fz(128), 0, 0.75);
vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(112), 4, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(128), 4, 0.875);
    vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(112), 0, 1);
}

vertex_set_point(VertexBuffer, fx(-96, 80), fy(-96, 80), fz(128), 0, 0.875);
vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(96), 1.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(128), 1.5, 0.75);
    vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(112), 0, 1);
}

vertex_set_point(VertexBuffer, fx(-96, -80), fy(-96, -80), fz(128), 0, 0.75);
vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), 1.5, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(128), 1.5, 0.25);
    vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(96), 3.5, 1);
}

vertex_set_point(VertexBuffer, fx(-80, -112), fy(-80, -112), fz(128), 3.5, 0.5);
vertex_set_point(VertexBuffer, fx(0, -128), fy(0, -128), fz(32), 0, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(0, -128), fy(0, -128), fz(128), 0, 0.25);
    vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(32), 1.5, 1);
}

vertex_set_point(VertexBuffer, fx(-48, -128), fy(-48, -128), fz(128), 1.5, 0.25);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
