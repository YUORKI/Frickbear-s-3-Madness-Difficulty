Expression = 0;
Squeeze = 1;
SqueezeSpeed = 0;
Timer = 0;
var EndingFlags = [];
EndingFlags[UnknownEnum.Value_0] = "FredbearCloser_Slacker";
EndingFlags[UnknownEnum.Value_2] = "FredbearCloser_Good";
EndingFlags[UnknownEnum.Value_3] = "FredbearCloser_Evil";
EndingFlags[UnknownEnum.Value_1] = "FredbearCloser_Money";
EndingFlags[UnknownEnum.Value_4] = "FredbearCloser_Ultimate";
EndingsSeen = 0;

for (var i = 0; i < array_length(EndingFlags); i++)
{
    if (array_contains(global.UnlockFlags, EndingFlags[i]))
        EndingsSeen++;
}

if (array_contains(global.UnlockFlags, EndingFlags[global.Route]))
{
    room_goto(TitleScreenMap);
}
else
{
    audio_play_sound(sfxPowerOn, 50, false);
    array_push(global.UnlockFlags, EndingFlags[global.Route]);
    
    with (instance_create_depth(0, 0, depth - 1, oTextBox))
    {
        game_text(EndingFlags[global.Route]);
        TextBoxSprite = sNOTHING;
    }
    
    if (global.Route == UnknownEnum.Value_4)
        instance_change(oEndingCharlie, true);
}

function change_expression(arg0)
{
    Squeeze = 1.1;
    Expression = arg0;
}

Fadeout = false;
instance_destroy(oTransitionMinigame);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
