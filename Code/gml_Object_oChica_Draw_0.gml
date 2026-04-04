if (Stage == "ShowStage")
{
    depth = 40;
    draw_on_cam(UnknownEnum.Value_9, UnknownEnum.Value_1);
}

if (Stage == "DiningArea")
{
    depth = 10;
    draw_on_cam(UnknownEnum.Value_10, UnknownEnum.Value_2);
}

if (Stage == "Hallway")
{
    depth = 30;
    draw_on_cam(UnknownEnum.Value_11, 4.5 + (Side / 2));
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_9 = 9,
    Value_10,
    Value_11
}
