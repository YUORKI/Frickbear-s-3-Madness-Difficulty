var SummonAmount = global.MicrogameLevel + 1;
var SummonPosition = irandom_range(-90, 90);
var Delay = 0;

repeat (SummonAmount)
{
    with (instance_create_depth(0, 0, 0, oSalvageDangler_Fredbear))
    {
        Timer = 6;
        image_angle = SummonPosition;
        Frame = Delay;
    }
    
    SummonPosition = ((SummonPosition + 90 + irandom_range(30, 90)) % 180) - 90;
    Delay -= (irandom_range(15, 30) / 60);
}

global.MicrogameWin = false;
