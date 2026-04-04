var AI = global.AILevels[UnknownEnum.Value_37];
FlipsLeft = min(FlipsLeft, ceil((35 - round(AI / 2)) / global.NightSpeedup));

if (AI == 21)
{
    FlipsLeft = min(FlipsLeft, 1);
    global.Power += (global.CamUp / 180 / 2);
}

if (FlipsLeft <= 0 && !global.CamUp)
    disable_camera(0.016666666666666666);

enum UnknownEnum
{
    Value_37 = 37
}
