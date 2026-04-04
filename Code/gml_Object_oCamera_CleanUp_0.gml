if (surface_exists(global.MinigameSurface))
    surface_free(global.MinigameSurface);

if (surface_exists(global.UISurface))
    surface_free(global.UISurface);

sprite_delete(FaceSprites);
sprite_delete(MaskSprite);
audio_bus_main.effects[0] = undefined;
