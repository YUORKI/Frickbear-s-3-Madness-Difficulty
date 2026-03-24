if (oMinigame_CircusSorter.Paused)
{
    image_index = floor(Timer / 15) % 4;
    exit;
}

if (!Grabbed)
{
    if ((x + XSpeed) > 104 || (x + XSpeed) <= 40)
    {
        var Step = sign(XSpeed) / 4;
        
        while (!((x + Step) > 104 || (x + Step) <= 40))
            x += Step;
        
        XSpeed *= -1;
    }
    
    x += XSpeed;
    
    if ((y + YSpeed) > 120 || (y + YSpeed) <= 16)
    {
        var Step = sign(YSpeed) / 4;
        
        while (!((y + Step) > 120 || (y + Step) <= 16))
            y += Step;
        
        YSpeed *= -1;
    }
    
    y += YSpeed;
    image_index = floor(Timer / 15) % 4;
}
else
{
    if (x <= 40)
    {
        with (oMinigame_CircusSorter)
            GrabbedBaby = -4;
        
        if (sprite_index == sCS_Bidybab)
        {
            oMinigame_CircusSorter.BabySpeed = -3 * TickdownSpeed;
            oMinigame_CircusSorter.BabyHappy = true;
            oMinigame_CircusSorter.Score++;
            add_tokens(1);
            global.TokensPerMinigame[UnknownEnum.Value_6]++;
        }
        else
        {
            oMinigame_CircusSorter.Dead = true;
            oMinigame_CircusSorter.JumpscareType = true;
        }
        
        instance_destroy();
    }
    
    if (x > 104)
    {
        with (oMinigame_CircusSorter)
            GrabbedBaby = -4;
        
        if (sprite_index == sCS_Minireena)
        {
            oMinigame_CircusSorter.BalloraSpeed = -3 * TickdownSpeed;
            oMinigame_CircusSorter.BalloraHappy = true;
            oMinigame_CircusSorter.Score++;
            add_tokens(1);
            global.TokensPerMinigame[UnknownEnum.Value_6]++;
        }
        else
        {
            oMinigame_CircusSorter.Dead = true;
            oMinigame_CircusSorter.JumpscareType = false;
        }
        
        instance_destroy();
    }
    
    image_index = floor(Timer / 5) % 4;
}

Timer -= 1;

if (Timer == 0)
{
    with (oMinigame_CircusSorter)
    {
        Dead = true;
        
        if (other.sprite_index == sCS_Bidybab)
            JumpscareType = false;
        else
            JumpscareType = true;
    }
}

enum UnknownEnum
{
    Value_6 = 6
}
