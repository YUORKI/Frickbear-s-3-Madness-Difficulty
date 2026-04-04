FreddleCountdown -= 0.016666666666666666;

if (FreddleCountdown <= 0 && FreddlesToSummon > 0)
{
    var FreddleSlot = irandom(array_length(FreddlePositions) - 1);
    
    while (FreddleSlots[FreddleSlot])
        FreddleSlot = (FreddleSlot + 1) % array_length(FreddlePositions);
    
    with (instance_create_layer(FreddlePositions[FreddleSlot][0], FreddlePositions[FreddleSlot][1], "Behind_Wall", oFredbear_Freddle))
    {
        image_angle = other.FreddlePositions[FreddleSlot][2];
        SlotID = FreddleSlot;
        TimeToKill = lerp(10, 5, oFredbear.Difficulty);
    }
    
    FreddleSlots[FreddleSlot] = true;
    FreddlesActive++;
    FreddlesToSummon--;
    FreddleCountdown = random_range(0.05, 0.2);
}

if (!instance_exists(oFredbear_Freddle) && FreddlesToSummon <= 0)
    instance_destroy();
