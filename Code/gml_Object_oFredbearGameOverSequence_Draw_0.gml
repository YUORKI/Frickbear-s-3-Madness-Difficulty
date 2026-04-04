if (Timer < 2)
{
    draw_sprite(sFredbearGameOver, 0, 0, 0);
    draw_rectangle_color(160 * ceil(Timer * 2), 0, 640, 360, c_black, c_black, c_black, c_black, false);
}
else if (Timer < 3)
{
    draw_sprite(sFredbearGameOver, 1, 0, 0);
}
else if (!Transitioning)
{
    draw_sprite(sFredbearGameOver, 2, 0, Offset);
    draw_sprite(GuardSprites, global.Guard, 48, 128 + Offset);
    audio_stop_sound(sfxFredbearDeath1);
    draw_set_font(global.FontHanddrawn);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    
    for (var i = 0; i < min(3, array_length(global.FredbearScoreboard)); i++)
        draw_text_transformed(356, 170 + (i * 30) + Offset, string("{0} --------------- {1}", global.FredbearScoreboard[i].Title, global.FredbearScoreboard[i].Score), 0.75, 0.75, 0);
    
    draw_set_color(c_white);
    
    if (Timer >= 8)
    {
        draw_sprite_ext(sFredbearGameOver_Options, 0, 380, 300 + Offset, 1, 1, 0, QuitSelected ? c_dkgray : c_white, 1);
        draw_sprite_ext(sFredbearGameOver_Options, 1 + (global.Night == "Custom"), 505, 305 + Offset, 1, 1, 0, !QuitSelected ? c_dkgray : c_white, 1);
        
        if (input_check_pressed(UnknownEnum.Value_5) && !QuitSelected)
        {
            QuitSelected = true;
            audio_play_sound(sfxBump, 10, false);
        }
        
        if (input_check_pressed(UnknownEnum.Value_3) && QuitSelected)
        {
            QuitSelected = false;
            audio_play_sound(sfxBump, 10, false);
        }
        
        if (input_check_pressed(UnknownEnum.Value_0))
        {
            Transitioning = true;
            audio_stop_all();
            audio_play_sound(sfxCreepyKidLaugh, 10, false);
            audio_play_sound(sfxCamSwitch, 10, false);
            alarm[0] = 90;
        }
    }
    
    if (Timer == 3)
        audio_play_sound(sfxFredbearDeath2, 50, false);
    
    if (Timer == 8)
        audio_play_sound(musNight1, 50, false, 1, 0, 0.25);
    
    if (Timer > 4.3)
        Offset -= min(Offset / 20, 10);
}

Timer += 0.016666666666666666;

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_5 = 5
}
