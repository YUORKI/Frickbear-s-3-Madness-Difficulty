var ID = UnknownEnum.Value_41;
var AI = global.AILevels[ID];

if (AI == 21)
{
    ActivationTime = 0;
    AI = 15;
}

if (global.Timer < ActivationTime || AI <= 0 || Activated)
    exit;

with (instance_create_depth(0, 0, 0, oAnimdude_Player))
{
    Speed = lerp(1, 3, AI / 20);
    
    if (global.AILevels[UnknownEnum.Value_41] == 21)
        Lives = 1;
    else
        Lives = 10;
}

Activated = true;

enum UnknownEnum
{
    Value_41 = 41
}
