if (CheckingMode)
{
    var AllScared = true;
    
    with (oFreddle)
    {
        if (!Flashed)
            AllScared = false;
    }
    
    if (AllScared && !global.MicrogameWin)
    {
        end_microgame();
        audio_play_sound(sfxBitBoost, 10, false);
        instance_destroy();
        global.MicrogameWin = true;
    }
    
    if (oFredbearManager.MicrogameTimer <= 1 && !global.MicrogameWin)
    {
        jumpscare(UnknownEnum.Value_51, 0, 0, false, false);
        instance_destroy();
    }
}
else
{
    FreddleCountdown -= 0.016666666666666666;
    
    if (FreddleCountdown <= 0)
    {
        var FreddleSlot = irandom(array_length(FreddlePositions) - 1);
        
        while (FreddleSlots[FreddleSlot])
            FreddleSlot = (FreddleSlot + 1) % array_length(FreddlePositions);
        
        with (instance_create_layer(FreddlePositions[FreddleSlot][0], FreddlePositions[FreddleSlot][1], "Behind_Wall", oFreddle))
        {
            image_angle = other.FreddlePositions[FreddleSlot][2];
            SlotID = FreddleSlot;
            TimeToKill = lerp(10, 5, other.AI / 20);
        }
        
        FreddleSlots[FreddleSlot] = true;
        FreddlesActive++;
        FreddlesToSummon--;
        
        if (FreddlesToSummon == 0)
            CheckingMode = true;
        else
            FreddleCountdown = random_range(0.05, 0.2) / global.MicrogameSpeed;
    }
}

enum UnknownEnum
{
    Value_51 = 51
}
