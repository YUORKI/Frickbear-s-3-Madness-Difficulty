Size = 2;
CurrentAnimation = irandom(floor(sprite_get_number(sTVAnimations) / 2) - 1);
Frame = 0;
TVSurf = -1;

function fx(arg0, arg1)
{
    arg0 *= -1;
    return round(x + (((arg0 * dcos(image_angle * -1)) - (arg1 * dsin(image_angle * -1))) * Size));
}

function fy(arg0, arg1)
{
    arg0 *= -1;
    return round(y + (((arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1))) * Size));
}

function fz(arg0)
{
    return round(depth + (arg0 * Size));
}

TVOn = false;
HeightOffset = 0;
OffsetSpeed = 0;
BaseAngle = image_angle;
