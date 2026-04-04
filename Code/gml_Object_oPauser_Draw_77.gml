if (Paused)
{
    initialize_ui_surface();
    
    if (in_salvage_location())
    {
        shader_set(shRecolor);
        replace_color(13695200, 7389320, 5662772, 3354368, Palette[0], Palette[1], Palette[2], Palette[3]);
    }
    
    draw_sprite(Screenshot, 0, 0, 0);
    
    if (in_salvage_location())
    {
        shader_set(shGreenToWhite);
        draw_sprite(Screenshot, 0, 0, 0);
        shader_reset();
    }
    
    draw_set_alpha(0.75);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    shader_reset();
    surface_reset_target();
}
else if (Screenshot != undefined)
{
    sprite_delete(Screenshot);
}
