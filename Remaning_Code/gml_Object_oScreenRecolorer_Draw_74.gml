shader_set(shRecolor);
var Pal = Palettes[CurrentPalette];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);

if (surface_exists(application_surface))
    draw_surface(application_surface, 0, 0);
