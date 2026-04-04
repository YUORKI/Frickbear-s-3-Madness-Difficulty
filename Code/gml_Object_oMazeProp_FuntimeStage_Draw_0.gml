depth = 2;
var AngleDiff = 360 / Sides;
var Angle = AngleDiff / -2;

while (Angle < (360 - (AngleDiff / 2)))
{
    var x1 = x + lengthdir_x(Radius, Angle);
    var y1 = y + lengthdir_y(Radius, Angle);
    var x2 = x + lengthdir_x(Radius, Angle + AngleDiff);
    var y2 = y + lengthdir_y(Radius, Angle + AngleDiff);
    var Texture = sprite_get_texture(sMazeWall_Curtain, 0);
    var Height = 128;
    Height = 32;
    var TexHeight = 1 - (Height / 128);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, Height, 0, TexHeight);
    vertex_set_point(VertexBuffer, x2, y2, 0, 1, 1);
    vertex_set_point(VertexBuffer, x1, y1, 0, 0, 1);
    vertex_set_point(VertexBuffer, x1, y1, Height, 0, TexHeight);
    vertex_set_point(VertexBuffer, x2, y2, 0, 1, 1);
    vertex_set_point(VertexBuffer, x2, y2, Height, 1, TexHeight);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    Texture = sprite_get_texture(sMazeTex_Ceiling, 0);
    vertex_set_point(VertexBuffer, x1, y1, 32, 0, 1);
    vertex_set_point(VertexBuffer, x2, y2, 32, 1, 1);
    vertex_set_point(VertexBuffer, x, y, 32, 0.5, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    Angle += AngleDiff;
}
