event_inherited();
Frame = 0;
OriginX = 0;
JumpX = 640;
JumpY = 720;
JumpAngle = 0;
SizeBody = 0.25;
SizeHead = 0.01;
SizeBody = 0;
Frame = 0;

function jump_origin(arg0, arg1)
{
    OriginX = arg0;
    JumpX = 320 + (320 * arg0);
    JumpY = 180 - (540 * arg1);
    JumpAngle = arg0 * 15;
    SizeBody = 0.25;
    SizeHead = 0.01;
    Frame = 0;
}

JawOffset = 0;
Side = 0;
SideVertical = -1;
Alpha = 1;
JumpscareID = 0;
