function touching_mangle(arg0, arg1, arg2)
{
    var i = Length - 1;
    
    while (i >= 0)
    {
        if (!arg2 && i == 0)
            return 0;
        
        if (PieceX[i] == arg0 && PieceY[i] == arg1)
            return 1;
        
        i--;
    }
    
    return 0;
}

ControlQueue = ds_queue_create();
Initialize = true;
WaitForClick = true;
DeathFrames = 180;
BonusFrames = 0;
Multiplier = 1;
SpawnInDelay = 1;
