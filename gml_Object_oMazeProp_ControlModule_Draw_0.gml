depth = 0;
var TW = 0.125;
var TH = 0.2;
var top = y - 64;
var left = x - 64;
var right = x + 64;
var bottom = y + 64;
var upper = 128;
var lower = 0;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, right, top, lower, 8 * TW, 5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, top, upper, 8 * TW, 1 * TH);
    vertex_set_point(VertexBuffer, left, top, lower, 4 * TW, 5 * TH);
}

vertex_set_point(VertexBuffer, left, top, upper, 4 * TW, 1 * TH);
vertex_set_point(VertexBuffer, left, top, lower, 4 * TW, 5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left, top, 48, 4 * TW, 3.5 * TH);
    vertex_set_point(VertexBuffer, left, bottom, lower, 0 * TW, 5 * TH);
}

vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 3.5 * TH);
vertex_set_point(VertexBuffer, left, top, 48, 4 * TW, 3.5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 8, top, 96, 4 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 3.5 * TH);
}

vertex_set_point(VertexBuffer, left + 8, bottom, 96, 0 * TW, 2 * TH);
vertex_set_point(VertexBuffer, left + 8, top, 96, 4 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 32, top, 112, 4 * TW, 1 * TH);
    vertex_set_point(VertexBuffer, left + 8, bottom, 96, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, left + 32, bottom, 112, 0 * TW, 1 * TH);
vertex_set_point(VertexBuffer, left + 32, top, 112, 4 * TW, 1 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 48, top, 128, 4 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, left + 32, bottom, 112, 0 * TW, 1 * TH);
}

vertex_set_point(VertexBuffer, left + 48, bottom, 128, 0 * TW, 0 * TH);
vertex_set_point(VertexBuffer, right, bottom, lower, 4 * TW, 5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, bottom, 48, 4 * TW, 3.5 * TH);
    vertex_set_point(VertexBuffer, right, top, lower, 0 * TW, 5 * TH);
}

vertex_set_point(VertexBuffer, right, top, 48, 0 * TW, 3.5 * TH);
vertex_set_point(VertexBuffer, right, bottom, 48, 4 * TW, 3.5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 8, bottom, 96, 4 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, right, top, 48, 0 * TW, 3.5 * TH);
}

vertex_set_point(VertexBuffer, right - 8, top, 96, 0 * TW, 2 * TH);
vertex_set_point(VertexBuffer, right - 8, bottom, 96, 4 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 32, bottom, 112, 4 * TW, 1 * TH);
    vertex_set_point(VertexBuffer, right - 8, top, 96, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, right - 32, top, 112, 0 * TW, 1 * TH);
vertex_set_point(VertexBuffer, right - 32, bottom, 112, 4 * TW, 1 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 48, bottom, 128, 4 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, right - 32, top, 112, 0 * TW, 1 * TH);
}

vertex_set_point(VertexBuffer, right - 48, top, 128, 0 * TW, 0 * TH);
left = left - 16;
right = right + 16;
vertex_set_point(VertexBuffer, left, top, 48, 4 * TW, 3.5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 8, top, 96, 4 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 3.5 * TH);
}

vertex_set_point(VertexBuffer, left + 8, bottom, 96, 0 * TW, 2 * TH);
vertex_set_point(VertexBuffer, right, bottom, 48, 4 * TW, 3.5 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 8, bottom, 96, 4 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, right, top, 48, 0 * TW, 3.5 * TH);
}

vertex_set_point(VertexBuffer, right - 8, top, 96, 0 * TW, 2 * TH);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_ControlModule, 0));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
TW = 0.25;
TH = 0.25;
vertex_set_point(VertexBuffer, left, top, 0, 4 * TW, 4 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left, top, 48, 4 * TW, 2.5 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 0, 0 * TW, 4 * TH);
}

vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 2.5 * TH);
vertex_set_point(VertexBuffer, left, top, 0, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left, top, 48, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, left, top - 256, 0, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, left, top - 256, 48, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, left, bottom + 256, 0, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left, bottom + 256, 48, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 0, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, left, top, 48, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 8, top, 96, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, left, top - 256, 48, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, left + 8, top - 256, 96, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, left, bottom + 256, 48, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 8, bottom + 256, 96, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, left, bottom, 48, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, left + 8, bottom, 96, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, left + 8, top - 256, 96, 20 * TW, 3 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, left + 8, top - 256, 192, 20 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, left + 8, bottom + 256, 96, 0 * TW, 3 * TH);
}

vertex_set_point(VertexBuffer, left + 8, bottom + 256, 192, 0 * TW, 0 * TH);
vertex_set_point(VertexBuffer, right, top, 0, 4 * TW, 4 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, top, 48, 4 * TW, 2.5 * TH);
    vertex_set_point(VertexBuffer, right, bottom, 0, 0 * TW, 4 * TH);
}

vertex_set_point(VertexBuffer, right, bottom, 48, 0 * TW, 2.5 * TH);
vertex_set_point(VertexBuffer, right, top, 0, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, top, 48, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, right, top - 256, 0, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, right, top - 256, 48, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, right, bottom + 256, 0, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right, bottom + 256, 48, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, right, bottom, 0, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, right, bottom, 48, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, right, top, 48, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 8, top, 96, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, right, top - 256, 48, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, right - 8, top - 256, 96, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, right, bottom + 256, 48, 8 * TW, 2 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 8, bottom + 256, 96, 8 * TW, 0.5 * TH);
    vertex_set_point(VertexBuffer, right, bottom, 48, 0 * TW, 2 * TH);
}

vertex_set_point(VertexBuffer, right - 8, bottom, 96, 0 * TW, 0.5 * TH);
vertex_set_point(VertexBuffer, right - 8, top - 256, 96, 20 * TW, 3 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, right - 8, top - 256, 192, 20 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, right - 8, bottom + 256, 96, 0 * TW, 3 * TH);
}

vertex_set_point(VertexBuffer, right - 8, bottom + 256, 192, 0 * TW, 0 * TH);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_SLVentWall, 0));
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, spin_x(32, -32), top - 4, spin_y(32, -32), 1, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, spin_x(32, 32), top - 4, spin_y(32, 32), 1, 0);
    vertex_set_point(VertexBuffer, spin_x(-32, -32), top - 4, spin_y(-32, -32), 0, 1);
}

vertex_set_point(VertexBuffer, spin_x(-32, 32), top - 4, spin_y(-32, 32), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_BigFan, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
Frame = (Frame + 10) % 360;
