if (Frame < 60)
    Alpha += 0.2;

Alpha = clamp(Alpha, 0, 1);
draw_set_alpha(Alpha);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_red, c_red, c_red, c_red, false);
draw_set_alpha(1);

if (Frame == 60)
    room_goto(GameOver);

if (Frame > 60)
{
    Alpha -= (1/120);
    
    if (Alpha <= 0 && !audio_is_playing(Sound))
        instance_destroy();
}

Frame += 1;
