var DoorSpeed = 30;

if (instance_exists(oFredbearAttack_Claw))
{
    if (oFredbearAttack_Claw.Active && DoorNum == sign_to_binary(oFredbearAttack_Claw.Side))
    {
        global.Doors[DoorNum] = true;
        y = (BaseY - sprite_height) + oFredbearAttack_Claw.YOffset;
        exit;
    }
    else if (DoorNum == sign_to_binary(oFredbearAttack_Claw.Side))
    {
        y += ((BaseY - y) / 5);
        exit;
    }
}

if (global.Doors[DoorNum] == true && !instance_exists(oLaserDoor))
{
    y = min(BaseY, y + DoorSpeed);
    
    if (Bounce && y > ((BaseY - sprite_height) + BounceFloor))
    {
        global.Doors[DoorNum] = false;
        BounceFrames = 30;
        
        with (oSalvageHead)
            slam();
    }
}
else if (BounceFrames > 0)
{
    y += ((BaseY - sprite_height - y) / 10);
    BounceFrames--;
}
else
{
    y = max(BaseY - sprite_height, y - DoorSpeed);
}
