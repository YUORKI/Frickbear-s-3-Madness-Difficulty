set_target_to_ui();
image_index = 17;
x += ((TargetX - x) / 5);
y += ((2 - y) / 5);

if (x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0))
    draw_outline(16777215);

draw_sprite(sprite_index, image_index, x, y);
surface_reset_target();
