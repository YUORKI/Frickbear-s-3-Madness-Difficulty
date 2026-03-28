set_target_to_ui();
draw_sprite(sprite_index, 0, x, y);
draw_sprite(sHelpyAd, Ad, x + 6, y + 26);
var HelpyImage = 0;

switch (HelpyAnimation)
{
    case 0:
    case 1:
        HelpyImage = (floor(HelpyFrame / 30) % 2) + (HelpyAnimation * 2);
        HelpyFrame %= 60;
        break;
}

draw_sprite(sHelpyDance, HelpyImage, x - 16, (y + sprite_height) - 32);
var MouseX = device_mouse_x_to_gui(0) - x - 182;
var MouseY = device_mouse_y_to_gui(0) - y - 6;

if (0 <= MouseX && 16 > MouseX && 0 <= MouseY && 14 > MouseY && mouse_check_button_pressed(mb_left))
{
    audio_play_sound(sfxClick, 10, false);
    
    with (oHelpy)
    {
        if (audio_is_playing(SoundPlaying))
            audio_stop_sound(SoundPlaying);
        
        CurrentCloseClip = (irandom(20) == 7) ? choose(voc_Helpy_Fiddlesticks, voc_Helpy_Sonofa) : choose(voc_Helpy_DarnIt, voc_Helpy_Dawww, voc_Helpy_Doh);
        SoundPlaying = bitcrush_sound(CurrentCloseClip, 0, 0, false, 1, 4);
    }
    
    instance_destroy();
}

surface_reset_target();
HelpyFrame++;
