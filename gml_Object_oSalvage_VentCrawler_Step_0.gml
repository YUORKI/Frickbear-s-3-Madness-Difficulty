if (WaitTime <= 0)
{
    if (VentY == YShiftPoint)
    {
        var ShiftDirection = random_sign();
        
        if (VentX < 0)
            ShiftDirection = 1;
        else if (VentX > 0)
            ShiftDirection = -1;
        
        VentX += ShiftDirection;
        YShiftPoint = -2;
    }
    else
    {
        VentY += 1;
    }
    
    if (VentY > 1 && !instance_exists(oSalvage_Jumpscarer))
        instance_create_depth(0, 0, 0, oSalvage_Jumpscarer);
    
    array_push(Path, [VentX, VentY]);
    set_wait_time();
}

if (Vanishing)
{
    VanishFrame++;
    
    if (VanishFrame >= 30)
        instance_destroy();
}
else
{
    WaitTime -= 0.016666666666666666;
}
