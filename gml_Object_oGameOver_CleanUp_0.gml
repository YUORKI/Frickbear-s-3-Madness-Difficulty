texturegroup_unload("DeathScreen");

if (audio_get_type(Sound))
    audio_destroy_stream(Sound);

sprite_delete(CustomDeathscreen);
