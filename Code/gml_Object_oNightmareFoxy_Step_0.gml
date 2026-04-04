var WallOriginX = 576;
var WallOriginY = 448;

if (AI <= 0)
{
    ArmTarget = -512;
    Countdown = 99999;
    EntranceAnimFrame = 999;
}
else if (Countdown == 99999)
{
    set_countdown();
    ArmTarget = 0;
    simple_sound(sfxEndoCreak, -500, 100, false, 1);
}

ArmSpeed = lerp(ArmSpeed, (ArmTarget - ArmOffset) * 0.1, 0.2);
ArmOffset += ArmSpeed;
var UpperArmX = 140 + WallOriginX;
var UpperArmY = -16 + WallOriginY + ArmOffset;
var UpperArmAngle = (dsin(Countdown) * 4) - 5;
var MidArmX = UpperArmX + rot_x(14, 170, UpperArmAngle);
var MidArmY = UpperArmY + rot_y(14, 170, UpperArmAngle);
var MidArmAngle = dsin(Countdown - 15) * 8;
var HookX = MidArmX + rot_x(-10, 80, MidArmAngle);
var HookY = MidArmY + rot_y(-10, 80, MidArmAngle);
var HookAngle = (dsin(Countdown - 30) * 16) + 5;
var NumerOnesX = HookX + rot_x(-19, 93, HookAngle);
var NumerOnesY = HookY + rot_y(-19, 93, HookAngle);
var NumerTensX = HookX + rot_x(-36, 89, HookAngle);
var NumerTensY = HookY + rot_y(-36, 89, HookAngle);
WallOriginX = 1088;
var LingerTime = 120;

if (EntranceAnimFrame < LingerTime)
    BodySpeed = lerp(BodySpeed, (BodyTarget - BodyOffset) * 0.5, 0.25);
else
    BodySpeed = lerp(BodySpeed, (BodyTarget - BodyOffset) * 0.2, 0.1);

BodyOffset += BodySpeed;

if (EntranceAnimFrame < LingerTime)
    HeadSpeed = lerp(HeadSpeed, (HeadTarget - HeadOffset) * 0.2, 0.1);
else
    HeadSpeed = lerp(HeadSpeed, (HeadTarget - HeadOffset) * 0.2, 0.05);

HeadOffset += HeadSpeed;
HeadRotationSpeed = lerp(HeadRotationSpeed, (0 - HeadRotation) * 0.25, 0.1);
HeadRotation += HeadRotationSpeed;

if (EntranceAnimFrame < LingerTime && Countdown == 0 && !wearing_mask())
    jumpscare(UnknownEnum.Value_54, 0);

if (EntranceAnimFrame == LingerTime)
{
    BodyTarget = -208;
    HeadTarget = -208;
    BodySpeed = 32;
    HeadSpeed = 32;
    ArmTarget = 0;
    set_countdown();
}

if (EntranceAnimFrame > LingerTime && BodyOffset < BodyTarget)
    BodyOffset = BodyTarget;

if (EntranceAnimFrame > LingerTime && HeadOffset < HeadTarget)
    HeadOffset = HeadTarget;

var BodyX = 256 + WallOriginX;
var BodyY = 144 + WallOriginY + BodyOffset;
var BodyAngle = 180;
var HeadX = BodyX;
var HeadY = 144 + WallOriginY + HeadOffset;
var HeadAngle = HeadRotation;
var Seconds = ceil(Countdown / 60);
var Ones = Seconds % 10;
var Tens = floor(Seconds / 10);

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadAngle * -1;
    image_index = 1;
}

with (Body)
{
    x = BodyX;
    y = BodyY;
    image_angle = BodyAngle * -1;
    image_index = 0;
}

with (NumOnes)
{
    x = NumerOnesX;
    y = NumerOnesY;
    image_angle = HookAngle * -1;
    image_index = Ones;
}

with (NumTens)
{
    x = NumerTensX;
    y = NumerTensY;
    image_angle = HookAngle * -1;
    image_index = Tens;
}

with (Hook)
{
    x = HookX;
    y = HookY;
    image_angle = HookAngle * -1;
    image_index = 2;
}

with (MidArm)
{
    x = MidArmX;
    y = MidArmY;
    image_angle = MidArmAngle * -1;
    image_index = 1;
}

with (UpperArm)
{
    x = UpperArmX;
    y = UpperArmY;
    image_angle = UpperArmAngle * -1;
    image_index = 0;
}

if (Countdown > 0 && AI > 0)
{
    if ((Countdown % 60) == 59)
        simple_sound(sfxClockTicking, 400, 200, false, (Countdown <= 600) ? 6 : 2, 15, (Countdown <= 600) ? 1.25 : 1);
    
    if (Countdown <= 600 && !audio_is_playing(sfxClockTickdown))
        simple_sound(sfxClockTickdown, -500, 250, true, 0.3);
    
    Countdown--;
    
    if (Countdown == 0)
    {
        HeadRotation = 180;
        BodySpeed = 0;
        HeadSpeed = 0;
        HeadRotationSpeed = -90;
        ArmSpeed = 0;
        BodyTarget = 0;
        HeadTarget = 128;
        ArmTarget = -512;
        EntranceAnimFrame = 0;
        audio_play_sound(sfxWindowScare, 10, false);
        audio_stop_sound(sfxClockTickdown);
    }
}

EntranceAnimFrame++;

enum UnknownEnum
{
    Value_54 = 54
}
