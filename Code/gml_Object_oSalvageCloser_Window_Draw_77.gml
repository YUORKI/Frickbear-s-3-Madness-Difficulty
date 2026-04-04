set_target_to_ui();

if (audio_is_playing(SoundPlaying) && subtitles_enabled())
{
    var Text = "";
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    Text += SubtitleQueue[0][CurrentSubtitleLine];
    
    if (CurrentSubtitleLine < (array_length(SubtitleQueue[0]) - 1))
    {
        if (audio_sound_get_track_position(SoundPlaying) > SubtitleQueue[1][CurrentSubtitleLine + 1])
            CurrentSubtitleLine++;
    }
    
    for (var FontDirection = 0; FontDirection < 360; FontDirection += 45)
        draw_text_ext(320 + round(lengthdir_x(1, FontDirection)), 300 + round(lengthdir_y(1, FontDirection)), Text, 15, 400);
    
    draw_set_font(global.FontW97White);
    draw_text_ext(320, 300, Text, 15, 400);
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
surface_reset_target();
