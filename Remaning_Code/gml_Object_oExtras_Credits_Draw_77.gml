set_target_to_ui();
draw_rectangle_color(0, 0, 640, 180 * TransitionAmount, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 360 - (180 * TransitionAmount), 640, 360, c_black, c_black, c_black, c_black, false);
surface_reset_target();
