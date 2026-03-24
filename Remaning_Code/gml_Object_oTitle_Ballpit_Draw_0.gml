event_inherited();
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var ObjectWidth = 16 * image_xscale;
var ObjectHeight = 16 * image_yscale;
var left = -1 * ObjectWidth;
var top = -1 * ObjectHeight;
var right = ObjectWidth;
var bottom = ObjectHeight;
var upper = 32;
var lower = 0;
vertex_set_point(VertexBuffer, fx(right, top + 8), fy(right, top + 8), fz(upper), 0.5, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0.5, 0);
    vertex_set_point(VertexBuffer, fx(left, top + 8), fy(left, top + 8), fz(upper), 0.5, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0.5, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.5, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0.5, 0);
    vertex_set_point(VertexBuffer, fx(right - 8, bottom), fy(right - 8, bottom), fz(upper), 0.5, 0);
}

vertex_set_point(VertexBuffer, fx(right - 8, top), fy(right - 8, top), fz(upper), 0.5, 0);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0.5, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, bottom - 8), fy(right, bottom - 8), fz(upper), 0.5, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0.5, 0);
}

vertex_set_point(VertexBuffer, fx(left, bottom - 8), fy(left, bottom - 8), fz(upper), 0.5, 0);
vertex_set_point(VertexBuffer, fx(left + 8, bottom), fy(left + 8, bottom), fz(upper), 0.5, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(left + 8, top), fy(left + 8, top), fz(upper), 0.5, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0.5, 0);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0.5, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
        vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(lower), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(lower), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper), 0, 0);
        vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(lower), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper), 0, 0);
        vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(lower), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper), 0, 0);
    top += 8;
    bottom -= 8;
    left += 8;
    right -= 8;
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Slide, 0));
vertex_delete_buffer(VertexBuffer);
top -= 8;
bottom += 8;
left -= 8;
right += 8;
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, fx(right, bottom), fy(right, bottom), fz(upper - 8), image_xscale, image_yscale);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(right, top), fy(right, top), fz(upper - 8), image_xscale, 0);
    vertex_set_point(VertexBuffer, fx(left, bottom), fy(left, bottom), fz(upper - 8), 0, image_yscale);
}

vertex_set_point(VertexBuffer, fx(left, top), fy(left, top), fz(upper - 8), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_BALLS, 0));
vertex_delete_buffer(VertexBuffer);
