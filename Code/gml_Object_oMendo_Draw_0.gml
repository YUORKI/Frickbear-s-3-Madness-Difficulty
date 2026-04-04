if (!(global.CamUp && global.MonitorSystem == "Shop") || (instance_exists(oLolbit) && global.AILevels[UnknownEnum.Value_25] > 0) || kill_mendo())
{
    HappyFrames = 0;
    exit;
}

depth = -1;
var BodyRot = dsin(Timer) * 5;
var Wiggle = (dsin(WiggleFrame * 30) * (WiggleFrame * WiggleFrame)) / 500;
var HappyBounce = dsin(BounceFrames * 15) * (power(BounceFrames / 60, 8) * 48);
x = BaseX + lengthdir_x(12, Timer);
y = BaseY + lengthdir_y(16, Timer) + HappyBounce;
var NeckX = x + rot_x(-40, -94, BodyRot);
var NeckY = y + rot_y(-40, -94, BodyRot);
var NeckRot = (dsin(Timer - 15) * 10) + 15;
var HeadX = NeckX + rot_x(-64, -64, NeckRot);
var HeadY = NeckY + rot_y(-64, -64, NeckRot);
var HeadRot = (dsin(Timer - 45) * 15) + 15 + HeadOffset;
var JawExtension = lerp(16 + (dsin(Timer) * 16), 32, abs(HeadOffset / 60));
var JawX = HeadX + rot_x(0, JawExtension, HeadRot);
var JawY = HeadY + rot_y(0, JawExtension, HeadRot);
var JawRot = (dsin(Timer - 60) * 15) + 18 + HeadOffset;
var AntannaeX = HeadX + rot_x(12, -96, HeadRot);
var AntannaeY = HeadY + rot_y(12, -96, HeadRot);
var AntannaeRot = (dsin(Timer - 75) * 16) + 10 + HeadOffset + Wiggle;
var UpperArmX = x + rot_x(44, -72, BodyRot);
var UpperArmY = y + rot_y(44, -72, BodyRot);
var UpperArmRot = lerp(dsin(Timer - 30) * 8, 30, abs(ArmDirection - 360) / 120);
var LowerArmX = UpperArmX + rot_x(0, 128, UpperArmRot);
var LowerArmY = UpperArmY + rot_y(0, 128, UpperArmRot);
var LowerArmRot = ArmDirection;
var HandX = LowerArmX + rot_x(0, 112, LowerArmRot);
var HandY = LowerArmY + rot_y(0, 112, LowerArmRot);
var HandRot = LowerArmRot - 240 - 15;

if (!surface_exists(MendoSurf))
    MendoSurf = surface_create(330, 295);

surface_set_target(MendoSurf);
draw_clear_alpha(c_white, 0);
draw_sprite_ext(sMendoArm, 0, x + rot_x(-86, -82, BodyRot), y + rot_y(-86, -82, BodyRot), 1, 1, dsin(Timer - 30) * 8, c_white, 1);
draw_sprite_ext(sMendoBody, 0, x, y, 1, 1, BodyRot, c_white, 1);
draw_sprite_ext(sMendoArm, 0, UpperArmX, UpperArmY, 1, 1, UpperArmRot, c_white, 1);
draw_sprite_ext(sMendoHead, 2, NeckX, NeckY, 1, 1, NeckRot, c_white, 1);
draw_sprite_ext(sMendoHead, 3, AntannaeX, AntannaeY, 1, 1, AntannaeRot, c_white, 1);
draw_sprite_ext(sMendoHead, 1, JawX, JawY, 1, 1, JawRot, c_white, 1);
draw_sprite_ext(sMendoHead, 0, HeadX, HeadY, 1, 1, HeadRot, c_white, 1);

