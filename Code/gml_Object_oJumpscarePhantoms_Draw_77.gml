depth = oCamera.depth - 1;
set_target_to_ui();

if (Frame <= JumpscareDuration)
{
    var Vibration = (Frame / 5) + 1;
    var FrameVal = 1 - (floor(Frame) % 3);
    var Offset = (round(((FrameVal * 2) / Vibration) * 80) / 10) + (sqrt(Frame) * OriginX * 2);
    draw_sprite_ext(sJumpscarePhantoms, JumpscareID * 2, JumpX + Offset, JumpY, SizeBody, SizeBody, JumpAngle, -1, 1);
    draw_sprite_ext(sJumpscarePhantoms, (JumpscareID * 2) + 1, JumpX, JumpY, SizeHead, SizeHead, Offset + JumpAngle, -1, 1);
}
else if (Freezeframe != undefined)
{
    shader_set(shInverse);
    draw_sprite_ext(Freezeframe, 0, 0, 0, 1, 1, 0, c_white, 1 - ((Frame - JumpscareDuration) / FadeoutDuration));
    shader_reset();
}

surface_reset_target();

if (Frame == (JumpscareDuration - 15))
    audio_play_sound(sfxSwoosh, 10, false);

if (Frame == JumpscareDuration)
{
    FreezeframeSurface = surface_create(display_get_gui_width(), display_get_gui_height());
    surface_set_target(FreezeframeSurface);
    draw_clear_alpha(c_black, 0);
    
    if (surface_exists(application_surface))
        draw_surface(application_surface, 0, 0);
    
    draw_surface(global.UISurface, 0, 0);
    surface_reset_target();
    Freezeframe = sprite_create_from_surface(FreezeframeSurface, 0, 0, surface_get_width(FreezeframeSurface), surface_get_height(FreezeframeSurface), 0, 0, 0, 0);
    surface_free(FreezeframeSurface);
}
