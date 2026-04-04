var TrackPos = audio_sound_get_track_position(MusicPlaying);
var TrackStart = audio_sound_get_loop_start(MusicPlaying);
var TrackEnd = audio_sound_get_loop_end(MusicPlaying);

if (TrackPos >= TrackEnd && (Loop && MusicList[Selected].Loop))
    audio_sound_set_track_position(MusicPlaying, TrackStart + (TrackPos - TrackEnd));
