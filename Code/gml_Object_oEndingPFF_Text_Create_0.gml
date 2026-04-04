Timer = 0;
y = 360;
SpeedY = 0;
EndingsFound = global.UnlockedTrophies[UnknownEnum.Value_15] + global.UnlockedTrophies[UnknownEnum.Value_29] + global.UnlockedTrophies[UnknownEnum.Value_30] + global.UnlockedTrophies[UnknownEnum.Value_31] + global.UnlockedTrophies[UnknownEnum.Value_36];
EndingsTotal = 4;

if (global.Route == UnknownEnum.Value_4)
    EndingsTotal = 5;

enum UnknownEnum
{
    Value_4 = 4,
    Value_15 = 15,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_36 = 36
}
