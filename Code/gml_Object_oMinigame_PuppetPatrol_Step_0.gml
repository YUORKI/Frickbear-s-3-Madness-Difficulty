if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
    else
        Paused = false;
}

if (Frame >= 32)
{
    var SpawnX = 80 + (96 * Side);
    
    if (KidsSpawned == 0)
        SpawnHeightArray = array_shuffle(SpawnHeightArray);
    
    with (instance_create_depth(SpawnX, (SpawnHeightArray[KidsSpawned] * 8) + 8, depth - 1, oPP_Kids))
    {
        if (irandom(25) == 7)
            Color = 3;
        else
            Color = irandom_range(0, 2);
    }
    
    Side *= -1;
    KidsSpawned %= array_length(SpawnHeightArray);
    Frame = 0;
}

if (mouse_check_button(mb_right) && Power > 0 && !Recharging && !Paused)
{
    FlashlightRadius += 0.5;
    Power--;
    
    if (Power <= 0)
    {
        Power = 0;
        Recharging = true;
    }
}
else
{
    FlashlightRadius -= (FlashlightRadius / 2);
    
    if (!(Cooldown > 0 && !Happy) && !Paused)
        Power = min(Power + 0.33, 160);
    
    if (Power >= 80)
        Recharging = false;
}

if (Cooldown > 0)
{
    Cooldown--;
    
    if (Cooldown == 0)
    {
        DesiredKid = irandom_range(0, 2);
        SpeechBubbleOffset = 32;
    }
    
    SpeechBubbleOffset += (SpeechBubbleOffset + 1);
}
else
{
    SpeechBubbleOffset -= (SpeechBubbleOffset / 5);
}

if (!Paused)
{
    Frame += 1;
    Timer = min(Timer + 0.016666666666666666, 30);
    RadarX = (RadarX + 1) % 480;
}

if (Score > global.HiScores[UnknownEnum.Value_3])
    global.HiScores[UnknownEnum.Value_3] = Score;

if (Score > global.HiScoresOverall[UnknownEnum.Value_3])
    global.HiScoresOverall[UnknownEnum.Value_3] = Score;

if (Score >= 30 && Timer < 30)
{
    get_trophy(UnknownEnum.Value_4);
    Timer = 30;
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4
}
