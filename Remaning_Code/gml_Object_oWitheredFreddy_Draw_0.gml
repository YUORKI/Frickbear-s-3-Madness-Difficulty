var WallOriginX = 1088;
var WallOriginY = 448;
var TorsoX = WallOriginX + 256 + ((Direction * Frame) / 2);
var TorsoY = (WallOriginY + 276) - abs(dsin(Frame * 3) * 6);
var TorsoA = ((dsin((Frame - 15) * 6) * 4) - 25) * Direction;
var HeadX = TorsoX + rot_x(20 * Direction, -70, TorsoA);
var HeadY = TorsoY + rot_y(20 * Direction, -70, TorsoA);
var HeadA = ((dsin((Frame - 30) * 6) * 4) + 20) * Direction;
var JawA = ((dsin((Frame - 30) * 6) * -2) + 5) * Direction;
var FrontArmX = TorsoX + rot_x(-20 * Direction, -43, TorsoA);
var FrontArmY = TorsoY + rot_y(-20 * Direction, -43, TorsoA);
var FrontArmA = (dsin((Frame - 30) * 6) * Direction) - (15 * Direction);
var BackArmX = TorsoX + rot_x(22 * Direction, -40, TorsoA);
var BackArmY = TorsoY + rot_y(22 * Direction, -40, TorsoA);
var BackArmA = FrontArmA + (15 * Direction);
var SDirection = Direction;

with (ArmBack)
{
    x = BackArmX;
    y = BackArmY;
    image_xscale = SDirection;
    image_angle = BackArmA * -1;
}

with (Torso)
{
    x = TorsoX;
    y = TorsoY;
    image_xscale = SDirection;
    image_angle = TorsoA * -1;
}

with (Jaw)
{
    x = HeadX;
    y = HeadY;
    image_xscale = SDirection;
    image_angle = JawA * -1;
}

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_xscale = SDirection;
    image_angle = HeadA * -1;
}

with (ArmFront)
{
    x = FrontArmX;
    y = FrontArmY;
    image_xscale = SDirection;
    image_angle = FrontArmA * -1;
}
