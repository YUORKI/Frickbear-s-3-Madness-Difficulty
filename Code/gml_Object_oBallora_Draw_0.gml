if (SliceLocations[global.Cam])
{
    if (global.Cam == UnknownEnum.Value_4)
        depth = 10;
    else if (global.Cam == UnknownEnum.Value_3)
        depth = 10;
    else
        depth = 30;
    
    draw_sprite(sMinireenas, image_index, global.CamX, global.CamY);
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4
}
