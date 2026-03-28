var ID = UnknownEnum.Value_3;
var AI = global.AILevels[ID];

if (AI == 0)
    Phase = 0;

WaitTime = 360 - (AI * 15);
var CheeseConditions = Mode == "Wait" && !instance_exists(oMarionette) && TimeSinceFlipped > 55;

if (Mode == "Wait")
{
    if (!global.CamUp && global.Cam != 3)
        Phase += 0.016666666666666666;
    else if (global.CamUp && global.Cam == 3)
        Phase -= 0;
    else
        Phase += (1/120);
    
    Phase = max(Phase, 0);
    
    if (Phase >= WaitTime)
    {
        simple_sound(sfxFoxyRun, -400, -400, false, 1.5, 50);
        Mode = "Run";
        Phase = 0;
    }
}
else
{
    Phase += 1;
    
    if (Phase == 90)
    {
        if (global.Doors[0])
        {
            var BlockSound = voc_Foxy_Blocked2;
            
            if (irandom(9) != 0)
                BlockSound = choose(voc_Foxy_Blocked1, voc_Foxy_Blocked3);
            
            if (!CheeseConditions)
                reverb_sound(BlockSound, -300, 0, false, 1);
            
            simple_sound(sfxBlock, -300, 0, false, 1);
            block_tokens();
            
            if (!instance_exists(oLaserDoor))
                global.Power -= PowerDrain;
            
            PowerDrain = min(PowerDrain + 1, 5);
            Phase = 0;
            Mode = "Wait";
        }
        else
        {
            jumpscare(ID, -1);
        }
    }
}

if (!global.CamUp)
{
    TimeSinceFlipped += 0.016666666666666666;
}
else
{
    TimeSinceFlipped = 0;
    Anticheese = false;
}

if (CheeseConditions)
{
    if (!Anticheese)
    {
        reverb_sound(voc_Foxy_CamCheese, -300, 300, false, 1);
        Anticheese = true;
    }
    
    if (TimeSinceFlipped > 60)
        Phase = WaitTime;
}

enum UnknownEnum
{
    Value_3 = 3
}
