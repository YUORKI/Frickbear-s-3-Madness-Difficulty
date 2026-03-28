var ID = UnknownEnum.Value_45;
var AI = global.AILevels[UnknownEnum.Value_45];

if (AI <= 0)
    exit;

var WaitTime = lerp(120, 40, AI / 20) * Randomizer;
var KillTime = lerp(60, 20, AI / 20);

if (WaitFrame > (WaitTime / 2) && TargetCam == 1)
{
    TargetCam = choose(UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_7, UnknownEnum.Value_8);
    fuzz_up(UnknownEnum.Value_1);
}

if (WaitFrame > WaitTime && CurrentCam == 1)
{
    CurrentCam = TargetCam;
    Active = true;
    fuzz_up(CurrentCam, UnknownEnum.Value_1);
    audio_play_sound(sfxPopgoesMove, 20, false, 0.5);
}

if (WaitFrame > (WaitTime + KillTime))
    jumpscare(UnknownEnum.Value_45, 0);

if (global.Cam == CurrentCam)
{
    var PopgoesSprite = cam_to_sprite(TargetCam);
    
    if (CurrentCam != UnknownEnum.Value_1)
        PopgoesSprite += 4;
    
    draw_sprite(sPopgoes, PopgoesSprite, global.CamX, global.CamY);
}

if (global.Cam == UnknownEnum.Value_2)
{
    draw_sprite(sPopgoes, 9, global.CamX, global.CamY);
    depth = 20;
}

if (global.Cam == UnknownEnum.Value_3)
{
    draw_sprite(sPopgoes, 10, global.CamX, global.CamY);
    depth = 40;
}

if (global.Cam == UnknownEnum.Value_7)
{
    draw_sprite(sPopgoes, 11, global.CamX, global.CamY);
    depth = 10;
}

if (global.Cam == UnknownEnum.Value_8)
{
    draw_sprite(sPopgoes, 12, global.CamX, global.CamY);
    depth = 30;
}

if (ShockTimer > 0 && global.Cam == PreviousTargetCam)
{
    Active = false;
    
    if (ShockTimer > 2)
    {
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    }
    else
    {
        oCameraUI.ZapAlpha = ShockTimer / 2;
        WaitFrame = 0;
    }
}

if (ShockTimer > 0)
{
    ShockTimer -= 0.016666666666666666;
    WaitFrame = 0;
    
    if (ShockTimer == 2)
    {
        Randomizer = random_range(0.8, 1.2);
        CurrentCam = 1;
        TargetCam = 1;
        fuzz_up(UnknownEnum.Value_1);
    }
}

WaitFrame += 0.016666666666666666;

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_7 = 7,
    Value_8,
    Value_45 = 45
}
