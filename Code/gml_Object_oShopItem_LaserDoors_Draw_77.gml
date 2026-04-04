set_target_to_ui();
var SE1 = 1000;
var SE2 = 1100;
var SE3 = 1;
image_index = 3;
x += ((TargetX - x) / 5);
y += ((2 - y) / 5);

if (!Active && x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0))
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (instance_exists(oLaserDoor))
        {
            error();
        }
        else
        {
            DoorStates = [global.Doors[0], global.Doors[1]];
            Active = true;
            check_for_trophy();
            audio_play_sound(sfxClick, 10, false);
            instance_create_layer(832, 742, "OnWall", oLaserDoor);
            instance_create_layer(1856, 742, "OnWall", oLaserDoor);
            
            if (global.Doors[0])
                simple_sound(sfxDoor, -400, 0, false);
            
            if (global.Doors[1])
                simple_sound(sfxDoor, 400, 0, false);
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
    global.Doors = [1, 1];
    
    if (Timer <= 0)
    {
        with (oShopItem)
        {
            if (x > other.x)
                TargetX -= 32;
        }
        
        if (DoorStates[0])
            simple_sound(sfxDoor, -400, 0, false);
        
        if (DoorStates[1])
            simple_sound(sfxDoor, 400, 0, false);
        
        global.Doors = [DoorStates[0], DoorStates[1]];
        audio_play_sound(sfxShortCircuit, 5, false);
        instance_destroy();
    }
    
    Timer -= (global.NightSpeedup / 60);
}

surface_reset_target();
