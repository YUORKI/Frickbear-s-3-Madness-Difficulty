YOffset = 480;
Step = 0;

if (!variable_global_exists("GameRestarted"))
{
    global.GameRestarted = true;
    game_restart();
}

application_surface_draw_enable(true);
