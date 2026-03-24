if (WaitToStart && global.AILevels[UnknownEnum.Value_39] > 0 && Delay <= 0)
{
    MaxWidth = 8;
    SummonList = [];
    FadeOut = false;
    generate_summon_list();
    
    if (array_length(SummonList) == 0)
    {
        instance_destroy();
        exit;
    }
    
    WaitToStart = false;
    CurrentVoiceClip = reverb_sound(choose(voc_LolzHax_Alert1, voc_LolzHax_Alert2, voc_LolzHax_Behold, voc_LolzHax_MuchWorse, voc_LolzHax_NewChallenger, voc_LolzHax_NewIrritation), 0, 0, false, 1.5);
    audio_play_sound(sfxSalvageStatic, 10, false);
    audio_play_sound(mus_LolzHax, 5, false, 0.5);
}

if (Delay > 0)
    Delay -= 0.016666666666666666;

if (WaitToStart)
    exit;

set_target_to_ui();
var WindowWidth = sprite_get_width(sDeathcoinWindow);
var WindowHeight = sprite_get_height(sDeathcoinWindow);
var TilesX = min(array_length(SummonList), MaxWidth);
var TilesY = ceil(array_length(SummonList) / MaxWidth);
WindowWidth += (max(TilesX - 5, 0) * 48);
WindowHeight += (max(TilesY - 1, 0) * 48);
x = (640 - WindowWidth) / 2;

if (FadeOut)
{
    y += ((360 - y) / 5);
}
else
{
    y += ((218 - y) / 5);
    
    if (Timer > 0)
        Timer -= 0.016666666666666666;
}

draw_sprite(sLolzHaxMenu, 0, x, y);
draw_rectangle_color(x + 8, y + 128, x + lerp(8, 244, Timer / 10), y + 133, c_black, c_black, c_black, c_black, false);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_halign(fa_left);
var MouseX = device_mouse_x_to_gui(0) - (x + 6);
var MouseY = device_mouse_y_to_gui(0) - (y + 48);
draw_text(x + 11, y + 23, "Select an animatronic to summon.");

for (var iy = 0; iy < TilesY; iy++)
{
    for (var ix = 0; ix < TilesX; ix++)
    {
        var CurrentTile = ix + (iy * MaxWidth);
        
        if (CurrentTile >= array_length(SummonList))
            break;
        
        var CurrentChar = SummonList[CurrentTile];
        var Selected = false;
        
        if (((((ix * 48) + 48) <= MouseX && (((ix + 1) * 48) + 48) > MouseX && (iy * 48) <= MouseY && ((iy + 1) * 48) > MouseY) || (ix == 2 && Timer <= 0)) && !FadeOut)
        {
            Selected = true;
            var Text = global.Descriptions[CurrentChar][0];
            
            if (ix == 2)
                Text = "Random";
            
            draw_text(x + 11, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), Text);
            
            if (mouse_check_button_pressed(mb_left) || (ix == 2 && Timer <= 0))
            {
                FadeOut = true;
                global.AILevels[CurrentChar] = global.AILevels[UnknownEnum.Value_39];
                array_push(global.SummonedAnimatronics, CurrentChar);
                audio_play_sound(sfxMeleeConfirm, 5, false);
                audio_stop_sound(mus_LolzHax);
                audio_stop_sound(CurrentVoiceClip);
                
                with (oCamera)
                {
                    if (ix == 2)
                        reverb_sound(get_selection_voiceline(CurrentChar), 0, 0, false, 1);
                    else
                        reverb_sound(choose(voc_LolzHax_Laugh1, voc_LolzHax_Laugh2, voc_LolzHax_Laugh3), 0, 0, false, 1.5);
                }
                
                YOffsetSpeed = 16;
                SelectionMade = true;
            }
        }
        
        var FaceSprite = sCustomNightFacesInactive;
        
        if (Selected)
            FaceSprite = sCustomNightFaces;
        
        draw_sprite(sTileBase, 0, x + 6 + (48 * ix) + 48, y + 48 + (48 * iy));
        
        if (ix == 2)
            draw_sprite(sMysteryTile, !Selected, x + 6 + (48 * ix) + 48, y + 48 + (48 * iy));
        else
            draw_sprite(FaceSprite, CurrentChar, x + 6 + (48 * ix) + 48, y + 48 + (48 * iy));
    }
}

surface_reset_target();

enum UnknownEnum
{
    Value_39 = 39
}
