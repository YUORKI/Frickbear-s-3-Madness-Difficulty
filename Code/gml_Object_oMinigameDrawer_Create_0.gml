global.HiScores[UnknownEnum.Value_0] = 360;
global.HiScores[UnknownEnum.Value_8] = 0;
global.HiScores[UnknownEnum.Value_2] = 0;
global.HiScores[UnknownEnum.Value_3] = 0;
global.HiScores[UnknownEnum.Value_4] = 360;
global.HiScores[UnknownEnum.Value_5] = 0;
global.HiScores[UnknownEnum.Value_6] = 0;
global.HiScores[UnknownEnum.Value_7] = 360;
DisplayScore = 0;

if (global.MinigameCleared > 0)
    DisplayScore = 1;

function clear_minigame(arg0)
{
    if (!arg0)
        global.MinigameCleared = max(global.MinigameCleared, 1);
    else
        global.MinigameCleared = max(global.MinigameCleared, 2);
    
    instance_destroy(oTextBox);
    
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text("Arcade_Clear");
    
    if (!audio_is_playing(sfxChildrenCheering))
        bitcrush_sound(sfxChildrenCheering, 0, 0, false, 1, 8);
    
    FlashFrames = 120;
}

YOffset = 360;
FlashFrames = 0;

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8
}
