CurrentCam = irandom_range(1, 8);
LastCam = 1;
ClickedCamX = 0;
ClickedCamY = 0;
CurrentCamX = 0;
CurrentCamY = 0;
Active = false;
Offset = 1;
OffsetSpeed = 0;
Shake = 0;
ShakeSpeed = 0;
ShakeOffset = 0;
ShockTimer = 0;
WaitTime = 0.016666666666666666;
KillTimer = 999;
Randomizer = random_range(0.8, 1.2);
var CamOptions = [1, 3, 6];

if (global.MicrogameLevel == 1)
    CamOptions = [1, 3, 4, 5, 6];

if (global.MicrogameLevel == 2)
    CamOptions = [1, 2, 3, 4, 5, 6, 7, 8];

with (oCamButton)
{
    if (!array_contains(CamOptions, CamNumber))
        instance_destroy();
}

CurrentCam = CamOptions[irandom(array_length(CamOptions) - 1)];

with (oCamera)
{
    global.CamUp = true;
    CamAnimation = 1;
}

LastCam = global.Cam;
reverb_sound(sfxSparkyCue, 0, -400, false, 2, 1, 0.2);
global.MicrogameWin = false;
