if (Delay <= 0)
{
    var WindowX = irandom_range(32, display_get_gui_width() - (sprite_get_width(sHelpyWindow) + 32));
    var WindowY = irandom_range(32, display_get_gui_height() - (sprite_get_height(sHelpyWindow) + 32));
    instance_create_depth(WindowX, WindowY, -1 - instance_number(oFredbear_OfficePopup), oFredbear_OfficePopup);
    audio_play_sound(sfxWindowNotif, 10, false);
    Delay = irandom_range(2, 5);
    AdsToCreate--;
    
    if (AdsToCreate <= 0)
        instance_destroy();
}

Delay--;
