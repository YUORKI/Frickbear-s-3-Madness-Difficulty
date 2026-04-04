var ID = UnknownEnum.Value_31;
var AI = global.AILevels[ID];

if (AI == 21)
{
    audio_group_set_gain(voc_WitheredChica_HaventYouHeard, 0, 0);
    audio_group_set_gain(voc_ToyFreddy_HardlyGaming, 0, 0);
    audio_group_set_gain(voc_Springtrap_Pathetic, 0, 0);
    exit;
}

if (Frame >= (30 - AI))
{
    var RandomChoice = irandom_range(0, SoundMax);
    ChosenSound = SoundLibrary[RandomChoice].ChosenSound;
    AudioLength = SoundLibrary[RandomChoice].AudioLength;
    var AudioPitch = SoundLibrary[RandomChoice].AudioPitch;
    var AudioGain = SoundLibrary[RandomChoice].AudioGain;
    PlayingSound = audio_play_sound(ChosenSound, 50, false, AudioGain, 0, AudioPitch);
    Frame = random_range(-1, 1);
}

if (PlayingSound != undefined)
{
    if (audio_sound_get_track_position(PlayingSound) > AudioLength)
    {
        audio_stop_sound(PlayingSound);
        audio_play_sound(sfxRecordScratch, 10, false);
        audio_play_sound(voc_MusicMan_Chuckle, 10, false);
        PlayingSound = undefined;
        HeadDown = true;
        HeadYSpeed = 10;
    }
}

if (HeadDown && !audio_is_playing(voc_MusicMan_Chuckle))
{
    HeadDown = false;
    HeadYSpeed = 15;
}

var HeadX = 1344;
var HeadY = 448 + HeadYOffset;

with (Head)
{
    x = HeadX;
    y = HeadY;
    sprite_index = sMusicManHead;
    image_angle = 180;
    DrawDepth = 60;
}

var Target = (binary_to_sign(HeadDown) * 128) + 24;
HeadYSpeed = lerp(HeadYSpeed, (Target - HeadYOffset) * 0.2, 0.2);
HeadYOffset += HeadYSpeed;

if (AI > 0)
    Frame += 0.016666666666666666;
else
    Frame = 0;

enum UnknownEnum
{
    Value_31 = 31
}
