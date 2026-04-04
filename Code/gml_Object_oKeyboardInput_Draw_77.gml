set_target_to_ui();
var X = 160;
var Y = 112;
draw_sprite(sKeyboardBase, 0, X, Y + Offset);
var XPos = 0;
var YPos = 0;

for (var i = 0; i < array_length(KeysList); i++)
{
    draw_sprite(sKeyboardKeys, i, X + XPos + 2, (Y + YPos + Offset + KeyOffset[i]) - 2);
    
    if (mouse_in_zone(X + XPos, Y + YPos, 32, 32) && mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxClick, 5, false);
        KeyOffset[i] = 5;
        
        if (i == 26)
        {
            if (String == "SPRINGBONNIE")
            {
                audio_play_sound(sfxSparkleImpact, 5, false);
                instance_destroy(oTextBox);
                
                with (instance_create_depth(0, 0, 0, oTextBox))
                    game_text("Box_Cracked");
            }
            else
            {
                audio_play_sound(sfxError, 5, false);
                String = "";
            }
        }
        else
        {
            String += KeysList[i];
        }
    }
    
    XPos += 32;
    
    if (i == 9)
    {
        XPos = 16;
        YPos += 32;
    }
    
    if (i == 18)
    {
        XPos = 32;
        YPos += 32;
    }
    
    KeyOffset[i] -= KeyOffset[i] / 5;
}

Offset -= (Offset / 5);
draw_set_font(global.FontHanddrawn);
draw_sprite_stretched(sTextBox, 1, 60, 32 + Offset, 520, 64);
draw_set_color(#E0F8D0);
draw_text(80, 52 + Offset, String);
draw_set_color(c_white);
surface_reset_target();

if (String == "GASTER")
    game_restart();
