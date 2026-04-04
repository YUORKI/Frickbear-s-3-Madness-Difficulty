texturegroup_unload("DeathScreen");

if (!is_undefined(Sound))
{
    audio_get_type(Sound);
    audio_destroy_stream(Sound);
}

sprite_delete(CustomDeathscreen);
