set_target_to_ui();
x = 224;
y = 20;

for (var Y = 0; Y < 3; Y++)
{
    for (var X = 0; X < 3; X++)
    {
        if (mouse_in_zone(x + (X * 64), y + (Y * 64), 64, 64) && mouse_check_button_pressed(mb_left))
        {
            var ID = X + (Y * 3);
            audio_play_sound(sfxCamSwitch, 5, false);
            String += string(ID + 1);
            image_index = 1;
            
            if (string_length(String) >= string_length(Answer))
            {
                if (String == Answer)
                {
                    global.MicrogameWin = true;
                    end_microgame();
                    audio_play_sound(sfxSparkleImpact, 5, false);
                    instance_destroy(oTextBox_Fredbear);
                    
                    with (instance_create_depth(0, 0, 0, oTextBox_Fredbear))
                        game_text("Fredbear_Cracked");
                    
                    instance_destroy();
                }
                else
                {
                    audio_play_sound(sfxError, 5, false);
                    OffsetSpeed = 5;
                }
                
                String = "";
            }
        }
        else
        {
            image_index = 0;
        }
        
        draw_sprite(sKeypad, image_index, x + (X * 64), y + IntroOffset + Offset + (Y * 64));
    }
}

show_debug_message(String);
OffsetSpeed = lerp(OffsetSpeed, (0 - Offset) * 0.8, 0.2);
Offset += OffsetSpeed;
IntroOffset -= (IntroOffset / 5);
surface_reset_target();
