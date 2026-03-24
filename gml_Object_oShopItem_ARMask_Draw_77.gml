set_target_to_ui();
var SE1 = 1000;
var SE2 = 1100;
var SE3 = 1;
image_index = 15;
x += ((TargetX - x) / 5);
y += ((2 - y) / 5);

if (!Active && x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0))
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (instance_exists(oVanniMask))
        {
            error();
        }
        else
        {
            force_mask_off();
            Active = true;
            check_for_trophy();
            audio_play_sound(sfxClick, 10, false);
            audio_play_sound(sfxDigitalBootup, 10, false);
            instance_create_layer(832, 742, "Room", oVanniMask);
        }
    }
}
else if (Active)
{
    draw_outline(16777215);
}

draw_sprite(sprite_index, image_index, x, y);

if (Active)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_black, 0.5);
    draw_sprite_part_ext(sprite_index, image_index, 0, 0, 32, 32 - (32 * (Timer / 60)), x, y, 1, 1, c_black, 1);
    shader_reset();
    
    if (Timer <= 0)
    {
        with (oShopItem)
        {
            if (x > other.x)
                TargetX -= 32;
        }
        
        audio_play_sound(sfxShortCircuit, 5, false);
        instance_destroy();
    }
    
    Timer -= (global.NightSpeedup / 60);
    
    if (instance_exists(oVanniMask))
    {
        if (Timer > 5)
            oVanniMask.Alpha += (1 - oVanniMask.Alpha) / 10;
        else
            oVanniMask.Alpha = floor(Timer * 4) % 2;
    }
}

surface_reset_target();
