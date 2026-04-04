event_inherited();

if (place_meeting(x, y - 1, oHD_Guard) && !Falling)
{
    Falling = true;
    Shakiness = 1.49;
    
    with (instance_create_depth(x, y, depth, oHD_Respawner))
    {
        Object = other.object_index;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
}

if (Falling)
    Frame += 1;

if (Frame > 0)
{
    XOffset = round(random_range(Shakiness * -1, Shakiness));
    YOffset = round(random_range(Shakiness * -1, Shakiness));
    Shakiness -= (Shakiness / 50);
}
