var CursorAngle = oCamera3DMaze_Cursor.image_angle + 90;
var AngleDiff = abs(angle_difference(CursorAngle, image_angle));

if (place_meeting(x, y, oCamera3DMaze_Cursor) && AngleDiff < 45)
{
    with (oInteraction_Disappearing)
    {
        if (CanAppear)
            Disappearing = true;
    }
}
