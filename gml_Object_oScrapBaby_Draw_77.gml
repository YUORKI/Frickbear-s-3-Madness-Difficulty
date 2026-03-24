set_target_to_ui();

if (ShowWarning && (floor(Timer / 30) % 2) == 0)
    draw_sprite(sMarionetteWarning, 1, 220, 336);

surface_reset_target();
