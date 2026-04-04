event_inherited();
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var _x = -24;
var _x2;

repeat (2)
{
    _x2 = 16 * sign(_x);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(0), 0, 0);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(32), 0, 0);
            vertex_set_point(VertexBuffer, fx(_x, -96), fy(_x, -96), fz(0), 0, 0);
        }
        
        vertex_set_point(VertexBuffer, fx(_x, -96), fy(_x, -96), fz(16), 0, 0);
        _x = 16 * sign(_x);
    }
    
    _x = 24 * sign(_x);
    vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(32), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(64), 0, 0);
        vertex_set_point(VertexBuffer, fx(_x, -32), fy(_x, -32), fz(24), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(_x, -8), fy(_x, -8), fz(64), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(64), 0, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(80), 0, 0);
        vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(64), 0, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(80), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x, -96), fy(_x, -96), fz(0), 1, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x, -96), fy(_x, -96), fz(16), 1, 0);
        vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(0), 0.8333333333333334, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(16), 0.8333333333333334, 0);
    vertex_set_point(VertexBuffer, fx(_x, -96), fy(_x, -96), fz(16), 1, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(32), 1, 0);
        vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(16), 0.8333333333333334, 0);
    }
    
    vertex_set_point(VertexBuffer, fx(_x2, 0), fy(_x2, 0), fz(32), 0.8333333333333334, 0);
    _x = 24;
}

_x *= -1;
vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(0), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(12), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x2 * -1, -96), fy(_x2 * -1, -96), fz(0), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x2 * -1, -96), fy(_x2 * -1, -96), fz(12), 0, 0);
vertex_set_point(VertexBuffer, fx(_x2, -96), fy(_x2, -96), fz(12), 2/3, 1);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x2, 0), fy(_x2, 0), fz(28), 2/3, 0.42857142857142855);
    vertex_set_point(VertexBuffer, fx(_x2 * -1, -96), fy(_x2 * -1, -96), fz(12), 0, 1);
}

vertex_set_point(VertexBuffer, fx(_x2 * -1, 0), fy(_x2 * -1, 0), fz(28), 0, 0.42857142857142855);
vertex_set_point(VertexBuffer, fx(_x, -24), fy(_x, -24), fz(24), 0.8333333333333334, 0.42857142857142855);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(64), 0.8333333333333334, 0);
    vertex_set_point(VertexBuffer, fx(_x * -1, -24), fy(_x * -1, -24), fz(24), 0, 0.42857142857142855);
}

vertex_set_point(VertexBuffer, fx(_x * -1, 0), fy(_x * -1, 0), fz(64), 0, 0);
vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(64), 1, 0.5714285714285714);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(80), 2/3, 0.5714285714285714);
    vertex_set_point(VertexBuffer, fx(_x * -1, -20), fy(_x * -1, -20), fz(64), 1, 1);
}

vertex_set_point(VertexBuffer, fx(_x * -1, -20), fy(_x * -1, -20), fz(80), 2/3, 1);
vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(64), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(64), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x * -1, -20), fy(_x * -1, -20), fz(64), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x * -1, 0), fy(_x * -1, 0), fz(64), 0, 0);
vertex_set_point(VertexBuffer, fx(_x, -20), fy(_x, -20), fz(80), 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(_x, 0), fy(_x, 0), fz(80), 0, 0);
    vertex_set_point(VertexBuffer, fx(_x * -1, -20), fy(_x * -1, -20), fz(80), 0, 0);
}

vertex_set_point(VertexBuffer, fx(_x * -1, 0), fy(_x * -1, 0), fz(80), 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_SkeeBall, 0));
vertex_delete_buffer(VertexBuffer);
