if (Stage == "ShowStage")
{
    depth = 50;
    draw_on_cam(UnknownEnum.Value_6, UnknownEnum.Value_1);
}

if (Stage == "DiningArea")
{
    depth = 50;
    draw_on_cam(UnknownEnum.Value_7, UnknownEnum.Value_2);
}

if (Stage == "Hallway")
{
    depth = 40;
    draw_on_cam(UnknownEnum.Value_8, 4.5 + (Side / 2));
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_6 = 6,
    Value_7,
    Value_8
}
