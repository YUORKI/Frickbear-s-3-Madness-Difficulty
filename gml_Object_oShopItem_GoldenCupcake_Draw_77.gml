set_target_to_ui();
image_index = 10;
x += ((TargetX - x) / 5);
y += ((2 - y) / 5);
var Mousey = !Active && x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0);

if (Mousey)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxBitCollect, 10, false);
        global.Tokens += floor(Value);
        
        with (oShopItem)
        {
            if (x > other.x)
                TargetX -= 32;
        }
        
        if (Value >= (OriginalValue + 40))
            get_trophy(UnknownEnum.Value_18);
        
        instance_destroy();
    }
}

draw_sprite(sprite_index, image_index, x, y);

if (Mousey)
{
    draw_set_halign(fa_left);
    draw_sprite(sCamButtonWide, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
    draw_text(device_mouse_x_to_gui(0) + 5, device_mouse_y_to_gui(0) + 1, "VALUE: " + string(floor(Value)) + " Tokens");
}

Value += (global.NightSpeedup / 10 / 60);
surface_reset_target();

enum UnknownEnum
{
    Value_18 = 18
}
