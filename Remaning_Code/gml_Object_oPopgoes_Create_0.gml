CurrentCam = 1;
TargetCam = 1;
PreviousTargetCam = 1;
Mode = "Inactive";
WaitFrame = 0;
Randomizer = random_range(1, 1.25);
Active = false;
ShockTimer = 0;

function cam_to_sprite(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return 0;
            break;
        
        case UnknownEnum.Value_2:
            return 1;
            break;
        
        case UnknownEnum.Value_3:
            return 2;
            break;
        
        case UnknownEnum.Value_7:
            return 3;
            break;
        
        case UnknownEnum.Value_8:
            return 4;
            break;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_7 = 7,
    Value_8
}
