if (Active && global.Cam == UnknownEnum.Value_8)
{
    depth = 20;
    draw_sprite(sScrapBaby, 0, global.CamX, global.CamY);
}

if (ShockTimer > 0 && global.Cam == UnknownEnum.Value_8)
{
    if (ShockTimer > 2)
    {
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    }
    else
    {
        oCameraUI.ZapAlpha = ShockTimer / 2;
        Active = false;
    }
    
    audio_stop_sound(sfxClatter);
}

enum UnknownEnum
{
    Value_8 = 8
}
