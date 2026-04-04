var BodyX = x;
var BodyY = y + (dsin(Frame * 4) * 8) + YOffset;
var BodyA = 0;
var HeadX = BodyX + rot_x(0, 160, BodyA);
var HeadY = ((BodyY + rot_y(0, 160, BodyA)) - (dsin(Frame * 4) * 8)) + (dsin((Frame * 4) - 30) * 15) + (YOffset * 0.1);
var HeadA = HeadRotation;
var HeadImage = (floor(Frame / 4) % 2) + 1;

if (!WoahMyHeadsSpinning)
    HeadImage = 0;

var LArmX = BodyX + rot_x(-108, 140, BodyA);
var LArmY = BodyY + rot_y(-108, 140, BodyA);
var LArmA = dsin((Frame * 4) - 45) * -8;
var RArmX = BodyX + rot_x(108, 140, BodyA);
var RArmY = BodyY + rot_y(108, 140, BodyA);
var RArmA = dsin((Frame * 4) - 45) * 8;
var LTennaX = HeadX + rot_x(-31, -85, HeadA);
var LTennaY = HeadY + rot_y(-31, -85, HeadA);
var LTennaA = LArmA + HeadA;
var RTennaX = HeadX + rot_x(31, -85, HeadA);
var RTennaY = HeadY + rot_y(31, -85, HeadA);
var RTennaA = RArmA + HeadA;
draw_sprite_ext(sLolzHax_Arm, 0, LArmX, LArmY, 1, 1, LArmA, c_white, 1);
draw_sprite_ext(sLolzHax_Arm, 0, RArmX, RArmY, -1, 1, RArmA, c_white, 1);
draw_sprite_ext(sLolzHax_Body, 0, BodyX, BodyY, 1, 1, BodyA, c_white, 1);
draw_sprite_ext(sLolzHax_Antenna, 0, LTennaX, LTennaY, 1, 1, LTennaA, c_white, 1);
draw_sprite_ext(sLolzHax_Antenna, 0, RTennaX, RTennaY, -1, 1, RTennaA, c_white, 1);
draw_sprite_ext(sLolzHax_Head, HeadImage, HeadX, HeadY, 1, 1, HeadA, c_white, 1);
YOffset += YOffsetSpeed;

if (!SelectionMade)
    YOffsetSpeed = lerp(YOffsetSpeed, (0 - YOffset) * 0.1, 0.2);
else
    YOffsetSpeed = lerp(YOffsetSpeed, (-360 - YOffset) * 0.2, 0.05);

HeadRotation += HeadRotationSpeed;
HeadRotationSpeed = lerp(HeadRotationSpeed, (0 - HeadRotation) * 0.25, 0.1);

if (Frame > 45)
    WoahMyHeadsSpinning = false;

if (keyboard_check_pressed(vk_space))
{
    YOffsetSpeed = 16;
    SelectionMade = true;
}

if (YOffset < -360 && SelectionMade)
{
}

Frame++;
