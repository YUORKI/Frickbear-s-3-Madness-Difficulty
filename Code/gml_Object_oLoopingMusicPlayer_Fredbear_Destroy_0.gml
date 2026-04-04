if (MusicPlaying != undefined && audio_is_playing(MusicPlaying))
{
    audio_stop_sound(MusicPlaying);
    MusicPlaying = undefined;
}
