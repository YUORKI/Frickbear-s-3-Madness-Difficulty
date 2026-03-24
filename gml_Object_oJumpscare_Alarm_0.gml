if (instance_exists(oCamera) && oCamera.BossMode == UnknownEnum.Value_3)
{
    var MicrogamesCleared = 20;
    var MicrogamesHiScore = global.BossHiScores[2][global.Difficulty];
    
    if (MicrogamesCleared > MicrogamesHiScore)
        global.BossHiScores[2][global.Difficulty] = MicrogamesCleared;
    
    global.ThisBossHiScore = MicrogamesCleared;
    
    if (!variable_global_exists("FredbearScoreboard"))
    {
        global.FredbearScoreboard = [
        {
            Title: "HRY",
            Score: 20
        }, 
        {
            Title: "YOU",
            Score: 20
        }];
    }
    else
    {
        array_push(global.FredbearScoreboard, 
        {
            Title: "YOU",
            Score: 20
        });
    }
    
    array_sort(global.FredbearScoreboard, function(arg0, arg1)
    {
        return arg1.Score - arg0.Score;
    });
    audio_stop_sound(sfxFredbearGrowl2);
    room_goto(Fredbear_GameOver);
    texturegroup_unload("FinalBossJumpscare");
    exit;
}

instance_create_depth(0, 0, -1, oJumpscareTransition);

enum UnknownEnum
{
    Value_3 = 3
}
