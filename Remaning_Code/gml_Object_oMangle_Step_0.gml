var ID = UnknownEnum.Value_9;
var AI = global.AILevels[ID];

if (AI == 0)
{
    with (StickyNote)
        image_index = 11;
    
    CurrentCam = 0;
    exit;
}

if (global.CamUp)
{
    WaitForFlip = true;
}
else if (WaitForFlip == true)
{
    CamNum = (CamNum + 1) % array_length(CamOrder);
    
    while (CamOrder[CamNum] == global.Cam || CamOrder[CamNum] == global.SavedCam)
        CamNum = (CamNum + 1) % array_length(CamOrder);
    
    CurrentCam = CamOrder[CamNum];
    WaitForFlip = false;
}

with (StickyNote)
    image_index = other.CurrentCam;

if (global.CamUp && global.MonitorSystem == "Cameras" && global.Cam == CurrentCam)
{
    if (!audio_is_playing(sfxMangleGarble))
        audio_play_sound(sfxMangleGarble, 20, true);
    
    Exposure += 1;
}
else
{
    audio_stop_sound(sfxMangleGarble);
    Exposure = max(Exposure - ((20 - AI) / 200), 0);
}

if (Exposure > (180 - (AI * 6)))
    jumpscare(ID, 0);

enum UnknownEnum
{
    Value_9 = 9
}
