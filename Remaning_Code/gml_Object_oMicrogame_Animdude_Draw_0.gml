if (Completed)
    WindowSize += ((0 - WindowSize) / 5);
else
    WindowSize += ((1 - WindowSize) / 10);

var InverseSize = 1 - WindowSize;
var WindowX = 160 + (160 * InverseSize);
var WindowY = 32 + (80 * InverseSize);
draw_surface_ext(AnimdudeSurf, WindowX, WindowY, WindowSize, WindowSize, 0, c_white, 0.8);
draw_sprite_stretched(sAnimdude_Window, 0, WindowX - 4, WindowY - 4, (320 * WindowSize) + 8, (160 * WindowSize) + 8);

if (Completed && round(WindowSize * 200) == 0)
    instance_destroy();
