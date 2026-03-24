event_inherited();

if (array_contains(global.Upgrades, UnknownEnum.Value_10))
{
    x = OriginalX;
    y = OriginalY;
}
else if (array_contains(global.Upgrades, UnknownEnum.Value_9) && ID <= 1)
{
    x = OriginalX;
    y = OriginalY;
}
else if (array_contains(global.Upgrades, UnknownEnum.Value_8) && ID == 0)
{
    x = OriginalX;
    y = OriginalY;
}
else
{
    x = -32;
    y = -32;
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_9,
    Value_10
}
