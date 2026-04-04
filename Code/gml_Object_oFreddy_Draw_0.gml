if (Stage == "ShowStage" && global.Cam == UnknownEnum.Value_1)
{
    depth = 30;
    draw_sprite(SPRITE_Cameras, 0, global.CamX, global.CamY);
}

if (Stage == "DiningArea" && global.Cam == UnknownEnum.Value_2)
{
    depth = 60;
    draw_sprite(SPRITE_Cameras, 1, global.CamX, global.CamY);
}

if (Stage == "Hallway" && Side == -1 && global.Cam == UnknownEnum.Value_4)
{
    depth = 30;
    draw_sprite(SPRITE_Cameras, 2, global.CamX, global.CamY);
}

if ((Stage == "Doorway" || Stage == "Blocked") && global.Cam == UnknownEnum.Value_4 && Side == -1)
{
    depth = 11;
    draw_sprite(SPRITE_Cameras, 3, global.CamX, global.CamY);
}

if (Stage == "Hallway" && Side == 1 && global.Cam == UnknownEnum.Value_5)
{
    depth = 20;
    draw_sprite(SPRITE_Cameras, 4, global.CamX, global.CamY);
}

if ((Stage == "Doorway" || Stage == "Blocked") && Side == 1 && global.Cam == UnknownEnum.Value_5)
{
    depth = 10;
    draw_sprite(SPRITE_Cameras, 5, global.CamX, global.CamY);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4,
    Value_5
}
