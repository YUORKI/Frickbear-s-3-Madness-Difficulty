Transitioning = true;
TransitionAmount = 0;
TransitionFrame = 0;
audio_stop_sound(musExtras);
audio_sound_gain(musCredits, 0, 1000);
global.Route = UnknownEnum.Value_0;

if (input_check(UnknownEnum.Value_25) && global.UnlockedTrophies[UnknownEnum.Value_36])
    global.Route = UnknownEnum.Value_4;

function transition_out_of_credits()
{
    oExtras_Credits.Transitioning = true;
    oExtras_Credits.TransitionFrame = 0;
    audio_sound_gain(musCredits, 0, 1000);
}

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_25 = 25,
    Value_36 = 36
}
