var NumInput = 11 + CamNumber;

if (global.MonitorSystem == "Cameras")
    y = BaseY;
else
    y = BaseY + 360;

if (global.CamUp && global.MonitorSystem == "Cameras" && ((place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left)) || input_check_pressed(NumInput)) && !(global.Cam == CamNumber))
{
    global.Cam = CamNumber;
    global.SavedCam = global.Cam;
    fuzz_up();
    audio_play_sound(sfxCamSwitch, 10, false);
}
