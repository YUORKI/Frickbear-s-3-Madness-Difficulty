if (!character_active(UnknownEnum.Value_20))
    exit;

if (Stage == 0)
{
    depth = 90;
    draw_on_cam(UnknownEnum.Value_27, UnknownEnum.Value_8);
}

if (Stage == 1)
{
    depth = 60;
    draw_on_cam(UnknownEnum.Value_28, UnknownEnum.Value_1);
}

if (Stage == 2)
{
    depth = 70;
    draw_on_cam(UnknownEnum.Value_29, UnknownEnum.Value_2);
}

if (Stage == 3)
{
    depth = 50;
    draw_on_cam(UnknownEnum.Value_30, UnknownEnum.Value_4);
}

if (Stage == 4)
{
    depth = 10;
    draw_on_cam(UnknownEnum.Value_31, UnknownEnum.Value_4);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4,
    Value_8 = 8,
    Value_20 = 20,
    Value_27 = 27,
    Value_28,
    Value_29,
    Value_30,
    Value_31
}