if (BounceFrames > 55)
{
    draw_sprite_ext(sMendoEye, 2, HeadX + rot_x(-48, -36, HeadRot), HeadY + rot_y(-48, -36, HeadRot), -1, 1, HeadRot, c_white, 1);
    draw_sprite_ext(sMendoEye, 2, HeadX + rot_x(50, -32, HeadRot), HeadY + rot_y(50, -32, HeadRot), 1, 1, HeadRot, c_white, 1);
}
else if (HappyFrames > 0)
{
    draw_sprite_ext(sMendoEye, 1, HeadX + rot_x(-48, -36, HeadRot), HeadY + rot_y(-48, -36, HeadRot), -1, 1, HeadRot, c_white, 1);
    draw_sprite_ext(sMendoEye, 1, HeadX + rot_x(50, -32, HeadRot), HeadY + rot_y(50, -32, HeadRot), 1, 1, HeadRot, c_white, 1);
}
else
{
    draw_sprite_ext(sMendoEye, 0, HeadX + rot_x(-48, -36, HeadRot), HeadY + rot_y(-48, -36, HeadRot), -1, 1, HeadRot + (Timer * 3), c_white, 1);
    draw_sprite_ext(sMendoEye, 0, HeadX + rot_x(50, -32, HeadRot), HeadY + rot_y(50, -32, HeadRot), 1, 1, HeadRot + (Timer * -3) + 45, c_white, 1);
}

draw_sprite_ext(sMendoArm, 0, LowerArmX, LowerArmY, 1, 1, LowerArmRot, c_white, 1);
draw_sprite_ext(sMendoHand, 0, HandX, HandY, 1, 1, HandRot, c_white, 1);
surface_reset_target();

if (!surface_exists(MainSurf))
    MainSurf = surface_create(330, 295);

surface_set_target(MainSurf);
draw_clear_alpha(c_white, 0);
draw_sprite_tiled(sMendoGrid, 0, 0 - (floor(Timer / 2) % 256), 0 - (floor(Timer / 2) % 256));
draw_sprite_ext(sMendoGear, 0, 320, 0, 1, 1, GearDirection, c_white, 1);
draw_sprite_ext(sMendoGear, 0, 0, 295, 1, 1, GearDirection, c_white, 1);
var Color = 3866580;
var Weight = 4;
shader_set(shFlash);

repeat (2)
{
    for (var i = -45; i < 360; i += 15)
        draw_surface_ext(MendoSurf, 0 + round(lengthdir_x(Weight, i)), 0 + round(lengthdir_y(Weight, i)), 1, 1, 0, Color, 1);
    
    Color = 0;
    Weight = 2;
}

shader_reset();
draw_surface(MendoSurf, 0, 0);

if (AnimationFrame == 120 || HappyFrames == MaxHappyFrames)
{
    AnimationFrame = 0;
    HeadPosition = (HeadPosition + irandom_range(1, 4)) % 5;
    
    if (HappyFrames == MaxHappyFrames)
    {
        HeadPosition = 0;
        AnimationFrame -= (60 - (Timer % 60));
    }
    
    var PlannedOffset = (HeadPosition - 3) * 15;
    
    if (abs(TargetOffset - PlannedOffset) > 0)
        audio_play_sound(sfxServo, 2, false, 0.25);
    
    WiggleFrame = abs(TargetOffset - PlannedOffset) * 2;
    TargetOffset = PlannedOffset;
}

if ((Timer % 60) == 0)
    GearDirectionTarget += 45;

if (WiggleFrame > 0)
    WiggleFrame--;

OffsetSpeed = lerp(OffsetSpeed, (TargetOffset - HeadOffset) * 0.3, 0.2);
HeadOffset += OffsetSpeed;
GearSpeed = lerp(GearSpeed, (GearDirectionTarget - GearDirection) * 0.3, 0.2);
GearDirection += GearSpeed;
ArmSpeed = lerp(ArmSpeed, (ArmDirectionTarget - ArmDirection) * 0.3, 0.2);
ArmDirection += ArmSpeed;

if (HappyFrames == MaxHappyFrames || HappyFrames == 5)
    BounceFrames = 60;

if (HappyFrames > 0)
{
    ArmDirectionTarget = 240;
    HappyFrames--;
}
else
{
    ArmDirectionTarget = 360;
}

BounceFrames = max(BounceFrames - 1, 0);
Timer++;
AnimationFrame++;
surface_reset_target();
draw_surface(MainSurf, oCameraUI.x + 301, oCameraUI.y + 28);
surface_free(MendoSurf);
surface_free(MainSurf);

enum UnknownEnum
{
    Value_25 = 25
}
