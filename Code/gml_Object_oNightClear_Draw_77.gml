initialize_ui_surface();
draw_sprite(global.Freezeframe, 0, 0, 0);
draw_sprite_ext(sFlashlight, 0, 0, 0, 1, 1, 0, -1, global.Brightness);

if (Frame < 2)
{
    draw_sprite_ext(s6AM, 0, 0, 0, 1, 1, 0, -1, Alpha);
    Alpha += (1/120);
}
else if (Frame < 3.5)
{
    draw_sprite_ext(s6AM, 0, 0, 0, 1, 1, 0, -1, Alpha);
}
else if (Frame < 10.5)
{
    draw_sprite(s6AM, 2, 0, (Alpha - 2) * -64);
    draw_sprite(s6AM, 1, 0, 0);
    draw_results();
    Alpha += 0.004166666666666667;
}
else
{
    draw_sprite(s6AM, 2, 0, (Alpha - 2) * -64);
    draw_sprite(s6AM, 1, 0, 0);
    draw_results();
    draw_set_alpha(FadeoutAlpha);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    FadeoutAlpha += (1/120);
    
    if (Frame == 15)
    {
        if (sprite_exists(global.Freezeframe))
            sprite_delete(global.Freezeframe);
        
        switch (global.Night)
        {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                room_goto(MidnightCutscnes);
                break;
            
            case "Custom":
                room_goto(boss_fight_night() ? Extras : CustomNightMenu);
                break;
        }
    }
}

Alpha = clamp(Alpha, 0, 2);
Frame += 0.016666666666666666;

if (boss_fight_night && global.Route == UnknownEnum.Value_4)
{
    if (Frame == 1)
        audio_sound_gain(sfx6AM, 0, 4000);
    
    if (Frame == 4.5)
        audio_play_sound(mus_BossFredbear_End, 99, false, 1);
}
else if (Frame == 4)
{
    if (global.Night == 5)
        audio_play_sound(VictoryThemes[1][0], 99, false, VictoryThemes[1][1]);
    else if (global.Night == 6)
        audio_play_sound(VictoryThemes[2][0], 99, false, VictoryThemes[2][1]);
    else
        audio_play_sound(VictoryThemes[0][0], 99, false, VictoryThemes[0][1]);
}

surface_reset_target();

enum UnknownEnum
{
    Value_4 = 4
}
