event_inherited();

function ax(arg0, arg1, arg2)
{
    return round(x + (arg0 * dcos(arg2)) + (arg1 * dsin(arg2)));
}

function ay(arg0, arg1, arg2)
{
    return round(y + (arg1 * dcos(arg2)) + (arg0 * dsin(arg2)));
}

function az(arg0)
{
    return round(depth + arg0);
}

var angle = -90;
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var SlideBottom = 56;

for (var spiral = 0; spiral < 180; spiral += 30)
{
    for (var degree = -30; degree < 210; degree += 30)
    {
        var next_degree = degree + 30;
        var next_spiral = spiral + 30;
        var outer_x1 = 16 + lengthdir_x(16, degree);
        var outer_y1 = lengthdir_y(16, degree);
        var outer_x2 = 16 + lengthdir_x(16, next_degree);
        var outer_y2 = lengthdir_y(16, next_degree);
        var inner_x1 = 16 + lengthdir_x(12, degree);
        var inner_y1 = lengthdir_y(12, degree);
        var inner_x2 = 16 + lengthdir_x(12, next_degree);
        var inner_y2 = lengthdir_y(12, next_degree);
        var lower = ((spiral / 30) * 8) + SlideBottom;
        var higher = ((next_spiral / 30) * 8) + SlideBottom;
        
        if (spiral == 0)
        {
            vertex_set_point(VertexBuffer, ax(outer_x2, -32, spiral), ay(outer_x2, -32, spiral), az((outer_y2 + SlideBottom) - 8), 1, 1);
            
            repeat (2)
            {
                vertex_set_point(VertexBuffer, ax(outer_x1, -32, spiral), ay(outer_x1, -32, spiral), fz((outer_y1 + SlideBottom) - 8), 1, 0);
                vertex_set_point(VertexBuffer, ax(outer_x2, 0, spiral), ay(outer_x2, 0, spiral), fz(outer_y2 + SlideBottom), 0, 1);
            }
            
            vertex_set_point(VertexBuffer, ax(outer_x1, 0, spiral), ay(outer_x1, 0, spiral), fz(outer_y1 + SlideBottom), 0, 0);
            vertex_set_point(VertexBuffer, ax(inner_x2, -32, spiral), ay(inner_x2, -32, spiral), az((inner_y2 + SlideBottom) - 8), 1, 1);
            
            repeat (2)
            {
                vertex_set_point(VertexBuffer, ax(inner_x1, -32, spiral), ay(inner_x1, -32, spiral), fz((inner_y1 + SlideBottom) - 8), 1, 0);
                vertex_set_point(VertexBuffer, ax(inner_x2, 0, spiral), ay(inner_x2, 0, spiral), fz(inner_y2 + SlideBottom), 0, 1);
            }
            
            vertex_set_point(VertexBuffer, ax(inner_x1, 0, spiral), ay(inner_x1, 0, spiral), fz(inner_y1 + SlideBottom), 0, 0);
            vertex_set_point(VertexBuffer, ax(inner_x2, -32, spiral), ay(inner_x2, -32, spiral), az((inner_y2 + SlideBottom) - 8), 0, 0);
            
            repeat (2)
            {
                vertex_set_point(VertexBuffer, ax(inner_x1, -32, spiral), ay(inner_x1, -32, spiral), fz((inner_y1 + SlideBottom) - 8), 0, 0);
                vertex_set_point(VertexBuffer, ax(outer_x2, -32, spiral), ay(outer_x2, -32, spiral), fz((outer_y2 + SlideBottom) - 8), 0, 0);
            }
            
            vertex_set_point(VertexBuffer, ax(outer_x1, -32, spiral), ay(outer_x1, -32, spiral), fz((outer_y1 + SlideBottom) - 8), 0, 0);
            
            if (degree == -30)
            {
                vertex_set_point(VertexBuffer, ax(outer_x1, -32, spiral), ay(outer_x1, -32, spiral), az((outer_y1 + SlideBottom) - 8), 0, 0);
                
                repeat (2)
                {
                    vertex_set_point(VertexBuffer, ax(inner_x1, -32, spiral), ay(inner_x1, -32, spiral), fz((inner_y1 + SlideBottom) - 8), 0, 0);
                    vertex_set_point(VertexBuffer, ax(outer_x1, 0, spiral), ay(outer_x1, 0, spiral), fz(outer_y1 + SlideBottom), 0, 0);
                }
                
                vertex_set_point(VertexBuffer, ax(inner_x1, 0, spiral), ay(inner_x1, 0, spiral), fz(inner_y1 + SlideBottom), 0, 0);
            }
            
            if (degree == 180)
            {
                vertex_set_point(VertexBuffer, ax(outer_x2, -32, spiral), ay(outer_x2, -32, spiral), az((outer_y2 + SlideBottom) - 8), 0, 0);
                
                repeat (2)
                {
                    vertex_set_point(VertexBuffer, ax(inner_x2, -32, spiral), ay(inner_x2, -32, spiral), fz((inner_y2 + SlideBottom) - 8), 0, 0);
                    vertex_set_point(VertexBuffer, ax(outer_x2, 0, spiral), ay(outer_x2, 0, spiral), fz(outer_y2 + SlideBottom), 0, 0);
                }
                
                vertex_set_point(VertexBuffer, ax(inner_x2, 0, spiral), ay(inner_x2, 0, spiral), fz(inner_y2 + SlideBottom), 0, 0);
            }
        }
        
        vertex_set_point(VertexBuffer, ax(outer_x2, 0, spiral), ay(outer_x2, 0, spiral), az(outer_y2 + lower), 1, 1);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, ax(outer_x1, 0, spiral), ay(outer_x1, 0, spiral), fz(outer_y1 + lower), 1, 0);
            vertex_set_point(VertexBuffer, ax(outer_x2, 0, next_spiral), ay(outer_x2, 0, next_spiral), fz(outer_y2 + higher), 0, 1);
        }
        
        vertex_set_point(VertexBuffer, ax(outer_x1, 0, next_spiral), ay(outer_x1, 0, next_spiral), fz(outer_y1 + higher), 0, 0);
        vertex_set_point(VertexBuffer, ax(inner_x2, 0, spiral), ay(inner_x2, 0, spiral), az(inner_y2 + lower), 1, 1);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, ax(inner_x1, 0, spiral), ay(inner_x1, 0, spiral), fz(inner_y1 + lower), 1, 0);
            vertex_set_point(VertexBuffer, ax(inner_x2, 0, next_spiral), ay(inner_x2, 0, next_spiral), fz(inner_y2 + higher), 0, 1);
        }
        
        vertex_set_point(VertexBuffer, ax(inner_x1, 0, next_spiral), ay(inner_x1, 0, next_spiral), fz(inner_y1 + higher), 0, 0);
        
        if (degree == -30)
        {
            vertex_set_point(VertexBuffer, ax(outer_x1, 0, spiral), ay(outer_x1, 0, spiral), az(outer_y1 + lower), 0, 0);
            
            repeat (2)
            {
                vertex_set_point(VertexBuffer, ax(inner_x1, 0, spiral), ay(inner_x1, 0, spiral), fz(inner_y1 + lower), 0, 0);
                vertex_set_point(VertexBuffer, ax(outer_x1, 0, next_spiral), ay(outer_x1, 0, next_spiral), fz(outer_y1 + higher), 0, 0);
            }
            
            vertex_set_point(VertexBuffer, ax(inner_x1, 0, next_spiral), ay(inner_x1, 0, next_spiral), fz(inner_y1 + higher), 0, 0);
        }
        
        if (degree == 180)
        {
            vertex_set_point(VertexBuffer, ax(outer_x2, 0, spiral), ay(outer_x2, 0, spiral), az(outer_y2 + lower), 0, 0);
            
            repeat (2)
            {
                vertex_set_point(VertexBuffer, ax(inner_x2, 0, spiral), ay(inner_x2, 0, spiral), fz(inner_y2 + lower), 0, 0);
                vertex_set_point(VertexBuffer, ax(outer_x2, 0, next_spiral), ay(outer_x2, 0, next_spiral), fz(outer_y2 + higher), 0, 0);
            }
            
            vertex_set_point(VertexBuffer, ax(inner_x2, 0, next_spiral), ay(inner_x2, 0, next_spiral), fz(inner_y2 + higher), 0, 0);
        }
    }
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Slide, 0));
vertex_delete_buffer(VertexBuffer);
