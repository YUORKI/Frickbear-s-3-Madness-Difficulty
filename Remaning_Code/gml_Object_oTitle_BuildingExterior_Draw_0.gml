event_inherited();

function fx(arg0, arg1)
{
    return round((x + (arg0 * image_xscale * dcos(image_angle * -1))) - (arg1 * image_yscale * dsin(image_angle * -1)));
}

function fy(arg0, arg1)
{
    return round(y + (arg1 * image_yscale * dcos(image_angle * -1)) + (arg0 * image_xscale * dsin(image_angle * -1)));
}

function fz(arg0)
{
    return round(depth + (arg0 * image_xscale));
}

function draw_plane(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    
    if (arg1 == arg3)
    {
        vertex_set_point(VertexBuffer, fx(arg2, arg1), fy(arg2, arg1), fz(arg4), arg8, arg9);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, fx(arg2, arg1), fy(arg2, arg1), fz(arg5), arg8, arg7);
            vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg4), arg6, arg9);
        }
        
        vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg5), arg6, arg7);
    }
    else if (arg0 == arg2)
    {
        vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg4), arg8, arg9);
        
        repeat (2)
        {
            vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg5), arg8, arg7);
            vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg4), arg6, arg9);
        }
        
        vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg5), arg6, arg7);
    }
    
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Exterior, global.FredbearMode));
    vertex_delete_buffer(VertexBuffer);
}

function draw_pillar(arg0, arg1, arg2, arg3, arg4, arg5)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg4), 1, 0.6818181818181818);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg5), 1, 0.3181818181818182);
        vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg4), 0.8666666666666667, 0.6818181818181818);
    }
    
    vertex_set_point(VertexBuffer, fx(arg0, arg1), fy(arg0, arg1), fz(arg5), 0.8666666666666667, 0.3181818181818182);
    vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg4), 1, 0.6818181818181818);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(arg0, arg3), fy(arg0, arg3), fz(arg5), 1, 0.3181818181818182);
        vertex_set_point(VertexBuffer, fx(arg2, arg3), fy(arg2, arg3), fz(arg4), 0.8666666666666667, 0.6818181818181818);
    }
    
    vertex_set_point(VertexBuffer, fx(arg2, arg3), fy(arg2, arg3), fz(arg5), 0.8666666666666667, 0.3181818181818182);
    vertex_set_point(VertexBuffer, fx(arg2, arg1), fy(arg2, arg1), fz(arg4), 1, 0.6818181818181818);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(arg2, arg1), fy(arg2, arg1), fz(arg5), 1, 0.3181818181818182);
        vertex_set_point(VertexBuffer, fx(arg2, arg3), fy(arg2, arg3), fz(arg4), 0.8666666666666667, 0.6818181818181818);
    }
    
    vertex_set_point(VertexBuffer, fx(arg2, arg3), fy(arg2, arg3), fz(arg5), 0.8666666666666667, 0.3181818181818182);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sTitleTex_Exterior, global.FredbearMode));
    vertex_delete_buffer(VertexBuffer);
}

draw_pillar(0, 0, 2, 2, 0, 8);
draw_pillar(0, 28, 2, 30, 0, 8);
draw_pillar(45, 0, 47, 2, 0, 8);
draw_pillar(45, 28, 47, 30, 0, 8);
draw_pillar(15, 28, 17, 30, 0, 9);
draw_pillar(30, 28, 32, 30, 0, 9);
var TexTilesX = 15;
var TexTilesY = 22;
draw_plane(2, 29, 15, 29, 0, 7, 0 / TexTilesX, 7 / TexTilesY, 13 / TexTilesX, 14 / TexTilesY);
draw_plane(32, 29, 45, 29, 0, 7, 0 / TexTilesX, 7 / TexTilesY, 13 / TexTilesX, 14 / TexTilesY);
draw_plane(1, 2, 1, 28, 0, 7, 0 / TexTilesX, 7 / TexTilesY, 13 / TexTilesX, 14 / TexTilesY);
draw_plane(46, 2, 46, 28, 0, 7, 0 / TexTilesX, 7 / TexTilesY, 13 / TexTilesX, 14 / TexTilesY);
draw_plane(17, 29, 30, 29, 0, 8, 0 / TexTilesX, 14 / TexTilesY, 13 / TexTilesX, 22 / TexTilesY);
draw_plane(15, 29, 32, 29, 8, 16, 0 / TexTilesX, 0 / TexTilesY, 15 / TexTilesX, 7 / TexTilesY);
draw_self();
