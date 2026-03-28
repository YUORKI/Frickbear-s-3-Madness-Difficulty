var ID = UnknownEnum.Value_19;
var AI = global.AILevels[ID];
AmountOfPhantoms = floor(((AI * 6) / 24) + 1);

if (AI == 0)
    AmountOfPhantoms = 0;

if (global.CamUp)
{
    WaitForFlip = true;
}
else if (WaitForFlip == true)
{
    CurrentCams = array_concat([0], array_shuffle(get_phantom_list()));
    WaitForFlip = false;
    Aggro = 0;
}

if (global.Cam != CurrentCam)
{
    CurrentCam = global.Cam;
    Aggro = 0;
}

if (Aggro >= 1)
{
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
    
    audio_play_sound(sfxJumpscarePhantom, 10, false);
    
    with (instance_create_depth(0, 0, 0, oJumpscarePhantoms))
    {
        JumpscareID = other.CurrentCams[global.Cam] - 1;
        
        if (JumpscareID == 4)
            jump_origin(0, 1);
    }
}

enum UnknownEnum
{
    Value_19 = 19
}
