if (instance_exists(oFredbearManager))
    instance_destroy();

global.MinigameWindowX = 160;
global.MinigameWindowY = 36;
global.MinigameWindowScale = 2;

if (surface_exists(global.MinigameSurface))
    draw_surface_ext(global.MinigameSurface, global.MinigameWindowX, global.MinigameWindowY, global.MinigameWindowScale, global.MinigameWindowScale, 0, c_white, 1);

draw_sprite(sMicrogameBorder, 0, 0, 0);
