if (Mode == "Wait")
    exit;

set_target_to_ui();
var Side = -1;

if (DesiredCandy == 1)
    Side = 1;

var BubblePos = world_to_screen(oCamera.x - (80 * Side), oCamera.y - 256, 340, oCamera.ViewMat, oCamera.ProjMat);
draw_sprite_ext(sDreadbearBubble, DesiredCandy, BubblePos[0], BubblePos[1], BubbleSize * Side, BubbleSize, 0, c_white, 1);
surface_reset_target();
