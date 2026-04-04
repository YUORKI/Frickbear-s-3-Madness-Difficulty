function fx(arg0, arg1)
{
    return round((x + (arg0 * dcos(image_angle * -1))) - (arg1 * dsin(image_angle * -1)));
}

function fy(arg0, arg1)
{
    return round(y + (arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1)));
}

function fz(arg0)
{
    return round(depth + arg0);
}

depth = 80;
var _left = -sprite_xoffset;
var _top = -sprite_yoffset;
var _right = sprite_width + _left;
var _bottom = sprite_height + _top;
var _c = dcos(image_angle);
var _s = dsin(image_angle);
var x1 = x + (_left * _c) + (_top * _s);
var y1 = y + (_left * -_s) + (_top * _c);
var x2 = x + (_right * _c) + (_top * _s);
var y2 = y + (_right * -_s) + (_top * _c);
var x4 = x + (_right * _c) + (_bottom * _s);
var y4 = y + (_right * -_s) + (_bottom * _c);
var x3 = x + (_left * _c) + (_bottom * _s);
var y3 = y + (_left * -_s) + (_bottom * _c);
var x5 = x + (_left * _c) + ((_top * _s * 2) / 8);
var y5 = y + (_left * -_s) + ((_top * _c * 2) / 8);
var x6 = x + (_right * _c) + ((_top * _s * 2) / 8);
var y6 = y + (_right * -_s) + ((_top * _c * 2) / 8);
var x7 = x + (_left * _c) + (_top * _s * 0);
var y7 = y + (_left * -_s) + (_top * _c * 0);
var x8 = x + (_right * _c) + (_top * _s * 0);
var y8 = y + (_right * -_s) + (_top * _c * 0);
var x9 = x + (_left * _c) + ((_bottom * _s * 2) / 8);
var y9 = y + (_left * -_s) + ((_bottom * _c * 2) / 8);
var x10 = x + (_right * _c) + ((_bottom * _s * 2) / 8);
var y10 = y + (_right * -_s) + ((_bottom * _c * 2) / 8);
var depth1 = 0;
var depth2 = 32;
var depth3 = 34;
var depth4 = 66;
var depth5 = 68;
var depth6 = 80;
var pw = 64;
var ph = 96;
shader_set(TransparencyShader);
var Texture = sprite_get_texture(TextureSprite, 0);
var TextureWidth = image_xscale;
var TextureHeight = image_yscale;
var zTop = depth6;
var zBottom = 0;
Texcoord1 = 0;
Texcoord2 = 0;
var TextureDepth = 1;
var TextureZero = 0;
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x2, y2, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth1, 64 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth1, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth1, 64 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth2, 64 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth2, 64 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth2, 32 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 64 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth2, 64 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth4, 0, 0);
vertex_set_point(VertexBuffer, x5, y5, depth4, 0, 0);
vertex_set_point(VertexBuffer, x6, y6, depth4, 0, 0);
vertex_set_point(VertexBuffer, x3, y3, depth4, 0, 0);
vertex_set_point(VertexBuffer, x5, y5, depth4, 0, 0);
vertex_set_point(VertexBuffer, x4, y4, depth4, 0, 0);
vertex_set_point(VertexBuffer, fx(14, 14), fy(14, 14), depth1, 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(14, 14), fy(14, 14), depth4, 0, 0);
    vertex_set_point(VertexBuffer, fx(-14, 14), fy(-14, 14), depth1, 0, 920);
}

vertex_set_point(VertexBuffer, fx(-14, 14), fy(-14, 14), depth4, 0, 0);
vertex_set_point(VertexBuffer, fx(-14, 14), fy(-14, 14), depth1, 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(-14, 14), fy(-14, 14), depth4, 0, 0);
    vertex_set_point(VertexBuffer, x5, y5, depth3, 0, 0);
}

vertex_set_point(VertexBuffer, x7, y7, depth4, 0, 0);
vertex_set_point(VertexBuffer, fx(14, 14), fy(14, 14), depth1, 0, 0);

repeat (2)
{
    vertex_set_point(VertexBuffer, fx(14, 14), fy(14, 14), depth4, 0, 0);
    vertex_set_point(VertexBuffer, x6, y6, depth3, 0, 0);
}

vertex_set_point(VertexBuffer, x8, y8, depth4, 0, 0);
vertex_set_point(VertexBuffer, x8, y8, depth4, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 64 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth4, 64 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 64 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth4, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 0 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth4, 32 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth4, 0 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth4, 32 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 0 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth6, 32 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 64 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth6, 32 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 64 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth6, 64 / pw, 0 / ph);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x3, y3, depth6, 0 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth1, 4 / pw, 96 / ph);
vertex_set_point(VertexBuffer, x3, y3, depth1, 0 / pw, TextureDepth);
vertex_set_point(VertexBuffer, x3, y3, depth6, 0 / pw, 92 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth1, 4 / pw, 96 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth6, 4 / pw, 92 / ph);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x4, y4, depth6, 0 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth1, 0 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x4, y4, depth6, 0 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth5, 16 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth6, 32 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth5, 16 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth4, 16 / pw, 14 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth4, 16 / pw, 14 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth2, 16 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x6, y6, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth2, 16 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth1, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x2, y2, depth1, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x8, y8, depth2, 16 / pw, 48 / ph);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x3, y3, depth6, 0 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x3, y3, depth1, 0 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x3, y3, depth6, 0 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth5, 16 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth6, 32 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth6, 16 / pw, 0 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth5, 16 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth5, 32 / pw, 12 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth4, 16 / pw, 14 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth4, 16 / pw, 14 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth2, 16 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth3, 16 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth3, 20 / pw, 46 / ph);
vertex_set_point(VertexBuffer, x5, y5, depth2, 20 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth2, 16 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth1, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth1, 16 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth2, 32 / pw, 48 / ph);
vertex_set_point(VertexBuffer, x1, y1, depth1, 32 / pw, 80 / ph);
vertex_set_point(VertexBuffer, x7, y7, depth2, 16 / pw, 48 / ph);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
var ScreenFrame = (floor(Frame / 30) + 1) * Playable;
vertex_set_point(VertexBuffer, x4, y4, depth3 + 20, 0, 0);
vertex_set_point(VertexBuffer, x5, y5, depth3, 1, 1);
vertex_set_point(VertexBuffer, x6, y6, depth3, 0, 1);
vertex_set_point(VertexBuffer, x3, y3, depth3 + 20, 1, 0);
vertex_set_point(VertexBuffer, x5, y5, depth3, 1, 1);
vertex_set_point(VertexBuffer, x4, y4, depth3 + 20, 0, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, sprite_get_texture(sMazeTex_ArcadeScreen, ScreenFrame));
vertex_delete_buffer(VertexBuffer);
shader_reset();
draw_self();
Frame = (Frame + 1) % 60;
