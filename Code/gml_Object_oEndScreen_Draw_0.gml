depth = 5;
draw_sprite(sprite_index, 0, 0, 0);

if (global.Route == UnknownEnum.Value_0)
{
    if (global.SalvagedMasks[0])
        draw_sprite(sprite_index, 3, 0, 0);
    
    if (global.SalvagedScraps[0])
        draw_sprite(sprite_index, 2, 0, 0);
    
    draw_sprite(sprite_index, global.Guard + 4, 0, 0);
    draw_sprite(sprite_index, 3, 0, 0);
}

if (global.Route == UnknownEnum.Value_1)
{
    draw_sprite(sprite_index, global.Guard + 4, 0, 0);
    draw_sprite(sprite_index, 3, 0, 0);
    
    if (!array_contains(global.SalvagedMasks, false))
        draw_sprite(sprite_index, 3, 0, 0);
    
    if (!array_contains(global.SalvagedScraps, false))
        draw_sprite(sprite_index, 2, 0, 0);
}

if (global.Route == UnknownEnum.Value_2 || global.Route == UnknownEnum.Value_3)
{
    draw_sprite(sprite_index, global.Guard + 2, 0, 0);
    draw_sprite(sprite_index, 1, 0, 0);
}

draw_set_alpha(1 - (Frame / 120));
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (Frame > 60 && input_check_pressed(UnknownEnum.Value_0) && !instance_exists(oResultsWindow))
{
    audio_play_sound(sfxSwoosh, 5, false);
    instance_create_depth(0, 0, 0, oResultsWindow);
}

Frame++;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
