event_inherited();
var Texture = sprite_get_texture(sTitleTex_Archway, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var inner_x1 = -32;
var inner_y1 = 0;
var inner_x2 = inner_x1;
var inner_y2 = 64;
var outer_x1 = -48;
var outer_y1 = inner_y1;
var outer_x2 = outer_x1;
var outer_y2 = inner_y2;

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(inner_x2, 12), fy(inner_x2, 12), fz(inner_y2), 4, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, 12), fy(outer_x2, 12), fz(outer_y2), 4, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, 12), fy(inner_x1, 12), fz(inner_y1), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x1, 12), fy(outer_x1, 12), fz(outer_y1), 0, 0);
    vertex_set_point(VertexBuffer, fx(inner_x2, -12), fy(inner_x2, -12), fz(inner_y2), 4, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, -12), fy(outer_x2, -12), fz(outer_y2), 4, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, -12), fy(inner_x1, -12), fz(inner_y1), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x1, -12), fy(outer_x1, -12), fz(outer_y1), 0, 0);
    vertex_set_point(VertexBuffer, fx(inner_x1, -12), fy(inner_x1, -12), fz(inner_y1), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(inner_x2, -12), fy(inner_x2, -12), fz(inner_y2), 0, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, 12), fy(inner_x1, 12), fz(inner_y1), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(inner_x2, 12), fy(inner_x2, 12), fz(inner_y2), 0, 0);
    vertex_set_point(VertexBuffer, fx(outer_x1, -12), fy(outer_x1, -12), fz(outer_y1), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, -12), fy(outer_x2, -12), fz(outer_y2), 0, 0);
        vertex_set_point(VertexBuffer, fx(outer_x1, 12), fy(outer_x1, 12), fz(outer_y1), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x2, 12), fy(outer_x2, 12), fz(outer_y2), 0, 0);
    inner_x1 *= -1;
    inner_x2 *= -1;
    outer_x1 *= -1;
    outer_x2 *= -1;
}

var DegreeIncrease = 20;

for (var degree = 0; degree < 180; degree += DegreeIncrease)
{
    var next_degree = degree + DegreeIncrease;
    inner_x1 = lengthdir_x(32, degree);
    inner_y1 = lengthdir_y(-32, degree) + 64;
    inner_x2 = lengthdir_x(32, next_degree);
    inner_y2 = lengthdir_y(-32, next_degree) + 64;
    outer_x1 = lengthdir_x(48, degree);
    outer_y1 = lengthdir_y(-48, degree) + 64;
    outer_x2 = lengthdir_x(48, next_degree);
    outer_y2 = lengthdir_y(-48, next_degree) + 64;
    vertex_set_point(VertexBuffer, fx(inner_x2, 12), fy(inner_x2, 12), fz(inner_y2), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, 12), fy(outer_x2, 12), fz(outer_y2), 1, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, 12), fy(inner_x1, 12), fz(inner_y1), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x1, 12), fy(outer_x1, 12), fz(outer_y1), 0, 0);
    vertex_set_point(VertexBuffer, fx(inner_x2, -12), fy(inner_x2, -12), fz(inner_y2), 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, -12), fy(outer_x2, -12), fz(outer_y2), 1, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, -12), fy(inner_x1, -12), fz(inner_y1), 0, 1);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x1, -12), fy(outer_x1, -12), fz(outer_y1), 0, 0);
    vertex_set_point(VertexBuffer, fx(inner_x1, -12), fy(inner_x1, -12), fz(inner_y1), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(inner_x2, -12), fy(inner_x2, -12), fz(inner_y2), 0, 0);
        vertex_set_point(VertexBuffer, fx(inner_x1, 12), fy(inner_x1, 12), fz(inner_y1), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(inner_x2, 12), fy(inner_x2, 12), fz(inner_y2), 0, 0);
    vertex_set_point(VertexBuffer, fx(outer_x1, -12), fy(outer_x1, -12), fz(outer_y1), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(outer_x2, -12), fy(outer_x2, -12), fz(outer_y2), 0, 0);
        vertex_set_point(VertexBuffer, fx(outer_x1, 12), fy(outer_x1, 12), fz(outer_y1), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(outer_x2, 12), fy(outer_x2, 12), fz(outer_y2), 0, 0);
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
