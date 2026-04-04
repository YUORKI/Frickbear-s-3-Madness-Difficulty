var ID = UnknownEnum.Value_43;
var AI = global.AILevels[ID];
var SpawnTime = lerp(120, 30, AI / 20) * Randomizer;
var FindTime = lerp(60, 25, AI / 20);
WaitTime = min(WaitTime, SpawnTime);

if (!Active || ShockTimer > 0)
    LastCam = global.Cam;

if (global.Cam != LastCam)
{
    if (LastCam == 0 || global.Cam == 0)
    {
        LastCam = global.Cam;
    }
    else
    {
        LastCam = global.Cam;
        
        with (oCamButton)
        {
            if (CamNumber == other.CurrentCam)
            {
                other.CurrentCamX = x;
                other.CurrentCamY = y;
            }
            
            if (CamNumber == other.LastCam)
            {
                other.ClickedCamX = x;
                other.ClickedCamY = y;
            }
        }
        
        var BarkVolume = 0.5 + (50 / max(point_distance(CurrentCamX, CurrentCamY, ClickedCamX, ClickedCamY), 25));
        reverb_sound(sfxBark, (CurrentCamX - ClickedCamX) * 10, (CurrentCamY - ClickedCamY) * 10, false, BarkVolume, 1, 1 - (BarkVolume / 3));
        KillTimer -= 1;
    }
}

depth = 2;
var AngleOffset = dsin(Shake) * 5;

if (global.Cam == CurrentCam && ShockTimer > 2)
{
    draw_sprite_ext(sSparky, 1, global.CamX + 128 + lengthdir_x(400 * (Offset + 0.35), -120), global.CamY + 160 + lengthdir_y(400 * (Offset + 0.35), -120), 1, 1, -30, c_white, 1);
    draw_sprite_ext(sSparky, 0, global.CamX + 128 + lengthdir_x(400 * Offset, -120), global.CamY + 160 + lengthdir_y(400 * Offset, -120), 1, 1, -30 + AngleOffset, c_white, 1);
}

OffsetSpeed = lerp(OffsetSpeed, ((ShockTimer == 0) - Offset) * 0.5, 0.2);
Offset += OffsetSpeed;
Shake += ShakeSpeed;
ShakeSpeed -= (ShakeSpeed / 25);

if (ShockTimer > 0 && global.Cam == CurrentCam)
{
    global.MicrogameWin = true;
    end_microgame();
    Active = false;
    KillTimer = 999;
    
    if (ShockTimer > 2)
    {
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    }
    else
    {
        oCameraUI.ZapAlpha = ShockTimer / 2;
        WaitTime = 360;
    }
    
    var EyeAlpha = 1;
    
    if (ShockTimer <= 2.25)
        EyeAlpha = (ShockTimer - 2) * 4;
    
    if (ShockTimer > 2)
        draw_sprite_ext(sSparky, 2, global.CamX + 128 + lengthdir_x(400 * Offset, -120), global.CamY + 160 + lengthdir_y(400 * Offset, -120), 1, 1, -30 + AngleOffset, c_white, EyeAlpha);
}

if (ShockTimer > 0)
{
    ShockTimer -= 0.016666666666666666;
    
    if (ShockTimer == 0)
    {
        Randomizer = random_range(0.8, 1.2);
        WaitTime = SpawnTime * random_range(0.9, 1.1);
    }
}
else if (oFredbearManager.MicrogameTimer <= 1)
{
    jumpscare(UnknownEnum.Value_43, 0, 0, false);
    instance_destroy();
}

if (WaitTime > 0)
{
    WaitTime -= 0.016666666666666666;
    
    if (WaitTime <= 0)
    {
        Active = true;
        KillTimer = FindTime;
        WaitTime = 0;
    }
}

enum UnknownEnum
{
    Value_43 = 43
}
