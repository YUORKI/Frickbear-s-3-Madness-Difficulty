shader_set(shRecolor);

if (FadeVal < 0)
    replace_color(Pal[0], Pal[1], Pal[2], Pal[3], col(0), col(1), col(2), col(3));
else
    replace_color(Pal[3], Pal[2], Pal[1], Pal[0], col(3), col(2), col(1), col(0));

draw_sprite(sNightmareGameBorder, 0, 320, 360);

if (surface_exists(global.MinigameSurface))
    draw_surface_ext(global.MinigameSurface, 160, 36, 2, 2, 0, c_white, 1);

shader_reset();
draw_set_alpha(Darkness);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
