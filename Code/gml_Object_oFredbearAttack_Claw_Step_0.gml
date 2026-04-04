YOffset = max(YOffset, 0);
x = 1344 + round(random_range(-0.6, 0.6)) + (512 * Side);
y = 576 + YOffset + round(random_range(-0.6, 0.6));

with (Face)
{
    sprite_index = sFredbearDoorHead;
    x = other.x;
    y = 650 + (dsin(other.Frame * 90) * 4) + (other.YOffset / 4);
    image_xscale = 0.75;
    image_yscale = 0.75;
    image_index = clamp(round((other.Frame - 1.5) * 11), 0, 11);
    DrawDepth = 10;
}

YOffset += (YSpeed - 1);
YSpeed *= 0.75;

if ((input_check_pressed(UnknownEnum.Value_8) && Side == -1) || (input_check_pressed(UnknownEnum.Value_9) && Side == 1))
    YSpeed += lerp(6.5, 5, Difficulty);

if (YOffset > 200)
{
    audio_stop_sound(sfxFredbearDoor);
    YSpeed = 5;
    layer = layer_get_id("Behind_Wall");
    Active = false;
    global.Doors[sign_to_binary(Side)] = true;
    global.Tools.Doors[sign_to_binary(Side)] = 1/30;
    KillFrames++;
    
    if (KillFrames > 30)
        instance_destroy();
}
else
{
    layer = layer_get_id("OnWall");
    
    if (YOffset == 0)
        TimeUntilKill -= (1/30);
    else
        TimeUntilKill -= 0.016666666666666666;
    
    if (TimeUntilKill <= 0)
        jumpscare(UnknownEnum.Value_55);
}

show_debug_message(YOffset);
Frame += (1/30);
image_index = clamp(round(Frame * 11), 0, 11);

enum UnknownEnum
{
    Value_8 = 8,
    Value_9,
    Value_55 = 55
}
