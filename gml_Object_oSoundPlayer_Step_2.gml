if (PlayingSound == undefined)
{
    EchoWait++;
    
    if (EchoWait == 300)
    {
        if (PlayingSound != undefined)
            audio_stop_sound(PlayingSound);
        
        PlayingSound = undefined;
        audio_emitter_free(emitter);
        emitter = undefined;
    }
    
    if (EchoWait >= 360)
        instance_destroy();
}
else if (!audio_is_playing(PlayingSound))
{
    PlayingSound = undefined;
}
