var BubblePos = world_to_screen(x, y, 128, oCamera3DMaze.ViewMat, oCamera3DMaze.ProjMat);
draw_sprite(sCupcake, 0, BubblePos[0], BubblePos[1]);
show_debug_message(BubblePos);
