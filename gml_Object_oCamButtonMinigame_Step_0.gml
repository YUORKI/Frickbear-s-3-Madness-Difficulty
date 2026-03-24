if (global.MonitorSystem == "Games")
    y = BaseY;
else
    y = BaseY + 360;

if (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left) && !instance_exists(MinigameID))
{
    audio_play_sound(sfxCamSwitch, 10, false);
    instance_destroy(oMinigameParent);
    
    if (MinigameID != undefined)
        instance_create_layer(-256, -256, "CameraView", MinigameID);
}
