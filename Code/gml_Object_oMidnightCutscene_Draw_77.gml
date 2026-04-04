initialize_ui_surface();
draw_set_alpha(FadeAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
image_xscale = 1 + (FadeAlpha / 2);
image_yscale = 1 + (FadeAlpha / 2);

if (Frame > 0)
    FadeAlpha -= (FadeAlpha / 50);

if (Frame == 180)
{
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text_midnight(other.Conversation);
}

Frame++;
surface_reset_target();
