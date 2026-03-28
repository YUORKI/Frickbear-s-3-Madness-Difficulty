if (AI > 0 && !Frozen)
    FreddleCountdown -= 0.016666666666666666;

if (FreddleCountdown <= 0)
{
    if (FreddlesToSummon == 0)
        FreddlesToSummon = irandom_range(round(AI / 10) + 1, round(AI / 10) + 2);
    
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
        FreddleCountdown = lerp(20, 10, AI / 20) * random_range(0.8, 1.2);
    else
        FreddleCountdown = random_range(0.25, 0.5);
}
