if (Timer < 180 && Timer >= 0)
{
    PanPercent = 1 - ((1 + dcos(Timer)) / 2);
    VoiceVolume = lerp(0.1, 1, PanPercent);
}
else if (Timer < 0)
{
    VoiceVolume = (60 + Timer) * 0.0016666666666666668;
}

if (Timer > -120)
{
    draw_sprite(sEndingArgumentBG, 0, -160, lerp(0, -244, PanPercent));
    draw_sprite(sEndingArgumentBG, 1, -160, lerp(0, -366, PanPercent));
    draw_sprite(sEndingArgumentBG, 2, -160, lerp(32, -488, PanPercent));
    draw_sprite(sEndingArgumentBG, 3, -160, lerp(64, -488, PanPercent));
    draw_sprite(sEndingArgumentBG, 4, -160, lerp(128, -488, PanPercent));
    draw_sprite(sEndingArgumentBG, 5, -160, lerp(256, -488, PanPercent));
    draw_sprite_ext(sEndingArgument_Michael, MikeSprite, 200, lerp(1536, 254, PanPercent) + ((1 - MikeSquish) * 4), 1 / MikeSquish, MikeSquish, 0, c_white, 1);
    draw_sprite_ext(sEndingArgument_Vanny, VanSprite, 440, lerp(1620, 232, PanPercent) + ((1 - VanSquish) * 4), 1 / VanSquish, VanSquish, 0, c_white, 1);
    draw_rectangle_color(0, 232, 640, 360, c_black, c_black, c_black, c_black, false);
}

if (TransitionPercent > 0.5)
{
    draw_rectangle_color(0, 0, 640, 360, #3EBBFF, #3EBBFF, #3EBBFF, #3EBBFF, false);
    draw_sprite_ext(sEndingArgumentBG, 1, 800, lerp(0, -160, PanPercent), -1, 1, 0, c_white, 1);
    draw_sprite_ext(sEndingArgumentBG, 3, 800, lerp(0, -280, PanPercent), -1, 1, 0, c_white, 1);
    draw_sprite_ext(sEndingArgumentBG, 4, 800, lerp(0, -340, PanPercent), -1, 1, 0, c_white, 1);
    draw_sprite(sEndingArgumentExtras, 0, 0, lerp(768, 0, PanPercent));
    draw_sprite(sEndingArgumentExtras, 1, 0, lerp(1080, 0, PanPercent));
    draw_sprite(sEndingArgumentExtras, 2, -32, lerp(0, -896, PanPercent));
    draw_sprite(sEndingArgumentExtras, 3, -32, lerp(0, -768, PanPercent));
    var FadeoutTime = 180;
    
    if (Timer < -60)
        Fadeout += (1 / FadeoutTime);
    
    if (Fadeout > (1 + (60 / FadeoutTime)))
        room_goto(Credits);
    
    if (Timer == 60)
        audio_play_sound(sfxMusicBoxStinger, 30, false);
}

TransitionPercent = 1 - ((1 + dcos(TransitionTimer)) / 2);
var TransitionOffset = lerp(-1000, 1000, TransitionPercent);
draw_sprite_ext(sEndingArgumentTransition, 0, TransitionOffset, 180, 1, 1, 0, c_white, 1);
draw_rectangle_color(TransitionOffset, 0, 640 + TransitionOffset, 360, c_black, c_black, c_black, c_black, false);
draw_sprite_ext(sEndingArgumentTransition, 0, TransitionOffset + 640, 180, -1, -1, 0, c_white, 1);

if (Transitioning && TransitionTimer < 180)
    TransitionTimer += 6;

if (Transitioning)
    Timer -= 0.5;
else
    Timer += 0.5;

MikeSquish += MikeSquishSpeed;
MikeSquishSpeed = lerp(MikeSquishSpeed, (1 - MikeSquish) * 0.3, 0.35);
VanSquish += VanSquishSpeed;
VanSquishSpeed = lerp(VanSquishSpeed, (1 - VanSquish) * 0.3, 0.35);
draw_set_alpha(Fadeout);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
audio_sound_gain(voc_tsMichael, VoiceVolume * 0.64, 0);
audio_sound_gain(voc_tsVanny, VoiceVolume * 0.5, 0);
audio_sound_gain(voc_tsTheBoss, VoiceVolume, 0);
audio_sound_gain(voc_tsDefault, VoiceVolume, 0);
audio_sound_gain(sfxCityAmbience, VoiceVolume / 2, 0);
audio_sound_gain(sfxDSAmbience, power(VoiceVolume, 4) / (1 + (VanSprite < 2)), 0);

if (input_check_pressed(UnknownEnum.Value_3))
    michael_switch();

if (input_check_pressed(UnknownEnum.Value_5))
    vanny_switch();

enum UnknownEnum
{
    Value_3 = 3,
    Value_5 = 5
}
