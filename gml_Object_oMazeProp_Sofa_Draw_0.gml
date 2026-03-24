depth = Height;
var top = -24;
var left = -56;
var right = 56;
var bottom = 24;
var upper = 32;
var lower = 0;
var TW = 0.05;
var TH = 0.0625;
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
top = -24;
left = -48;
right = 48;
bottom = -24;
upper = 24;
lower = 0;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 13 * TW, 7 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 13 * TW, 4 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1 * TW, 7 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 1 * TW, 4 * TH);
top = 24;
left = -48;
right = 48;
bottom = 24;
upper = 56;
lower = 0;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 13 * TW, 14 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 13 * TW, 7 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1 * TW, 14 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 1 * TW, 7 * TH);
top = -24;
left = -48;
right = 48;
bottom = 8;
upper = 24;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 13 * TW, 4 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 13 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 1 * TW, 4 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 1 * TW, 0 * TH);
top = 8;
left = -48;
right = 48;
bottom = 8;
upper = 56;
lower = 24;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 13 * TW, 4 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 13 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 1 * TW, 4 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 1 * TW, 0 * TH);
top = 8;
left = -48;
right = 48;
bottom = 24;
upper = 56;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 1 * TW, 1 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1 * TW, 0 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0 * TW, 1 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0 * TW, 0 * TH);
top = 8;
left = -48;
right = 48;
bottom = 24;
lower = 40;
upper = 56;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 16 * TW, 2 * TH);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 16 * TW, 0 * TH);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 14 * TW, 2 * TH);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 14 * TW, 0 * TH);
    left = 48;
}

top = -24;
left = -56;
right = -48;
bottom = 24;
upper = 40;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 15 * TW, 13 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 15 * TW, 7 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 14 * TW, 13 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 14 * TW, 7 * TH);
right = -56;
lower = 0;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 20 * TW, 7 * TH);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 20 * TW, 2 * TH);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 14 * TW, 7 * TH);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 14 * TW, 2 * TH);
    left += 8;
    right += 8;
}

left = -56;
right = -48;
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 1 * TW, 7 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 1 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0 * TW, 7 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0 * TW, 2 * TH);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 1 * TW, 14 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 1 * TW, 9 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0 * TW, 14 * TH);
}

vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0 * TW, 9 * TH);
top = -24;
left = 48;
right = 56;
bottom = 24;
upper = 40;
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 15 * TW, 13 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 15 * TW, 7 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 14 * TW, 13 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 14 * TW, 7 * TH);
left = 48;
lower = 0;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 20 * TW, 7 * TH);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 20 * TW, 2 * TH);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 14 * TW, 7 * TH);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 14 * TW, 2 * TH);
    left += 8;
    right += 8;
}

left = 48;
right = 56;
vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 14 * TW, 7 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 14 * TW, 2 * TH);
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 13 * TW, 7 * TH);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 13 * TW, 2 * TH);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 14 * TW, 14 * TH);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 14 * TW, 9 * TH);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 13 * TW, 14 * TH);
}

vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 13 * TW, 9 * TH);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_Sofa, 0));
vertex_delete_buffer(VertexBuffer);
shader_reset();
