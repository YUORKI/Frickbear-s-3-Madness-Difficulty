x = oCamera3DMaze.x;
y = oCamera3DMaze.y;
depth = 4;

repeat (round(lengthdir_x(72, oCamera3DMaze.CameraRotationV)))
{
    var XShift = lengthdir_x(-1, oCamera3DMaze.CameraRotationH);
    var YShift = lengthdir_y(-1, oCamera3DMaze.CameraRotationH);
    
    if (place_meeting(x + XShift, y + YShift, oInteractionBarrier))
        break;
    
    x += XShift;
    y += YShift;
}

image_angle = oCamera3DMaze.CameraRotationH + 90;
image_index = 0;
var NearestPoint = instance_nearest(x, y, oInteractionPoint);

if (place_meeting(x, y, NearestPoint) && input_check_pressed(UnknownEnum.Value_0) && !instance_exists(oTextBox))
{
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text(NearestPoint.Text);
    
    with (oCamera3DMaze)
    {
        LockOnTarget = NearestPoint;
        LockX = NearestPoint.x;
        LockY = NearestPoint.y;
        LockZ = NearestPoint.Height;
    }
}

enum UnknownEnum
{
    Value_0
}
