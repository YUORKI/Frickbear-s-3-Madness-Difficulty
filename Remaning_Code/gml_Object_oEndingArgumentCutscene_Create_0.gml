PanPercent = 0;
Timer = -120;
TransitionPercent = 0;
TransitionTimer = 0;
Transitioning = false;
VanSprite = 0;
VanSquish = 1;
VanSquishSpeed = 0;
MikeSprite = 0;
MikeSquish = 1;
MikeSquishSpeed = 0;
Fadeout = 0;

function vanny_switch(arg0 = -0.04)
{
    VanSprite++;
    VanSquishSpeed = arg0;
}

function michael_switch(arg0 = -0.04)
{
    MikeSprite++;
    MikeSquishSpeed = arg0;
}

with (instance_create_depth(x, y, 2, oFadeMachine))
{
    FadeSeconds = -6;
    FadeBox = true;
    Alpha = 1;
}

with (instance_create_depth(0, 0, 0, oTextBox))
    game_text_midnight("EndingArgument");

VoiceVolume = 0;
audio_sound_gain(voc_tsMichael, 0, 0);
audio_sound_gain(voc_tsVanny, 0, 0);
audio_sound_gain(voc_tsTheBoss, 0, 0);
audio_sound_gain(voc_tsDefault, 0, 0);
audio_sound_gain(sfxCityAmbience, 0, 0);
audio_sound_gain(sfxDSAmbience, 0, 0);
audio_play_sound(sfxCityAmbience, 5, true);
audio_play_sound(sfxDSAmbience, 5, true);
global.Route = UnknownEnum.Value_4;

enum UnknownEnum
{
    Value_4 = 4
}
