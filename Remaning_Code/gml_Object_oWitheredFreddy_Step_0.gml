var ID = UnknownEnum.Value_10;
var AI = global.AILevels[ID];

if (Frame >= 460)
{
    if (global.Doors[sign_to_binary(Direction)])
    {
        simple_sound(sfxBlock, Frame * Direction, -20, false);
        reverb_sound(sfxWitheredFreddyBlocked, Frame * Direction, -20);
        block_tokens();
        Direction *= -1;
        Frame = -580;
        Delay = 60;
        KillTimer = 0;
        StepTimer = 40;
    }
    else if (KillTimer > lerp(180, 90, AI / 20))
    {
        jumpscare(ID, Direction);
    }
    
    KillTimer++;
}
else if (Delay > 0)
{
    Delay--;
}
else if (AI > 0)
{
    var Walkspeed = lerp(0.5, 1.5, AI / 20);
    Frame += Walkspeed;
    StepTimer -= Walkspeed;
    
    if (StepTimer <= 0)
    {
        simple_sound(sfxMetalFootstep, Frame * Direction * 2, -200, false, 0.15);
        StepTimer += 60;
    }
}

enum UnknownEnum
{
    Value_10 = 10
}
