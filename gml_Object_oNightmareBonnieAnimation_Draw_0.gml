XOffset += XSpeed;
XSpeed += 0.85;
var XPosition = 1344 + ((-348 + XOffset) * Side);
var YPosition = 704;
var AnglePosition = XSpeed * 1.5 * Side;
var LowerEarR_X = XPosition + rot_x(-19 * Side, -76, AnglePosition);
var LowerEarR_Y = YPosition + rot_y(-19 * Side, -76, AnglePosition);
var LowerEar_R = AnglePosition * 1.25;
var LowerEarL_X = XPosition + rot_x(-51 * Side, -60, AnglePosition);
var LowerEarL_Y = YPosition + rot_y(-51 * Side, -60, AnglePosition);
var UpperEarR_X = LowerEarR_X + rot_x(-20 * Side, -47, LowerEar_R);
var UpperEarR_Y = LowerEarR_Y + rot_y(-20 * Side, -47, LowerEar_R);
var UpperEarL_X = LowerEarL_X + rot_x(-20 * Side, -47, LowerEar_R);
var UpperEarL_Y = LowerEarL_Y + rot_y(-20 * Side, -47, LowerEar_R);
var UpperEar_R = (AnglePosition * -1.5) + (30 * Side);
var Arm_X = XPosition - (XOffset * 0.25);
var Arm_Y = YPosition + 64;
var Arm_R = (30 * Side) + (AnglePosition * 1.5);

with (UpperEarL)
{
    x = UpperEarL_X;
    y = UpperEarL_Y;
    image_angle = UpperEar_R * -1;
    image_xscale = other.Side;
}

with (UpperEarR)
{
    x = UpperEarR_X;
    y = UpperEarR_Y;
    image_angle = UpperEar_R * -1;
    image_xscale = other.Side;
}

with (LowerEarL)
{
    x = LowerEarL_X;
    y = LowerEarL_Y;
    image_angle = LowerEar_R * -1;
    image_xscale = other.Side;
}

with (LowerEarR)
{
    x = LowerEarR_X;
    y = LowerEarR_Y;
    image_angle = LowerEar_R * -1;
    image_xscale = other.Side;
}

with (Arm)
{
    x = Arm_X;
    y = Arm_Y;
    image_angle = Arm_R * -1;
    image_xscale = other.Side;
}

with (Head)
{
    x = XPosition;
    y = YPosition;
    image_angle = AnglePosition * -1;
    image_xscale = other.Side;
}

if (XOffset > 64)
    instance_destroy(self);
