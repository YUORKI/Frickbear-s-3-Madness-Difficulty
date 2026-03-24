set_target_to_ui();

if (Active)
{
    var WindowWidth = sprite_get_width(sDeathcoinWindow);
    var WindowHeight = sprite_get_height(sDeathcoinWindow);
    var TilesX = min(array_length(Killables), MaxWidth);
    var TilesY = ceil(array_length(Killables) / MaxWidth);
    WindowWidth += (max(TilesX - 5, 0) * 48);
    WindowHeight += (max(TilesY - 1, 0) * 48);
    x = (640 - WindowWidth) / 2;
    
    if (FadeOut)
        y += ((((-360 - WindowHeight) / 2) - y) / 5);
    else
        y += ((((360 - WindowHeight) / 2) - y) / 5);
    
    draw_sprite_stretched(sDeathcoinWindow, 0, x, y, WindowWidth, WindowHeight);
    draw_set_font(global.FontW97Black);
    draw_set_halign(fa_left);
    draw_set_halign(fa_left);
    var MouseX = device_mouse_x_to_gui(0) - (x + 6);
    var MouseY = device_mouse_y_to_gui(0) - (y + 48);
    draw_text(x + 11, y + 23, "Select an animatronic to eliminate.");
    
    for (var iy = 0; iy < TilesY; iy++)
    {
        for (var ix = 0; ix < TilesX; ix++)
        {
            var CurrentTile = ix + (iy * MaxWidth);
            
            if (CurrentTile >= array_length(Killables))
                break;
            
            var CurrentChar = Killables[CurrentTile];
            var Selected = false;
            
            if ((ix * 48) <= MouseX && ((ix + 1) * 48) > MouseX && (iy * 48) <= MouseY && ((iy + 1) * 48) > MouseY && !FadeOut)
            {
                Selected = true;
                var Text = global.Descriptions[CurrentChar][0];
                draw_text(x + 11, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), Text);
                
                if (mouse_check_button_pressed(mb_left))
                {
                    FadeOut = true;
                    var CanKill = true;
                    
                    if (CurrentChar == UnknownEnum.Value_32 && instance_exists(oMrHippo))
                    {
                        if (oMrHippo.Mode == "InOffice")
                        {
                            CanKill = false;
                            
                            with (oMrHippo)
                                Funny = 1;
                        }
                    }
                    
                    if (CurrentChar == UnknownEnum.Value_49 && instance_exists(oSalvage))
                    {
                        with (oSalvage)
                        {
                            SayDeathcoinLine = true;
                            lose_hp(20 / HPDrainRate, true);
                        }
                        
                        CanKill = false;
                    }
                    
                    if (CurrentChar == UnknownEnum.Value_47)
                        get_trophy(UnknownEnum.Value_20);
                    
                    if (CanKill)
                    {
                        instance_destroy(get_animatronic_object(CurrentChar));
                        
                        with (oCamera)
                            play_deathcoin_voiceline(CurrentChar);
                    }
                    
                    audio_play_sound(sfxMetalImpact, 50, false);
                    
                    with (oCamera)
                        Itemless = 0;
                    
                    with (oShopItem)
                    {
                        if (x > other.OriginalX)
                            TargetX -= 32;
                    }
                    
                    instance_destroy();
                }
            }
            
            var FaceSprite = sCustomNightFacesInactive;
            
            if (Selected)
                FaceSprite = sCustomNightFaces;
            
            draw_sprite(sTileBase, 0, x + 6 + (48 * ix), y + 48 + (48 * iy));
            draw_sprite(FaceSprite, CurrentChar, x + 6 + (48 * ix), y + 48 + (48 * iy));
        }
    }
}
else
{
    x += ((TargetX - x) / 5);
    y += ((2 - y) / 5);
    
    if (x <= device_mouse_x_to_gui(0) && (x + sprite_width) > device_mouse_x_to_gui(0) && y <= device_mouse_y_to_gui(0) && (y + sprite_height) > device_mouse_y_to_gui(0))
    {
        shader_set(shFlash);
        
        for (var i = -45; i < 360; i += 90)
        {
            draw_sprite(sprite_index, 2, x + round(lengthdir_x(1, i)), y + round(lengthdir_y(1, i)));
            
            if (mouse_check_button_pressed(mb_left))
            {
                generate_kill_list();
                
                if (array_length(Killables) == 0)
                {
                    error();
                }
                else
                {
                    OriginalX = x;
                    y = -200;
                    Active = true;
                    audio_play_sound(sfxClick, 10, false);
                }
            }
        }
        
        shader_reset();
    }
    
    draw_sprite(sprite_index, 2, x, y);
}

surface_reset_target();

enum UnknownEnum
{
    Value_20 = 20,
    Value_32 = 32,
    Value_47 = 47,
    Value_49 = 49
}
