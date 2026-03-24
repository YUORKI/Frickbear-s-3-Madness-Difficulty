image_angle = 0;

if (window_has_focus() && !Perspective)
{
    var MouseSensitivity = lerp(0, 1, global.Settings[3][1] / 4);
    CameraRotationHTarget += ((MouseSensitivity * (display_mouse_get_x() - (display_get_width() / 2))) / -4);
    CameraRotationVTarget += ((MouseSensitivity * (display_mouse_get_y() - (display_get_height() / 2))) / 4);
    display_mouse_set(display_get_width() / 2, display_get_height() / 2);
}

CameraRotationVTarget = clamp(CameraRotationVTarget, -89, 89);

if (LockOnTarget != -4)
{
    var RotationOffset = 0;
    
    if (instance_exists(oSalvageSheet))
    {
        if (oSalvageSheet.Delete == false && oSalvageSheet.PageMode == 0)
            RotationOffset = -25;
    }
    
    show_debug_message(RotationOffset);
    var VerticalRotation = point_direction(0, HeightOffset, distance_to_point(LockX, LockY), LockZ) % 360;
    
    if (VerticalRotation >= 90)
        VerticalRotation -= 360;
    
    var HorizontalRotation = point_direction(LockX, LockY, x, y) + RotationOffset;
    
    if (HorizontalRotation >= 180)
        HorizontalRotation -= 360;
    
    while (CameraRotationH >= 180)
        CameraRotationH -= 360;
    
    while (CameraRotationH <= -180)
        CameraRotationH += 360;
    
    CameraRotationH += ((HorizontalRotation - CameraRotationH) / 5);
    CameraRotationV += ((VerticalRotation - CameraRotationV) / 5);
    CameraRotationHTarget = CameraRotationH;
    CameraRotationVTarget = CameraRotationV;
    show_debug_message(CameraRotationH);
    show_debug_message("Rotation Target: " + string(HorizontalRotation));
}
else
{
    CameraRotationH += ((CameraRotationHTarget - CameraRotationH) / 5);
    CameraRotationV += ((CameraRotationVTarget - CameraRotationV) / 5);
}

var Walkspeed = 1;
var MoveX = input_check(UnknownEnum.Value_5) - input_check(UnknownEnum.Value_3);
var MoveY = input_check(UnknownEnum.Value_4) - input_check(UnknownEnum.Value_2);

if (LockOnTarget != -4)
{
    MoveX = 0;
    MoveY = 0;
}

SpeedX += (MoveY * lengthdir_x(Walkspeed, CameraRotationH));
SpeedY += (MoveY * lengthdir_y(Walkspeed, CameraRotationH));
SpeedX += (MoveX * lengthdir_x(Walkspeed, CameraRotationH + 90));
SpeedY += (MoveX * lengthdir_y(Walkspeed, CameraRotationH + 90));
x += SpeedX;
y += SpeedY;
CameraRotationH += SpeedTurn;
SpeedX *= 0.85;
SpeedY *= 0.85;
SpeedTurn *= 0.85;
var Height = HeightOffset;
var CamXToTarget = x - (lengthdir_x(128, CameraRotationH) * lengthdir_x(1, CameraRotationV));
var CamYToTarget = y - (lengthdir_y(128, CameraRotationH) * lengthdir_x(1, CameraRotationV));
var CamZToTarget = Height + lengthdir_y(128, CameraRotationV);
CameraX = x;
CameraY = y;
CameraZ = Height;
CameraXTo += ((CamXToTarget - CameraXTo) / 1);
CameraYTo += ((CamYToTarget - CameraYTo) / 1);
CameraZTo += ((CamZToTarget - CameraZTo) / 1);

if (input_check_pressed(UnknownEnum.Value_10))
{
    Perspective = !Perspective;
    audio_play_sound(sfxBump, 10, false);
}

if (input_check_pressed(UnknownEnum.Value_11))
{
    ShowGuide = !ShowGuide;
    audio_play_sound(sfxBump, 10, false);
}

if (input_check(UnknownEnum.Value_0))
    HeightOffset += 4;

if (input_check(UnknownEnum.Value_25))
    HeightOffset -= 4;

if (input_check(UnknownEnum.Value_1) && !Transitioning)
{
    Transitioning = true;
    audio_play_sound(sfxBump, 10, false);
}

Loudness = 512 * Walkspeed * Walkspeed * !(MoveX == 0 && MoveY == 0);

if (!instance_exists(oTextBox))
    LockOnTarget = -4;

Frame += 1;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_10 = 10,
    Value_11,
    Value_25 = 25
}
