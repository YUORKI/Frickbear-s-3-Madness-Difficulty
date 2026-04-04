Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
Body = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
NumOnes = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
NumTens = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
Hook = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
MidArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
UpperArm = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);

with (Head)
    sprite_index = sNightmareFoxy_Body;

with (Body)
    sprite_index = sNightmareFoxy_Body;

with (NumOnes)
    sprite_index = sNightmareFoxy_Numbers;

with (NumTens)
    sprite_index = sNightmareFoxy_Numbers;

with (Hook)
    sprite_index = sNightmareFoxy_Arm;

with (MidArm)
    sprite_index = sNightmareFoxy_Arm;

with (UpperArm)
    sprite_index = sNightmareFoxy_Arm;

AI = 0;

function set_countdown()
{
    Countdown = round(lerp(35, 15, AI / 20)) * 60;
}

var OriginX = 0;
var OriginY = 0;
EntranceAnimFrame = 999;
set_countdown();
BodyOffset = -208;
HeadOffset = -208;
HeadRotation = 0;
ArmOffset = -512;
BodySpeed = 0;
HeadSpeed = 0;
HeadRotationSpeed = 0;
ArmSpeed = 0;
BodyTarget = BodyOffset;
HeadTarget = HeadOffset;
ArmTarget = 0;
