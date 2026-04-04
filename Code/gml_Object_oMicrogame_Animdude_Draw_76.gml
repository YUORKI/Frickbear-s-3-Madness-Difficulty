if (!surface_exists(AnimdudeSurf))
    AnimdudeSurf = surface_create(320, 160);

surface_set_target(AnimdudeSurf);
draw_clear_alpha(c_black, 0);
draw_set_alpha(0.75);
draw_rectangle_color(0, 0, 320, 160, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (Completed)
{
    surface_reset_target();
    exit;
}

for (var i = 0; i < 10; i++)
    draw_sprite(sAnimdude_Lava, min(Level, 1), 32 * i, 128);

with (oAnimdude_Object)
{
    draw_self();
    
    if (object_index == oAnimdude_FakeFloor)
    {
        draw_sprite(sAnimdude_Floor, 0, x + 32, y + 32 + FloorOffset);
        draw_sprite(sAnimdude_Floor, 0, x + 64, y + 32 + FloorOffset);
    }
    
    if (object_index == oAnimdude_Dragon)
    {
        draw_sprite(sAnimdude_Floor, 0, x, y + 32);
        draw_sprite(sAnimdude_Floor, 0, x + 32, y + 32);
    }
}

image_index = floor(x / 16) % 2;
draw_self();
draw_sprite(sAnimdude, 3, 4, 4);
draw_set_font(global.FontHanddrawn);
draw_text_color(40, 8, "x" + string(Lives), c_white, c_white, c_white, c_white, 1);

if (StartupFrames > 0)
{
    draw_set_font(CountdownFont);
    draw_set_halign(fa_center);
    draw_text_color(162, 61, string(ceil(StartupFrames / 60)), c_white, c_white, c_white, c_white, 1);
    draw_set_halign(fa_left);
}

surface_reset_target();
