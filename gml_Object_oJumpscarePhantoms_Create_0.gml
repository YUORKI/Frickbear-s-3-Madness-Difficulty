event_inherited();
Frame = 0;
OriginX = 0;
JumpX = 640;
JumpY = 720;
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
jump_origin(0, -1);

with (oCamera)
    Freeze = true;

JumpscareID = 0;
FreezeframeSurface = -1;
Freezeframe = undefined;
JumpscareDuration = 90;
FadeoutDuration = 120;
