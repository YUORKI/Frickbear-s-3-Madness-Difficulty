depth = Height;
shader_set(TransparencyShader);
var TextureWidth = image_xscale;
var TextureHeight = image_yscale;
var zTop = depth;
var zBottom = 0;
Texcoord1 = 0;
Texcoord2 = 0;
var TextureDepth = 1;
var TextureTip = 1 - (Height / 128);

if (Texture != undefined)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x2, y2, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureWidth, TextureDepth);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, 0, TextureDepth);
    vertex_set_point(VertexBuffer, x2, y2, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureWidth, TextureDepth);
    vertex_set_point(VertexBuffer, x1, y1, zTop, TextureWidth, TextureTip);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
}

if (Texture != undefined)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x4, y4, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureHeight, TextureDepth);
    vertex_set_point(VertexBuffer, x4, y4, zBottom, 0, TextureDepth);
    vertex_set_point(VertexBuffer, x4, y4, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureHeight, TextureDepth);
    vertex_set_point(VertexBuffer, x2, y2, zTop, TextureHeight, TextureTip);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
}

if (Texture != undefined)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x4, y4, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x3, y3, zBottom, TextureWidth, TextureDepth);
    vertex_set_point(VertexBuffer, x4, y4, zBottom, 0, TextureDepth);
    vertex_set_point(VertexBuffer, x4, y4, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x3, y3, zBottom, TextureWidth, TextureDepth);
    vertex_set_point(VertexBuffer, x3, y3, zTop, TextureWidth, TextureTip);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
}

if (Texture != undefined)
{
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x3, y3, zBottom, TextureHeight, TextureDepth);
    vertex_set_point(VertexBuffer, x1, y1, zBottom, 0, TextureDepth);
    vertex_set_point(VertexBuffer, x1, y1, zTop, 0, TextureTip);
    vertex_set_point(VertexBuffer, x3, y3, zBottom, TextureHeight, TextureDepth);
    vertex_set_point(VertexBuffer, x3, y3, zTop, TextureHeight, TextureTip);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
}

shader_reset();
draw_self();
