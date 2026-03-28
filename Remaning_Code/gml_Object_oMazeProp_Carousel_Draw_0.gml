depth = 0;
MainAngle += 1;
var AngleDiff = 360 / Sides;
var Texture = sprite_get_texture(sMazeTex_CarouselRim, 0);
var CurrentSide = 0;
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
shader_set(TransparencyShader);
var Angle = AngleDiff / -2;

while (Angle < (360 - (AngleDiff / 2)))
{
    var x1 = fx(Radius, Angle);
    var y1 = fy(Radius, Angle);
    var x2 = fx(Radius, Angle + AngleDiff);
    var y2 = fy(Radius, Angle + AngleDiff);
    var lower = 0;
    var upper = lower + 16;
    vertex_set_point(VertexBuffer, x2, y2, lower, 1, 1);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x2, y2, upper, 1, 0.6);
        vertex_set_point(VertexBuffer, x1, y1, lower, 0, 1);
    }
    
    vertex_set_point(VertexBuffer, x1, y1, upper, 0, 0.6);
    lower = upper;
    upper = lower;
    vertex_set_point(VertexBuffer, x2, y2, lower, 1, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x, y, upper, 1, 0);
        vertex_set_point(VertexBuffer, x1, y1, lower, 0, 0);
    }
    
    vertex_set_point(VertexBuffer, x, y, upper, 0, 0);
    lower = 80;
    upper = lower + 4;
    vertex_set_point(VertexBuffer, x2, y2, lower, 1, 0.6);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x2, y2, upper, 1, 0.5);
        vertex_set_point(VertexBuffer, x1, y1, lower, 0, 0.6);
    }
    
    vertex_set_point(VertexBuffer, x1, y1, upper, 0, 0.5);
    lower = upper;
    upper = lower;
    vertex_set_point(VertexBuffer, fx(Radius + 2, Angle + AngleDiff), fy(Radius + 2, Angle + AngleDiff), lower, 1, 0);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x, y, upper, 1, 0);
        vertex_set_point(VertexBuffer, fx(Radius + 2, Angle), fy(Radius + 2, Angle), lower, 0, 0);
    }
    
    vertex_set_point(VertexBuffer, x, y, upper, 0, 0);
    lower = upper;
    upper = lower + 16;
    vertex_set_point(VertexBuffer, fx(Radius + 2, Angle + AngleDiff), fy(Radius + 2, Angle + AngleDiff), lower, 1, 0.5);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x2, y2, upper, 1, 0.2);
        vertex_set_point(VertexBuffer, fx(Radius + 2, Angle), fy(Radius + 2, Angle), lower, 0, 0.5);
    }
    
    vertex_set_point(VertexBuffer, x1, y1, upper, 0, 0.2);
    lower = upper;
    upper = lower + 8;
    vertex_set_point(VertexBuffer, x2, y2, lower, 1, 0.2);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, x2, y2, upper, 1, 0);
        vertex_set_point(VertexBuffer, x1, y1, lower, 0, 0.2);
    }
    
    vertex_set_point(VertexBuffer, x1, y1, upper, 0, 0);
    var ColorTex = 0.025;
    
    if ((CurrentSide % 2) == 0)
        ColorTex += 0.025;
    
    lower = upper;
    upper = lower + 8;
    vertex_set_point(VertexBuffer, fx(Radius, Angle + AngleDiff), fy(Radius, Angle + AngleDiff), lower, 1, ColorTex + 0.025);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(Radius - 8, Angle + AngleDiff), fy(Radius - 8, Angle + AngleDiff), upper, 1, ColorTex);
        vertex_set_point(VertexBuffer, fx(Radius, Angle), fy(Radius, Angle), lower, 0, ColorTex + 0.025);
    }
    
    vertex_set_point(VertexBuffer, fx(Radius - 8, Angle), fy(Radius - 8, Angle), upper, 0, ColorTex);
    lower = upper;
    upper = lower + 8;
    vertex_set_point(VertexBuffer, fx(Radius - 8, Angle + AngleDiff), fy(Radius - 8, Angle + AngleDiff), lower, 1, ColorTex + 0.025);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(Radius - 24, Angle + AngleDiff), fy(Radius - 24, Angle + AngleDiff), upper, 1, ColorTex);
        vertex_set_point(VertexBuffer, fx(Radius - 8, Angle), fy(Radius - 8, Angle), lower, 0, ColorTex + 0.025);
    }
    
    vertex_set_point(VertexBuffer, fx(Radius - 24, Angle), fy(Radius - 24, Angle), upper, 0, ColorTex);
    lower = upper;
    upper = lower;
    vertex_set_point(VertexBuffer, fx(Radius - 24, Angle + AngleDiff), fy(Radius - 24, Angle + AngleDiff), lower, 1, ColorTex + 0.025);
    
    repeat (2)
    {
        vertex_set_point(VertexBuffer, fx(Radius - 32, Angle + AngleDiff), fy(Radius - 32, Angle + AngleDiff), upper, 1, ColorTex);
        vertex_set_point(VertexBuffer, fx(Radius - 24, Angle), fy(Radius - 24, Angle), lower, 0, ColorTex + 0.025);
    }
    
    vertex_set_point(VertexBuffer, fx(Radius - 32, Angle), fy(Radius - 32, Angle), upper, 0, ColorTex);
    CurrentSide++;
    Angle += AngleDiff;
}

vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);

for (Angle = 0; Angle < 360; Angle += 90)
{
    var Horse = sMazeTex_CarouselHorse;
    var x1 = fx(24, Angle) - lengthdir_x(sprite_get_width(Horse) / 2, (MainAngle + Angle) - 90);
    var y1 = fy(24, Angle) - lengthdir_y(sprite_get_width(Horse) / 2, (MainAngle + Angle) - 90);
    var x2 = fx(24, Angle) + lengthdir_x(sprite_get_width(Horse) / 2, (MainAngle + Angle) - 90);
    var y2 = fy(24, Angle) + lengthdir_y(sprite_get_width(Horse) / 2, (MainAngle + Angle) - 90);
    var HorseHeight = (dsin(MainAngle + Angle) * 8) + 8;
    draw_3d_sign(x1, y1, x2, y2, HorseHeight + 80, HorseHeight, sprite_get_texture(Horse, Angle / 90), 1, 1);
}

shader_reset();
