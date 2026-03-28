image_index = abs(floor(oAnimdude_Player.x / 32) % 2);

if (Fallspeed != 0)
    image_index = 2;

y += Fallspeed;

if (y > 256)
    instance_destroy();
