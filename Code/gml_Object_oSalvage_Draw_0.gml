var SpriteOffset = 0;

if (global.Flashlight)
    SpriteOffset = random_range(-1.5, 1.5);

if (global.Cam == SiphonCam)
    draw_sprite(sCameras_Salvage, max(SiphonCam + 35, 40), global.CamX, global.CamY);

if (global.Cam == CurrentCam)
{
    switch (global.Cam)
    {
        case UnknownEnum.Value_1:
            depth = 20;
            break;
        
        case UnknownEnum.Value_2:
            depth = 30;
            break;
        
        case UnknownEnum.Value_3:
            depth = 10;
            break;
        
        case UnknownEnum.Value_4:
            depth = 60;
            break;
        
        case UnknownEnum.Value_5:
            depth = 40;
            break;
        
        case UnknownEnum.Value_6:
            depth = 20;
            break;
        
        case UnknownEnum.Value_7:
            depth = 20;
            break;
        
        case UnknownEnum.Value_8:
            depth = 10;
            break;
    }
    
    draw_sprite(sCameras_Salvage, ((CurrentCam - 1) * 5) + (Phase - 1), global.CamX + SpriteOffset, global.CamY);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8
}
