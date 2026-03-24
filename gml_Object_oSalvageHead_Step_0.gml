BonkHeight = y - 610;

if (HP > 0)
{
    with (instance_find(oDoor, Doorway))
    {
        Bounce = true;
        BounceFloor = other.BonkHeight;
    }
}

WidthSpeed = lerp(WidthSpeed, (1 - Width) * 0.2, 0.5);
Width += WidthSpeed;
WobbleSpeed = lerp(WobbleSpeed, (0 - image_angle) * 0.2, 0.5);
image_angle += WobbleSpeed;
YOffsetSpeed = lerp(YOffsetSpeed, (TargetY - YOffset) * 0.3, 0.2);
YOffset += YOffsetSpeed;

if (HP == 0)
{
    SizeSpeed -= 0.005;
    Size += SizeSpeed;
}
else
{
    Size += ((1 - Size) / 10);
}

y = BaseY + YOffset + (dsin(Frame) * 5);
Width = max(Width, 0.1);
image_xscale = Width * Size;
image_yscale = Size / Width;
image_index = (oSalvage.Phase - 1) * 3;

if (StaticFrames > 0)
{
    image_index += (1 + (floor(StaticFrames / 2) % 2));
    StaticFrames--;
}

if (HP == 0)
{
    image_alpha = (Size - 0.25) * 1.5;
    
    if (Size <= 0)
    {
        with (oSalvage)
        {
            LastAttackPoint = UnknownEnum.Value_4 + other.Doorway;
            Running = true;
            MoveTimer = 0;
        }
        
        instance_destroy();
    }
}
else
{
    image_alpha = (Size - 0.75) * 4;
}

show_debug_message(string(Size) + "," + string(image_alpha));
Frame++;

if (instance_exists(oLaserDoor))
{
    HP = min(HP, 1);
    
    if (HP > 0)
        slam();
}

if ((Frame / 60) > Timer)
{
    with (oSalvage)
        salvage_jumpscare(other.Side);
}

enum UnknownEnum
{
    Value_4 = 4
}
