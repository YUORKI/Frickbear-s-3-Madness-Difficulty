sprite_delete(SPRITE_Cameras);

if (audio_get_type(SOUND_Laugh1))
    audio_destroy_stream(SOUND_Laugh1);

if (audio_get_type(SOUND_Laugh2))
    audio_destroy_stream(SOUND_Laugh2);
