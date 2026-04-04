var ScaleSize = 0.5;
var Angle = 0;
var _x = oCamera.x + lengthdir_y(128, Angle + 180);
var _y = oCamera.y + lengthdir_x(128, Angle + 180);
var x1 = _x + (128 * dcos(Angle) * ScaleSize);
var y1 = _y + (128 * dsin(Angle) * ScaleSize);
var x2 = _x - (128 * dcos(Angle) * ScaleSize);
var y2 = _y - (128 * dsin(Angle) * ScaleSize);
var zTop = (256 + (256 * ScaleSize)) - YOffset;
var zBottom = 256 - (256 * ScaleSize) - YOffset;
var TextureX = 0;
var TextureWidth = 1;
var Texture = sprite_get_texture(sJJOffice, 0);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureX, 1);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x2, y2, zTop, TextureWidth, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
shader_reset();

if (Mode != "InOffice")
{
    YOffset += ((YOffset + 1) / 4);
    YOffset = min(YOffset, 512);
}
else
{
    YOffset += ((0 - YOffset) / 8);
}
