shader_set(shRecolor);
Pal = [13695200, 7389320, 5662772, 3354368];

if (FadeVal < 0)
    replace_color(Pal[0], Pal[1], Pal[2], Pal[3], col(0), col(1), col(2), col(3));
else
    replace_color(Pal[3], Pal[2], Pal[1], Pal[0], col(3), col(2), col(1), col(0));

var TexC = 3354368;
var TexCLight = 13695200;
draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
draw_sprite(sHD_Crybaby, floor(Timer / 30) % 2, 0, 16);
draw_set_font(global.FontGameboy);

switch (Screen)
{
    case "EmilySoft":
        draw_rectangle_color(0, 0, 160, 144, TexCLight, TexCLight, TexCLight, TexCLight, false);
        draw_sprite(sEmilySoftScreen, 1, 0, max(80 - Timer, 0));
        
        if (Timer == 80)
            audio_play_sound(sfxBitCollect, 10, false);
        
        if (Timer >= 180)
            FadeVal += (sign(3 - FadeVal) / 20);
        
        if (Timer == 240)
        {
            Screen = "OpeningScene";
            Timer = 0;
            play_music(mus_BossNightmare_Cutscene);
        }
        
        break;
    
    case "OpeningScene":
        if (TextNum < array_length(TextStorage))
        {
            FadeVal += (sign(0 - FadeVal) / 20);
            var TextToType = string_copy(TextStorage[TextNum], 0, floor(TextType));
            draw_set_color(TexCLight);
            draw_text_ext(8, 72, TextToType, 12, 144);
            draw_set_color(c_white);
            
            if (Timer > 60)
            {
                TextType += 0.25;
                TextType = min(TextType, string_length(TextStorage[TextNum]));
            }
            
            if (TextType <= string_length(TextStorage[TextNum]) && input_check_pressed(UnknownEnum.Value_0))
            {
                TextType = 0;
                TextNum++;
                audio_play_sound(sfxBitCrunch, 5, false);
            }
        }
        else
        {
            FadeVal += (sign(-3 - FadeVal) / 20);
            
            if (FadeVal == -3)
            {
                Timer = 0;
                Screen = "Title";
                audio_stop_sound(mus_BossNightmare_Cutscene);
            }
        }
        
        break;
    
    case "Title":
    case "TitleStart":
        if (Screen == "Title")
            FadeVal += (sign(0 - FadeVal) / 20);
        
        draw_sprite(sHD_Title, 0, 0, 0);
        var GuardImage = global.Guard * 4;
        GuardImage += (floor(Timer / 16) % 2);
        
        if ((floor(Timer / 16) % 4) == 3)
            GuardImage += 1;
        
        if (input_check_pressed(UnknownEnum.Value_0) && Screen == "Title")
        {
            Timer = 0;
            Screen = "TitleStart";
            audio_play_sound(sfxBitBoost, 5, false);
        }
        
        if (Screen == "TitleStart")
        {
            GuardImage = global.Guard * 4;
            
            if (Timer < 60 && (floor(Timer / 4) % 2) == 0)
            {
                draw_rectangle_color(40, 96, 160, 128, TexC, TexC, TexC, TexC, false);
            }
            else if (Timer >= 60)
            {
                FadeVal += (sign(3 - FadeVal) / 20);
                
                if (Timer == 120)
                {
                    Screen = "LevelOpen";
                    Timer = 0;
                }
            }
        }
        
        draw_sprite_ext(sHD_Guard, GuardImage, 28, 110, 1, 1, 0, c_white, 1);
        break;
    
    case "LevelOpen":
        if (Timer < 120)
            FadeVal += (sign(0 - FadeVal) / 20);
        else
            FadeVal += (sign(3 - FadeVal) / 20);
        
        if (Timer == 180)
            load_level(1);
        
        draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
        draw_set_color(TexCLight);
        draw_text(8, 52, "LEVEL 1");
        draw_text(8, 76, "FAZBEAR HILLS");
        draw_set_color(c_white);
        break;
    
    case "Level":
        FadeVal += (sign(0 - FadeVal) / 20);
        break;
}

Timer++;
shader_reset();

enum UnknownEnum
{
    Value_0
}
