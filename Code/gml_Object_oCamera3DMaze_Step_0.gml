image_angle = 0;
var Walls = oMazeWallParent;
var Crouching = (input_check(UnknownEnum.Value_25) && LockOnTarget == -4) || place_meeting(x, y, oMazeWallParent);

if (Crouching)
    Walls = oMazeWall;

var WindowCenterX = window_get_x() + round(window_get_width() / 2);
var WindowCenterY = window_get_y() + round(window_get_height() / 2);

if (window_has_focus() && !Perspective && LockOnTarget == -4)
{
    var MouseSensitivity = lerp(0, 1, global.Settings[3][1] / 4);
    CameraRotationHTarget += ((MouseSensitivity * (display_mouse_get_x() - WindowCenterX)) / -6);
    CameraRotationVTarget += ((MouseSensitivity * (display_mouse_get_y() - WindowCenterY)) / 6);
    display_mouse_set(WindowCenterX, WindowCenterY);
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
    
    if (instance_exists(oShopMenu))
        RotationOffset = 30;
    
    var VerticalRotation = point_direction(0, HeightOffset, distance_to_point(LockX, LockY), LockZ - (HeightOffset / 4)) % 360;
    
    if (VerticalRotation >= 90)
        VerticalRotation -= 360;
    
    var HorizontalRotation = point_direction(LockX, LockY, x, y) + RotationOffset;
    
    if (HorizontalRotation >= 180)
        HorizontalRotation -= 360;
    
    while (CameraRotationH >= 180)
        CameraRotationH -= 360;
    
    while (CameraRotationH <= -180)
        CameraRotationH += 360;
    
    CameraRotationH += (angle_difference(HorizontalRotation, CameraRotationH) / 5);
    CameraRotationV += (angle_difference(VerticalRotation, CameraRotationV) / 5);
    CameraRotationHTarget = CameraRotationH;
    CameraRotationVTarget = CameraRotationV;
}
else
{
    CameraRotationH += (angle_difference(CameraRotationHTarget, CameraRotationH) / 5);
    CameraRotationV += (angle_difference(CameraRotationVTarget, CameraRotationV) / 5);
}

var Walkspeed = 0.5;

if (Crouching)
    Walkspeed *= 0.5;
else if (input_check(UnknownEnum.Value_24))
    Walkspeed = 1;

Frame %= 180;
var MoveX = input_check(UnknownEnum.Value_5) - input_check(UnknownEnum.Value_3);
var MoveY = input_check(UnknownEnum.Value_4) - input_check(UnknownEnum.Value_2);

if (LockOnTarget != -4)
{
    MoveX = 0;
    MoveY = 0;
}

SpeedTurn += ((keyboard_check(vk_left) - keyboard_check(vk_right)) * -0.5);
SpeedX += (MoveY * lengthdir_x(Walkspeed, CameraRotationH));
SpeedY += (MoveY * lengthdir_y(Walkspeed, CameraRotationH));
SpeedX += (MoveX * lengthdir_x(Walkspeed, CameraRotationH + 90));
SpeedY += (MoveX * lengthdir_y(Walkspeed, CameraRotationH + 90));

if (place_meeting(x + SpeedX, y, Walls))
{
    while (!place_meeting(x + sign(SpeedX), y, Walls))
        x += sign(SpeedX);
    
    SpeedX = 0;
}

x += SpeedX;

if (place_meeting(x, y + SpeedY, Walls))
{
    while (!place_meeting(x, y + sign(SpeedY), Walls))
        y += sign(SpeedY);
    
    SpeedY = 0;
}

y += SpeedY;
CameraRotationH += SpeedTurn;
SpeedX *= 0.85;
SpeedY *= 0.85;
SpeedTurn *= 0.85;
var Height = HeightOffset + (abs(dsin(Frame)) * 8 * Walkspeed * global.Settings[3][2]);

if (!(MoveX == 0 && MoveY == 0) || Frame != 0)
    Frame += 9;

if (!(MoveX == 0 && MoveY == 0) && Frame == 90)
    audio_play_sound(sfxBump, 1, false, Walkspeed, 0, random_range(0.5, 0.6) * (48 / CustomHeight));

CameraRotationV = clamp(CameraRotationV, -89, 89);
var CamXToTarget = x - (lengthdir_x(128, CameraRotationH) * lengthdir_x(1, CameraRotationV));
var CamYToTarget = y - (lengthdir_y(128, CameraRotationH) * lengthdir_x(1, CameraRotationV));
var CamZToTarget = Height + lengthdir_y(128, CameraRotationV);
CameraX = x;
CameraY = y;
CameraZ = Height;
CameraXTo += ((CamXToTarget - CameraXTo) / 1);
CameraYTo += ((CamYToTarget - CameraYTo) / 1);
CameraZTo += ((CamZToTarget - CameraZTo) / 1);
HeightOffset += (((Crouching ? CustomSneakHeight : CustomHeight) - HeightOffset) / 5);

if (keyboard_check(vk_up))
    HeightOffset += 1;

if (keyboard_check(vk_down))
    HeightOffset -= 1;

Loudness = 512 * Walkspeed * Walkspeed * !(MoveX == 0 && MoveY == 0);

if (!instance_exists(oTextBox))
    LockOnTarget = -4;

if (PlayOpening == true)
{
    switch (room)
    {
        case MinigameMaze_1:
            LockX = x;
            LockY = y + 128;
            
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("PsychicFriendFredbear_Intro");
                global.Night = 1;
            }
            
            break;
        
        case MinigameMaze_2:
            LockX = x - 128;
            LockY = y;
            
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("PsychicFriendFredbear_2");
                global.Night = 2;
            }
            
            break;
        
        case MinigameMaze_3:
            LockX = x;
            LockY = y + 128;
            
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("PsychicFriendFredbear_3");
                global.Night = 3;
            }
            
            break;
        
        case MinigameMaze_4:
            LockX = x;
            LockY = y + 128;
            
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("PsychicFriendFredbear_4");
                global.Night = 4;
            }
            
            break;
        
        case MinigameMaze_5:
            LockX = x;
            LockY = y + 128;
            
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("PsychicFriendFredbear_5");
                global.Night = 5;
            }
            
            break;
    }
    
    LockOnTarget = instance_nearest(x, y, oInteraction_Animatronic);
    LockZ = 48;
    PlayOpening = false;
    randomize_animatronics();
}

with (oMaze_PropSolid)
{
    if (angle_difference(point_direction(other.x, other.y, x, y), other.CameraRotationH - 90) > 180)
        InView = false;
    else
        InView = true;
}

with (oMaze_PropWalkthrough)
{
    if (angle_difference(point_direction(other.x, other.y, x, y), other.CameraRotationH - 90) > 180)
        InView = false;
    else
        InView = true;
}

if (instance_position(x, y, oLoadZone) != CurrentLoadZone)
{
    CurrentLoadZone = instance_position(x, y, oLoadZone);
    
    with (CurrentLoadZone)
        activate_objects(true);
}

with (oMaze_Object)
    visible = InView * InZone;

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5,
    Value_24 = 24,
    Value_25
}
