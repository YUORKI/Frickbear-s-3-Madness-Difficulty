if (keyboard_check_pressed(vk_tab) && global.DevMode)
{
    screen_save(working_directory + "ScreensScreen_" + string(ScreenshotsTaken++) + ".png");
    audio_play_sound(sfxCamSwitch, 10, false);
}
