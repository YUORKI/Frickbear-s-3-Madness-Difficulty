shader_set(shRecolor);
var Pal = Palettes[CurrentPalette];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_surface(global.UISurface, 0, 0);
shader_set(shGreenToWhite);
draw_surface(global.UISurface, 0, 0);
shader_reset();

if (keyboard_check_pressed(vk_alt) && global.DevMode)
    CurrentPalette = (CurrentPalette + 1) % array_length(Palettes);
