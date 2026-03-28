depth = 2;
shader_set(TransparencyShader);
var AngleDiff = 360 / Sides;
var Angle = AngleDiff / -2;

while (Angle < (360 - (AngleDiff / 2)))
{
    var x1 = x + lengthdir_x(Radius, Angle);
    var y1 = y + lengthdir_y(Radius, Angle);
    var x2 = x + lengthdir_x(Radius, Angle + AngleDiff);
    var y2 = y + lengthdir_y(Radius, Angle + AngleDiff);
    var Texture = sprite_get_texture(sMazeTex_Elevator, 0);
    var Height = 96;
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    var TexXStart = (Angle + image_angle) / AngleDiff / Sides;
    var TexXEnd = (1 + ((Angle + image_angle) / AngleDiff)) / Sides;
    vertex_set_point(VertexBuffer, x1, y1, Height, TexXStart, 0.25);
    vertex_set_point(VertexBuffer, x2, y2, 0, TexXEnd, 1);
    vertex_set_point(VertexBuffer, x1, y1, 0, TexXStart, 1);
    vertex_set_point(VertexBuffer, x1, y1, Height, TexXStart, 0.25);
    vertex_set_point(VertexBuffer, x2, y2, 0, TexXEnd, 1);
    vertex_set_point(VertexBuffer, x2, y2, Height, TexXEnd, 0.25);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    var x3 = x + lengthdir_x(Radius - 32, Angle);
    var y3 = y + lengthdir_y(Radius - 32, Angle);
    var x4 = x + lengthdir_x(Radius - 32, Angle + AngleDiff);
    var y4 = y + lengthdir_y(Radius - 32, Angle + AngleDiff);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    Texture = sprite_get_texture(sMazeTex_Elevator, 0);
    vertex_set_point(VertexBuffer, x1, y1, 96, 0, 0);
    vertex_set_point(VertexBuffer, x4, y4, 96, 0.0625, 0.25);
    vertex_set_point(VertexBuffer, x3, y3, 96, 0, 0.25);
    vertex_set_point(VertexBuffer, x1, y1, 96, 0, 0);
    vertex_set_point(VertexBuffer, x4, y4, 96, 0.0625, 0.25);
    vertex_set_point(VertexBuffer, x2, y2, 96, 0.0625, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    Angle += AngleDiff;
}

shader_reset();
