set_target_to_ui();
image_index = 1;
x += ((TargetX - x) / 5);
y += ((2 - y) / 5);

if (!Active && x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0))
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        Active = true;
        check_for_trophy();
        audio_play_sound(sfxClick, 10, false);
    }
}
else if (Active)
{
    draw_outline(16777215);
}

draw_sprite(sprite_index, 1, x, y);

if (Active)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_black, 0.5);
    draw_sprite_part_ext(sprite_index, image_index, 0, 0, 32, 32 - (32 * (Timer / 60)), x, y, 1, 1, c_black, 1);
    shader_reset();
    global.Temperature = max(global.Temperature - 1, oCamera.MinTemperature);
    Timer -= (global.NightSpeedup / 60);
    
    if (Timer <= 0)
    {
        with (oShopItem)
        {
            if (x > other.x)
                TargetX -= 32;
        }
        
        instance_destroy();
    }
}

surface_reset_target();
