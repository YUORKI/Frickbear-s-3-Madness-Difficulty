shader_set(shRecolor);
var Pal;

if (instance_exists(oCamera3DMaze))
    Pal = oCamera3DMaze.Palettes[oCamera3DMaze.CurrentPalette];
else
    Pal = [16777215, 10461087, 1248964, 0];

replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
set_target_to_ui();

if (instance_exists(oCamera3DMaze) || room == TitleScreenMap)
    draw_everything();

surface_reset_target();
shader_reset();
