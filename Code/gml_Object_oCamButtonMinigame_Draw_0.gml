shader_set(TransparencyShader);
draw_set_font(global.FontW97Black);

if (instance_exists(MinigameID))
{
    draw_rectangle_color(x, y, x + 282, y + 13, c_black, c_black, c_black, c_black, false);
    draw_set_font(global.FontW97White);
}

draw_text_color(x + 3, y - 3, Text, c_white, c_white, c_white, c_white, 1);
draw_set_font(global.FontW97Black);
shader_reset();
