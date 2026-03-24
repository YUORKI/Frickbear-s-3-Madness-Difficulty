x = 1163;
y = 585;
image_index = Frame / 2;

if (Frame == 0)
    reverb_sound(sfxFredbearGrowl2, 0, -200, false, 2);

Frame++;

if (Frame < 0)
    image_index = 0;

if ((Frame / 2) >= 99)
    instance_destroy();

if (Frame > 0 && Frame < 120)
    Shakitude += ((1 - Shakitude) / 5);
else
    Shakitude *= 0.9;

oCamera.ShakeX = random_range(Shakitude * -1, Shakitude);
oCamera.ShakeY = random_range(Shakitude * -1, Shakitude);
