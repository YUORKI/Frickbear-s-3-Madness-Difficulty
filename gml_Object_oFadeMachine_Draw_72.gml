draw_set_alpha(Alpha);

if (FadeBox)
{
    with (oTextBox)
        TextboxDarken = other.Alpha;
}
else
{
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    
    with (oTextBox)
        TextboxDarken = 0;
}

draw_set_alpha(1);
Alpha += (1 / (60 * FadeSeconds));
