if (!Paused && ((input_check_pressed(UnknownEnum.Value_1) && !Cooldown) || !window_has_focus()) && !instance_exists(oTransitionMinigame))
{
    Paused = true;
    audio_bus_main.effects[0] = undefined;
    set_audio_volumes();
    var TargetSurf = application_surface;
    
    if (surface_exists(global.UISurface))
        TargetSurf = global.UISurface;
    
    Screenshot = sprite_create_from_surface(TargetSurf, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
    surface_free(TargetSurf);
    audio_pause_all();
    
    if (in_salvage_location())
        Palette = oCamera3DMaze.Palettes[oCamera3DMaze.CurrentPalette];
    
    instance_deactivate_all(true);
    instance_activate_object(oSuperGameManager);
    instance_create_depth(0, 0, -10, oTitleMenu);
    audio_play_sound(sfxServo, 10, false);
}

if (Unpause)
{
    Paused = false;
    Screenshot = undefined;
    Cooldown = 1;
    instance_activate_all();
    audio_resume_all();
    Unpause = false;
}

if (Cooldown)
    Cooldown = 0;

enum UnknownEnum
{
    Value_1 = 1
}
