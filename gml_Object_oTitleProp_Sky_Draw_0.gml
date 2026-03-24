depth = 256;
image_xscale = 99;
image_yscale = 99;
draw_self();
y = (y + 0.25) % 512;

repeat (8)
    instance_create_depth(oCameraTitleScreen.x + irandom_range(-64, 64), oCameraTitleScreen.y + irandom_range(-64, 64), 160, oRaindrop);
