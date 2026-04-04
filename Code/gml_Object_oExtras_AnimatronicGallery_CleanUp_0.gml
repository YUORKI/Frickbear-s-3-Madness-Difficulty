for (var i = 0; i < array_length(CustomPortraits); i++)
    sprite_delete(CustomPortraits[i]);

audio_sound_gain(musExtras, 1, 1000);
surface_free(OverGUISurf);
texturegroup_unload("FinalBossJumpscare");
