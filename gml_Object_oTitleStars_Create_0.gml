Alpha = 0;
Show = false;
StarAmount = 0;
StarEmptyAmount = 0;
StarAmount += (global.UnlockedTrophies[UnknownEnum.Value_15] + global.UnlockedTrophies[UnknownEnum.Value_31] + global.UnlockedTrophies[UnknownEnum.Value_29] + global.UnlockedTrophies[UnknownEnum.Value_30] + global.UnlockedTrophies[UnknownEnum.Value_36]);

if (StarAmount == 4)
    StarEmptyAmount++;
else if (StarAmount < 4)
    StarEmptyAmount += (4 - StarAmount);

if (global.UnlockedTrophies[UnknownEnum.Value_37])
    StarAmount++;

if (global.UnlockedTrophies[UnknownEnum.Value_42])
    StarAmount++;

depth = 5;
DanceFrame = -2;
DanceOffset = -8;

enum UnknownEnum
{
    Value_15 = 15,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_36 = 36,
    Value_37,
    Value_42 = 42
}
