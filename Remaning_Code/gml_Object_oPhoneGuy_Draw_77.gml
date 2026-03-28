set_target_to_ui();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var Text = "Mute Call";
draw_sprite_stretched(sWindowBase, 1 - min(PhoneActive, 1), PhoneButtonX - (ButtonWidth / 2), PhoneButtonY, ButtonWidth, ButtonHeight);
draw_text_color(PhoneButtonX, (PhoneButtonY + (ButtonHeight / 2)) - 2, Text, c_white, c_white, c_white, c_white, 1);

if (PhoneActive == 2 && Timer > 10 && TonightsCall != undefined && subtitles_enabled())
{
    Text = "";
    
    switch (global.Night)
    {
        case 1:
            Text += "PHONE GUY: ";
            break;
        
        case 2:
            Text += "PHONE GEEK: ";
            break;
        
        case 3:
            Text += "PHONE GAL: ";
            break;
        
        case 4:
            Text += "PHONE GOON: ";
            break;
        
        case 5:
            Text += "PHONE GOON: ";
            break;
        
        case 6:
            Text += "THE BOSS: ";
            break;
    }
    
    draw_set_valign(fa_bottom);
    Text += global.PhoneGuySubtitles[global.Night][CurrentSubtitleLine].Text;
    
    if (CurrentSubtitleLine < (array_length(global.PhoneGuySubtitles[global.Night]) - 1))
    {
        if (audio_sound_get_track_position(TonightsCallPlaying) > global.PhoneGuySubtitles[global.Night][CurrentSubtitleLine + 1].Time)
            CurrentSubtitleLine++;
    }
    
    for (var FontDirection = 0; FontDirection < 360; FontDirection += 45)
        draw_text_ext(320 + round(lengthdir_x(1, FontDirection)), 300 + round(lengthdir_y(1, FontDirection)), Text, 15, 400);
    
    draw_set_font(global.FontW97White);
    draw_text_ext(320, 300, Text, 15, 400);
    
    if (!audio_is_playing(TonightsCall))
    {
        if (!instance_exists(oJumpscare))
            global.CallMuted = true;
        
        audio_play_sound(sfxPhonePickup, 10, false);
        PhoneActive = 0;
    }
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
surface_reset_target();
