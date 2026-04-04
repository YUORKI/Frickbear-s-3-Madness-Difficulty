if (PlayingSound != undefined && audio_is_playing(PlayingSound))
{
    audio_stop_sound(PlayingSound);
    PlayingSound = undefined;
}

if (emitter != undefined && audio_emitter_exists(emitter))
    audio_emitter_free(emitter);
