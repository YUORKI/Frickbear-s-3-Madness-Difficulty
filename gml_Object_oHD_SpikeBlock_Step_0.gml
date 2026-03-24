if (!GotSpikes)
{
    Spike = instance_place(x, y, oHD_Spike);
    Spike.depth = depth + 1;
    GotSpikes = true;
    Timer = Variables.BaseTimer;
}

if (Timer > Variables.SafeFrames)
    image_index = 1;
else if (Timer > (Variables.SafeFrames - 45))
    image_index = 1 + (floor(Timer / 4) % 2);
else
    image_index = 0;

with (Spike)
{
    if (other.Timer > other.Variables.SafeFrames)
    {
        x += (((other.x + 8 + lengthdir_x(16, image_angle + 90)) - x) / 4);
        y += (((other.y + 8 + lengthdir_y(16, image_angle + 90)) - y) / 4);
    }
    else
    {
        x += (((other.x + 8) - x) / 2);
        y += (((other.y + 8) - y) / 2);
    }
    
    depth = other.depth + 1;
}

Timer = (Timer + 1) % (Variables.SpikeFrames + Variables.SafeFrames);
