var BodyX = 1192 + lerp(-104, 0, Position);
var BodyY = 758;
var BodyAngle = lerp(0, -40, Position);
var HeadX = BodyX + rot_x(0, -100, BodyAngle);
var HeadY = BodyY + rot_y(0, -100, BodyAngle);
var HeadAngle = lerp(0, -15, Position);
var ArmX = BodyX + rot_x(-26, -72, BodyAngle);
var ArmY = BodyY + rot_y(-26, -72, BodyAngle);
var ArmAngle = 0;
var OtherArmX = BodyX + rot_x(26, -72, BodyAngle);
var OtherArmY = BodyY + rot_y(26, -72, BodyAngle);
var OtherArmAngle = 120;

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadAngle * -1;
    DrawDepth = 33;
}

with (Body)
{
    x = BodyX;
    y = BodyY;
    image_angle = BodyAngle * -1;
    DrawDepth = 32;
}

with (ArmL)
{
    x = ArmX;
    y = ArmY;
    image_angle = ArmAngle * -1;
    DrawDepth = 31;
}

with (ArmR)
{
    x = OtherArmX;
    y = OtherArmY;
    image_angle = OtherArmAngle * -1;
    DrawDepth = 30;
}
