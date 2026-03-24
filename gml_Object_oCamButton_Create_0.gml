CamNumber = 0;
BaseY = y;
CharsOnCam = [];

function radar_draw(arg0, arg1)
{
    if (CamNumber == arg1 && !array_contains(CharsOnCam, arg0))
    {
        if (RadarMode == 2)
            array_push(CharsOnCam, arg0);
        else
            CharsOnCam = [UnknownEnum.Value_0];
    }
}

RadarMode = array_contains(global.Upgrades, UnknownEnum.Value_11);

if (array_contains(global.Upgrades, UnknownEnum.Value_12))
    RadarMode = 2;

enum UnknownEnum
{
    Value_0,
    Value_11 = 11,
    Value_12
}
