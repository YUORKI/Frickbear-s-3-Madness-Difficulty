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
var Generosity = 4;

if ((0 - Generosity) <= MouseX && (16 + Generosity) > MouseX && (0 - Generosity) <= MouseY && (14 + Generosity) > MouseY && mouse_check_button_pressed(mb_left))
{
    audio_play_sound(sfxClick, 10, false);
    
    with (oHelpy)
    {
        audio_stop_sound(CurrentClip);
        audio_stop_sound(CurrentCloseClip);
        CurrentCloseClip = choose(voc_Helpy_DarnIt, voc_Helpy_Dawww, voc_Helpy_Doh);
        bitcrush_sound(CurrentCloseClip, 0, 0, false, 1, 4);
    }
    
    with (oHelpy)
        audio_stop_sound(CurrentClip);
    
    instance_destroy();
}

movement();
HelpyFrame++;
