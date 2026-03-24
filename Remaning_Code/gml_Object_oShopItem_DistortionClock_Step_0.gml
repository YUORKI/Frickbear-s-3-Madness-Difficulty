global.Timer += 1;
audio_play_sound(sfxTick, 1, false);
Frame += 1;

if (Frame == 60)
{
    global.Timer += TimeDif;
    audio_play_sound(sfxSparkleImpact, 5, false);
    instance_destroy();
}
