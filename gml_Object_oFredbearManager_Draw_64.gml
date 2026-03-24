if (!surface_exists(global.UISurface))
    global.UISurface = surface_create(display_get_gui_width(), display_get_gui_height());

if (room == Fredbear_3DMaze || room == Fredbear_Office || room == Office)
{
    if (room == Fredbear_3DMaze)
    {
        shader_set(shRecolor);
        replace_color(13695200, 7389320, 5662772, 3354368, 15592941, 9211020, 5263440, 1579032);
    }
    
    draw_surface(global.UISurface, 0, 0);
    shader_set(shGreenToWhite);
    draw_surface(global.UISurface, 0, 0);
    shader_reset();
    shader_set(shDiscardGreen);
    
    if (room == Fredbear_Office && oCamera.CamAlpha != 1)
        draw_surface_ext(FredbearSurface, 0, 0, 1, 1, 0, c_white, 1);
    else
        draw_surface_ext(FredbearSurface, 0, 360, 1, -1, 0, c_white, 1);
    
    shader_reset();
}
else if (room == Fredbear_MonitorMinigame)
{
    global.MinigameWindowX = 160;
    global.MinigameWindowY = 36;
    global.MinigameWindowScale = 2;
    
    if (surface_exists(global.MinigameSurface))
        draw_surface_ext(global.MinigameSurface, global.MinigameWindowX, global.MinigameWindowY, global.MinigameWindowScale, global.MinigameWindowScale, 0, c_white, 1);
    
    draw_sprite(sMicrogameBorder, 0, 0, 0);
    shader_set(shDiscardGreen);
    draw_surface_ext(FredbearSurface, 0, 0, 1, 1, 0, c_white, 1);
    shader_reset();
}
else
{
    draw_surface(application_surface, 0, 0);
    draw_surface(global.UISurface, 0, 0);
    shader_set(shDiscardGreen);
    draw_surface(FredbearSurface, 0, 0);
    shader_reset();
}
