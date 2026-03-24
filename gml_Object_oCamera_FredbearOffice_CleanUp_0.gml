if (surface_exists(global.MinigameSurface))
    surface_free(global.MinigameSurface);

if (surface_exists(global.UISurface))
    surface_free(global.UISurface);

sprite_delete(FaceSprites);
sprite_delete(MaskSprite);
instance_destroy(oOfficeSprite);
audio_bus_main.effects[0] = undefined;
audio_stop_sound(sfxFan);
audio_stop_sound(sfxFreddleScreech);
