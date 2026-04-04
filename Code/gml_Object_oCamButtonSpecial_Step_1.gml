var Clicked = place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left);

if (Text == "Cameras" && (Clicked || input_check_pressed(UnknownEnum.Value_20)) && global.MonitorSystem != Text && global.CamUp)
{
    global.MonitorSystem = Text;
    global.Cam = global.SavedCam;
    audio_play_sound(sfxClick, 10, false);
}

if (Text == "Vents" && (Clicked || input_check_pressed(UnknownEnum.Value_21)) && global.MonitorSystem != Text && global.CamUp)
{
    if (global.MonitorSystem == "Cameras")
    {
        global.SavedCam = global.Cam;
        global.Cam = 0;
    }
    
    global.MonitorSystem = Text;
    audio_play_sound(sfxClick, 10, false);
}

if (Text == "Shop" && (Clicked || input_check_pressed(UnknownEnum.Value_22)) && global.MonitorSystem != Text && global.CamUp)
{
    if (global.MonitorSystem == "Cameras")
    {
        global.SavedCam = global.Cam;
        global.Cam = 0;
    }
    
    global.MonitorSystem = Text;
    audio_play_sound(sfxClick, 10, false);
}

if (Text == "Games" && (Clicked || input_check_pressed(UnknownEnum.Value_23)) && global.MonitorSystem != Text && global.CamUp)
{
    if (global.MonitorSystem == "Cameras")
    {
        global.SavedCam = global.Cam;
        global.Cam = 0;
    }
    
    global.MonitorSystem = Text;
    audio_play_sound(sfxClick, 10, false);
}

enum UnknownEnum
{
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23
}
