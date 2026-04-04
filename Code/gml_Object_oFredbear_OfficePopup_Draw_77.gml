set_target_to_ui();
draw_sprite(sprite_index, 1, x, y);
draw_sprite(sFredbearAd, Ad, x + 6, y + 26);
var MouseX = device_mouse_x_to_gui(0) - x - 182;
var MouseY = device_mouse_y_to_gui(0) - y - 6;
var Generosity = 6;

if ((0 - Generosity) <= MouseX && (16 + Generosity) > MouseX && (0 - Generosity) <= MouseY && (14 + Generosity) > MouseY && mouse_check_button_pressed(mb_left))
{
    audio_play_sound(sfxClick, 10, false);
    instance_destroy();
}

movement();
surface_reset_target();
