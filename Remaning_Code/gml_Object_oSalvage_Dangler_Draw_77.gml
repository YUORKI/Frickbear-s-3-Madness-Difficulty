var AngleDiff = angle_difference(90 - image_angle, oCamera.CameraRotation);

if (!Tutorialize || AngleDiff > 120)
    exit;

set_target_to_ui();
var BubbleOffsetX = oCamera.x + lengthdir_y(128, image_angle + 193);
var BubbleOffsetY = oCamera.y + lengthdir_x(128, image_angle + 193);
var BubblePos = world_to_screen(BubbleOffsetX, BubbleOffsetY, Height, oCamera.ViewMat, oCamera.ProjMat);
draw_sprite_ext(sDanglerTutorial, Height < 240 && Grabbed, BubblePos[0], BubblePos[1], TutorialSize, TutorialSize, 0, c_white, 1);
show_debug_message(AngleDiff);
TutorialSize += (((AngleDiff < 45) - TutorialSize) / 5);
surface_reset_target();
