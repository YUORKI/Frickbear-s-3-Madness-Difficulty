if (Frame >= 5 && Height < 360)
{
    with (instance_create_depth(320 - (320 * Side), Height, oCamera.depth - 1, oSalvage_Tangler))
        image_angle = (random_range(2, -10) * other.Side) + (90 - (other.Side * 90));
    
    audio_play_sound(sfxSalvage_WireDrop, 2, false, 1, Side / 2, random_range(0.9, 1.1));
    Side *= -1;
    Height += irandom_range(32, 40);
    Frame = 0;
}

Frame++;

if (Frame == 25)
{
    with (oSalvage_Tangler)
    {
        Retreating = true;
        DistSpeed = 15;
    }
    
    audio_play_sound(sfxSalvage_Pull, 5, false);
}

if (Frame == 30)
{
    with (oSalvage)
        salvage_jumpscare(0);
}

if (Frame <= 30)
{
    global.Tools.Doors = [0.1, 0.1];
    global.Tools.Camera = 0.1;
    global.Tools.Mask = 0.1;
    global.Tools.Flashlight = 0.1;
}

if (Frame > 120)
{
    instance_destroy();
    instance_destroy(oSalvage_Tangler);
}
