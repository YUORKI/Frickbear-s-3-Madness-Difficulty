if (Timer <= 180)
    YLevel = lerp(0, 1080, 0.5 + (dcos(Timer) / 2));

draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_sprite(sUltimateEndscreen_BG, 0, 0, YLevel + 360);
draw_sprite(sUltimateEndscreen_Doll_Bonnie, 0, 373, (YLevel - 600) * 1.05);
draw_sprite(sUltimateEndscreen_Doll_Chica, 0, 199, (YLevel - 600) * 0.9);
draw_sprite(sUltimateEndscreen_Doll_Foxy, 0, 92, (YLevel - 600) * 1.1);
draw_sprite(sUltimateEndscreen_Doll_Freddy, 0, 501, (YLevel - 600) * 0.95);
Timer += 0.5;
show_debug_message(Timer);

if (Timer > 240)
{
    if (Alpha < 1)
        Alpha += (1/120);
    
    draw_sprite_ext(sUltimateEndscreen_TheEnd, 0, 4, 356, 1, 1, 0, c_white, Alpha);
}

if (Timer > 240 && input_check_pressed(UnknownEnum.Value_0) && !instance_exists(oResultsWindow))
{
    audio_play_sound(sfxSwoosh, 5, false);
    instance_create_depth(0, 0, depth - 1, oResultsWindow);
}

enum UnknownEnum
{
    Value_0
}
