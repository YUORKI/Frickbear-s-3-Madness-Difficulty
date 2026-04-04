if (MusicPlaying == undefined || !audio_is_playing(MusicPlaying))
{
    instance_destroy();
}
else
{
    var TrackPos = audio_sound_get_track_position(MusicPlaying);
    var TrackStart = audio_sound_get_loop_start(MusicPlaying);
    var TrackEnd = audio_sound_get_loop_end(MusicPlaying);
    
    if (TrackPos >= TrackEnd)
        audio_sound_set_track_position(MusicPlaying, TrackStart + (TrackPos - TrackEnd));
}
