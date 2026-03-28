initialize_ui_surface();
draw_set_alpha(TransitionAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
TransitionAlpha = max(TransitionAlpha - (1/30), 0);
surface_reset_target();
