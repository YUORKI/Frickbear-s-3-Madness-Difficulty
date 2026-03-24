image_index = 0;
JumpX += ((320 - JumpX) / 5);
JumpY += ((180 - JumpY) / 5);
SizeBody += (((1.25 - SizeBody) / 10) + 0.005);
SizeHead += (((1.5 - SizeHead) / 16) + 0.01);
Frame += 1;

if (Frame == JumpscareDuration)
{
    with (oCamera)
        Freeze = false;
    
    global.Temperature += 10;
}

if (Frame >= (JumpscareDuration + FadeoutDuration))
    instance_destroy();
