x = 320;
y = ((480 - Frame) / 2) - 200;
image_angle = 0;
HeightOffset = 280;
CameraRotationH = -90;
CameraRotationV = 89.9;
var Walkspeed = 0.5;
var MoveX = input_check(UnknownEnum.Value_5) - input_check(UnknownEnum.Value_3);
var MoveY = input_check(UnknownEnum.Value_4) - input_check(UnknownEnum.Value_2);
SpeedX += (MoveY * lengthdir_x(Walkspeed, CameraRotationH));
SpeedY += (MoveY * lengthdir_y(Walkspeed, CameraRotationH));
SpeedX += (MoveX * lengthdir_x(Walkspeed, CameraRotationH + 90));
SpeedY += (MoveX * lengthdir_y(Walkspeed, CameraRotationH + 90));
x += SpeedX;
y += SpeedY;
SpeedX *= 0.85;
SpeedY *= 0.85;
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

if (keyboard_check_pressed(vk_control))
    Perspective = !Perspective;

if (keyboard_check_pressed(ord("R")))
    room_restart();

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5
}
