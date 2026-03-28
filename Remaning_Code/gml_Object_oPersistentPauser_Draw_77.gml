if (Paused)
{
    initialize_ui_surface();
    draw_set_alpha(1);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    surface_reset_target();
}
else if (Screenshot != undefined)
{
    sprite_delete(Screenshot);
}
