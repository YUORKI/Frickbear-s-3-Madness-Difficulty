Sprite = sMaze_Endo;
Height = 0;
var VisualAngle = point_direction(x, y, oCamera3DMaze.x, oCamera3DMaze.y) + 90;
image_xscale = 1;
var x1 = x - lengthdir_x(48, VisualAngle);
var y1 = y - lengthdir_y(48, VisualAngle);
var x2 = x + lengthdir_x(48, VisualAngle);
var y2 = y + lengthdir_y(48, VisualAngle);
var RelativeDirection = ((Direction - VisualAngle) + 3600) % 360;
var TexX = (0.2 * floor((AnimFrame % 60) / 15)) + 0.2;

if (Mode == "Pause")
    TexX = 0;

var TexY = (0.25 * round(RelativeDirection / 90)) + 0.25;
var TextureWidth = TexX + 0.2;
var TextureHeight = TexY + 0.25;
var Texture = sprite_get_texture(Sprite, 0);
shader_set(TransparencyShader);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x1, y1, Height + 128, TexX, TexY);
vertex_set_point(VertexBuffer, x2, y2, Height, TextureWidth, TextureHeight);
vertex_set_point(VertexBuffer, x1, y1, Height, TexX, TextureHeight);
vertex_set_point(VertexBuffer, x1, y1, Height + 128, TexX, TexY);
vertex_set_point(VertexBuffer, x2, y2, Height, TextureWidth, TextureHeight);
vertex_set_point(VertexBuffer, x2, y2, Height + 128, TextureWidth, TexY);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
shader_reset();
show_debug_message(AnimFrame);
