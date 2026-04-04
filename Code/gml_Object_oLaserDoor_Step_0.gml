var Alpha = 0.95 + (dsin(Timer * 2) * 0.05);

if (Timer < 30)
    image_alpha += ((Alpha - image_alpha) / 5);
else
    image_alpha = Alpha;

Timer += 1;
