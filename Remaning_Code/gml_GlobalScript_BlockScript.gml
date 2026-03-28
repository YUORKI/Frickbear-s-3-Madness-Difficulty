vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();
global.VertexFormat = vertex_format_end();
global.WallColor = 16777215;

function vertex_set_point(arg0, arg1, arg2, arg3, arg4, arg5)
{
    vertex_position_3d(arg0, arg1, arg2, arg3);
    vertex_texcoord(arg0, arg4, arg5);
    vertex_color(arg0, c_white, 1);
}

function draw_3d_square(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15)
{
    Texcoord1 = 0;
    Texcoord2 = 0;
    var TextureDepth = 1;
    var TextureZero = 0;
    var Texture = sprite_get_texture(sOfficeWallBase, 0);
    global.WallColor = -1;
    Texture = arg12;
    
    if (Texture != undefined)
    {
        VertexBuffer = vertex_create_buffer();
        vertex_begin(VertexBuffer, global.VertexFormat);
        vertex_set_point(VertexBuffer, arg2, arg3, arg8, TextureZero, TextureZero);
        vertex_set_point(VertexBuffer, arg0, arg1, arg9, arg10, TextureDepth);
        vertex_set_point(VertexBuffer, arg2, arg3, arg9, TextureZero, TextureDepth);
        vertex_set_point(VertexBuffer, arg2, arg3, arg8, TextureZero, TextureZero);
        vertex_set_point(VertexBuffer, arg0, arg1, arg9, arg10, TextureDepth);
        vertex_set_point(VertexBuffer, arg0, arg1, arg8, arg10, TextureZero);
        vertex_end(VertexBuffer);
        vertex_submit(VertexBuffer, pr_trianglelist, Texture);
        vertex_delete_buffer(VertexBuffer);
    }
    
    Texture = arg13;
    
    if (Texture != undefined)
    {
        VertexBuffer = vertex_create_buffer();
        vertex_begin(VertexBuffer, global.VertexFormat);
        vertex_set_point(VertexBuffer, arg6, arg7, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg2, arg3, arg9, arg11, TextureDepth);
        vertex_set_point(VertexBuffer, arg6, arg7, arg9, 0, TextureDepth);
        vertex_set_point(VertexBuffer, arg6, arg7, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg2, arg3, arg9, arg11, TextureDepth);
        vertex_set_point(VertexBuffer, arg2, arg3, arg8, arg11, 0);
        vertex_end(VertexBuffer);
        vertex_submit(VertexBuffer, pr_trianglelist, Texture);
        vertex_delete_buffer(VertexBuffer);
    }
    
    Texture = arg14;
    
    if (Texture != undefined)
    {
        VertexBuffer = vertex_create_buffer();
        vertex_begin(VertexBuffer, global.VertexFormat);
        vertex_set_point(VertexBuffer, arg6, arg7, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg4, arg5, arg9, arg10, TextureDepth);
        vertex_set_point(VertexBuffer, arg6, arg7, arg9, 0, TextureDepth);
        vertex_set_point(VertexBuffer, arg6, arg7, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg4, arg5, arg9, arg10, TextureDepth);
        vertex_set_point(VertexBuffer, arg4, arg5, arg8, arg10, 0);
        vertex_end(VertexBuffer);
        vertex_submit(VertexBuffer, pr_trianglelist, Texture);
        vertex_delete_buffer(VertexBuffer);
    }
    
    Texture = arg15;
    
    if (Texture != undefined)
    {
        VertexBuffer = vertex_create_buffer();
        vertex_begin(VertexBuffer, global.VertexFormat);
        vertex_set_point(VertexBuffer, arg0, arg1, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg4, arg5, arg9, arg11, TextureDepth);
        vertex_set_point(VertexBuffer, arg0, arg1, arg9, 0, TextureDepth);
        vertex_set_point(VertexBuffer, arg0, arg1, arg8, 0, 0);
        vertex_set_point(VertexBuffer, arg4, arg5, arg9, arg11, TextureDepth);
        vertex_set_point(VertexBuffer, arg4, arg5, arg8, arg11, 0);
        vertex_end(VertexBuffer);
        vertex_submit(VertexBuffer, pr_trianglelist, Texture);
        vertex_delete_buffer(VertexBuffer);
    }
}

function draw_3d_sign(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, arg0, arg1, arg4, 0, 0);
    vertex_set_point(VertexBuffer, arg2, arg3, arg5, arg7, 1);
    vertex_set_point(VertexBuffer, arg0, arg1, arg5, 0, 1);
    vertex_set_point(VertexBuffer, arg0, arg1, arg4, 0, 0);
    vertex_set_point(VertexBuffer, arg2, arg3, arg5, arg7, 1);
    vertex_set_point(VertexBuffer, arg2, arg3, arg4, arg7, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, arg6);
    vertex_delete_buffer(VertexBuffer);
}
