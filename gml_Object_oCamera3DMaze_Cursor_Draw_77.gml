set_target_to_ui();

if (!instance_exists(LastObject))
    LastObject = instance_nearest(x, y, oInteractionPoint);

if (place_meeting(x, y, oInteractionPoint) && !instance_exists(oTextBox))
{
    LastObject = instance_nearest(x, y, oInteractionPoint);
    NotificationOffset += ((0 - NotificationOffset) / 10);
    ReticleSize += ((1 - ReticleSize) / 5);
    
    if (place_meeting(x, y, oInteraction_Animatronic))
        Text = "Talk";
    else if (place_meeting(x, y, oInteraction_Escape))
        Text = "ESCAPE!";
    else
        Text = "Investigate";
    
    Frame++;
}
else
{
    NotificationOffset += ((96 - NotificationOffset) / 5);
    ReticleSize -= (ReticleSize / 10);
    Frame = 0;
}

var BubblePos = world_to_screen(LastObject.x, LastObject.y, LastObject.Height, oCamera3DMaze.ViewMat, oCamera3DMaze.ProjMat);
var DirectionToReticle = point_direction(LastObject.x, LastObject.y, oCamera3DMaze.x, oCamera3DMaze.y);

if (abs(angle_difference(oCamera3DMaze.CameraRotationH, DirectionToReticle)) < 90)
    draw_sprite_ext(sMazeReticle, 0, BubblePos[0], BubblePos[1], ReticleSize, ReticleSize, Frame * 3, c_white, 1);

draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
var XPosition = 224;
var YPosition = 264 + NotificationOffset;
draw_sprite_ext(sTextBox, 1, XPosition, YPosition, 3, 1.5, 0, c_white, 1);
draw_text_color(320, YPosition + 32, Text, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
draw_set_halign(fa_left);
surface_reset_target();
