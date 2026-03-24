TextBoxSprite = sTextBox;

function initialize()
{
    Text = [];
    Letter = [];
    Function = [];
    Delay = [];
    Hide = [];
    Skip = [];
    Lock = [];
    TextPage = 0;
    TextPageNumber = 0;
    Text[0] = "";
    TextLength[0] = string_length(Text[0]);
    TextDrawChar = 0;
    TextSpeed = 1;
    TextSetup = false;
    Letter[0][0] = "";
    LetterX[0][0] = 0;
    LetterY[0][0] = 0;
    TextOption[0] = "";
    TextOptionLink[0] = "";
    TextOptionPosition = 0;
    TextOptionNumber = 0;
    Frame = 0;
    set_defaults_for_text();
    LastFreeSpace = 0;
    TextPause = 0;
    Talksound = voc_tsDefault;
}

CurrentTextboxX = 0;
CurrentTextboxY = 360;
CurrentNameboxY = 640;
NameboxWidth = 1;
OptionOffset = 0;
OptionArrowOffset = 0;
BackgroundAlpha = 0;
FadeoutFrame = 0;
ExternalPause = false;
Transitioning = false;
TransitionAmount = 0;
CustomTalksound = import_sound(global.Guard);
SoundImported = CustomTalksound == voc_tsDefault;

if (SoundImported)
    audio_sound_gain(CustomTalksound, 0.5, 0);

audio_sound_gain(voc_tsDefault, 1, 0);
initialize();

function draw_everything()
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var InMinigame = 1;
    var TextSep = 32;
    draw_set_alpha(BackgroundAlpha);
    draw_rectangle_color(0, 0, 320, 180, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    var TextBoxX = 0;
    var TextBoxY = 232;
    var XOffset = 16;
    var YOffset = 16;
    var TextWidth = 640 - (XOffset * 3);
    var ForwardKey = input_check_pressed(UnknownEnum.Value_0) && !Lock[TextPage];
    var OnLastPage = TextPage == (TextPageNumber - 1);
    
    if (OnLastPage)
    {
        FadeoutFrame += 1;
        
        if (FadeoutFrame > 15)
            instance_destroy();
    }
    
    if (!InMinigame)
    {
        TextBoxSprite = sTextBox_Windows;
        XOffset = 4;
        YOffset = 4;
        TextSep = 14;
    }
    
    TypeSpeed = 1;
    
    if (TextSetup == false)
    {
        TextSetup = true;
        TextPageNumber = array_length(Text);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        for (var p = 0; p < TextPageNumber; p++)
        {
            TextLength[p] = string_length(Text[p]);
            
            for (var l = 0; l < TextLength[p]; l++)
            {
                var _letter_pos = l + 1;
                Letter[l][p] = string_char_at(Text[p], _letter_pos);
                var _txt_up_to_letter = string_copy(Text[p], 1, _letter_pos);
                var _current_text_w = string_width(_txt_up_to_letter) - string_width(Letter[l][p]);
                
                if (Letter[l][p] == " " || Letter[l][p] == "-")
                    LastFreeSpace = _letter_pos + 1;
                
                if ((_current_text_w - line_break_offset[p]) > TextWidth || Letter[l][p] == "»")
                {
                    line_break_pos[line_break_num[p]][p] = LastFreeSpace;
                    line_break_num[p] += 1;
                    var _txt_up_to_last_space = string_copy(Text[p], 1, LastFreeSpace);
                    var _last_free_space_string = string_char_at(Text[p], LastFreeSpace);
                    line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
                }
            }
            
            for (var l = 0; l < TextLength[p]; l++)
            {
                draw_set_font(TextFont[l][p]);
                
                if (!InMinigame)
                    draw_set_font(global.FontW97Black);
                
                var _letter_pos = l + 1;
                var _txt_x = 0;
                var _txt_y = 0;
                var _txt_up_to_letter = string_copy(Text[p], 1, _letter_pos);
                var _current_text_w = string_width(_txt_up_to_letter) - string_width(Letter[l][p]);
                var _txt_line = 0;
                
                for (var lb = 0; lb < line_break_num[p]; lb++)
                {
                    if (_letter_pos >= line_break_pos[lb][p])
                    {
                        var _str_copy = string_copy(Text[p], line_break_pos[lb][p], _letter_pos - line_break_pos[lb][p]);
                        _current_text_w = string_width(_str_copy);
                        _txt_line = lb + 1;
                    }
                }
                
                LetterX[l][p] = _txt_x + _current_text_w;
                LetterY[l][p] = _txt_y + (_txt_line * TextSep);
            }
        }
    }
    
    var Speaker = CharacterSpeaking[TextPage];
    
    if (TextPause <= 0)
    {
        Talksound = voc_tsDefault;
        
        if (TextDrawChar < TextLength[TextPage] && Delay[TextPage] <= 0)
        {
            TextDrawChar += TextSpeed;
            TextDrawChar = clamp(TextDrawChar, 0, TextLength[TextPage]);
            var _check_letter = string_char_at(Text[TextPage], ceil(TextDrawChar));
            
            if (_check_letter == "." || _check_letter == "!" || _check_letter == "?" || _check_letter == ",")
            {
                TextPause = 10 / TextSpeed;
                Talksound = voc_tsDefault;
            }
            else
            {
                if (Speaker == guard_name())
                    Talksound = CustomTalksound;
                
                if (Speaker == "Michael" || Speaker == "Hooded Man")
                    Talksound = voc_tsMichael;
                
                if (Speaker == "Vanny" || Speaker == "White Rabbit")
                    Talksound = voc_tsVanny;
                
                if (Speaker == "Jeremy")
                    Talksound = voc_tsJeremy;
                
                if (Speaker == "Mike")
                    Talksound = voc_tsMike;
                
                if (Speaker == "Vanessa")
                    Talksound = voc_tsVanessa;
                
                if (Speaker == "Fritz")
                    Talksound = voc_tsFritz;
                
                if (Speaker == "The Boss")
                    Talksound = voc_tsTheBoss;
            }
            
            if (_check_letter != " ")
                audio_play_sound(Talksound, 1, false, 1, 0, random_range(0.9, 1.1));
        }
    }
    else
    {
        TextPause -= 1;
    }
    
    if ((((ForwardKey || TextPage == 0) && Delay[TextPage] == 0) || (Skip[TextPage] && TextDrawChar == TextLength[TextPage])) && !ExternalPause)
    {
        if (TextDrawChar == TextLength[TextPage])
        {
            if (TextPage < (TextPageNumber - 1))
            {
                if (TextPage == (TextPageNumber - 2) && TextOptionNumber > 0)
                {
                    var Destination = TextOptionLink[TextOptionPosition];
                    audio_play_sound(sfxCamSwitch, 5, false);
                    initialize();
                    game_text(Destination);
                }
                
                TextPage += 1;
                TextDrawChar = 0;
                Function[TextPage]();
                Frame = 0;
            }
            else
            {
                instance_destroy();
            }
        }
        else
        {
            TextDrawChar = TextLength[TextPage];
        }
    }
    
    var AltColor = 13695200;
    var NameText = Speaker;
    
    if (Speaker != "")
        NameboxWidth = (string_width(NameText) + (XOffset * 2)) / 64;
    
    var NameboxX = round(CurrentTextboxX);
    var NameboxY = round(CurrentNameboxY);
    var TextboxBorderX = round(CurrentTextboxX);
    var TextboxBorderY = round(CurrentTextboxY);
    
    if (TextBoxSprite != sNOTHING)
    {
        draw_rectangle_color(NameboxX - 1, NameboxY - 1, NameboxX + (64 * NameboxWidth), NameboxY + 64, AltColor, AltColor, AltColor, AltColor, false);
        draw_rectangle_color(TextboxBorderX - 1, TextboxBorderY - 1, TextboxBorderX + 640, TextboxBorderY + 128, AltColor, AltColor, AltColor, AltColor, false);
    }
    
    draw_sprite_ext(TextBoxSprite, 1, NameboxX, NameboxY, NameboxWidth, 1, 0, c_white, 1);
    draw_text_color(round(CurrentTextboxX) + XOffset, round(CurrentNameboxY) + YOffset, NameText, AltColor, AltColor, AltColor, AltColor, 1);
    OptionArrowOffset += ((TextOptionPosition - OptionArrowOffset) * approach_factor(0.5, TextSpeed));
    
    if (TextDrawChar == TextLength[TextPage] && TextPage == (TextPageNumber - 2))
    {
        var BGTarget;
        
        if (TextOptionNumber > 0)
        {
            BGTarget = 0;
            
            for (var o = 0; o < TextOptionNumber; o++)
                BGTarget = max(BGTarget, string_width(TextOption[o]));
            
            BGTarget += 64;
            OptionOffset += ((BGTarget - OptionOffset) * approach_factor(0.2, TextSpeed));
        }
        else
        {
            OptionOffset += ((-16 - OptionOffset) * approach_factor(0.2, TextSpeed));
        }
        
        if (OptionOffset > 0)
            draw_sprite(sOptionBG, 0, round(OptionOffset), 0);
        
        for (var o = 0; o < TextOptionNumber; o++)
            draw_text_color(40 + (OptionOffset - BGTarget), 12 + (32 * o), TextOption[o], AltColor, AltColor, AltColor, AltColor, 1);
        
        if (TextOptionNumber > 0)
            draw_sprite(sSelectionHand, 0, 20 + (OptionOffset - BGTarget), 26 + (32 * OptionArrowOffset));
        
        var OptionChange = input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2);
        
        if (OptionChange != 0)
            audio_play_sound(sfxBump, 5, false);
        
        TextOptionPosition += OptionChange;
        
        if (TextOptionPosition < 0)
            TextOptionPosition = TextOptionNumber - 1;
        else if (TextOptionPosition >= TextOptionNumber)
            TextOptionPosition = 0;
    }
    else
    {
        OptionOffset += ((-16 - OptionOffset) * approach_factor(0.2, TextSpeed));
    }
    
    draw_rectangle_color(0, 0, 640, 180 * TransitionAmount, #002F33, #002F33, #002F33, #002F33, false);
    draw_rectangle_color(0, 360 - (180 * TransitionAmount), 640, 360, #002F33, #002F33, #002F33, #002F33, false);
    Speaker = CharacterSpeaking[TextPage];
    
    if (OnLastPage)
    {
        TextBoxY = 360;
        
        with (oCamera3DMaze)
            LockOnTarget = -4;
    }
    else
    {
        TextBoxY = 232;
    }
    
    if (Delay[TextPage] > 0 || Hide[TextPage] == true)
        TextBoxY = 360;
    
    draw_sprite_ext(TextBoxSprite, 0, round(CurrentTextboxX), round(CurrentTextboxY), 10, 2, 0, c_white, 1);
    
    for (var l = 0; l < TextDrawChar; l++)
    {
        var DrawLetterX = round(LetterX[l][TextPage] + CurrentTextboxX + XOffset);
        var DrawLetterY = round(LetterY[l][TextPage] + CurrentTextboxY + YOffset + round(TextYOffset[l][TextPage]));
        var Color = TextColor[l][TextPage];
        
        if (TextBoxSprite == sNOTHING)
            Color = 16777215;
        
        var Effect = TextEffect[l][TextPage];
        TextYOffset[l][TextPage] -= (TextYOffset[l][TextPage] / 2);
        
        if (Effect == "Shake")
        {
            DrawLetterX += round(random_range(-0.75, 0.75));
            DrawLetterY += round(random_range(-0.75, 0.75));
        }
        
        if (Effect == "Spin")
        {
            DrawLetterX += round(lengthdir_x(1, (Frame + (l * 2)) * 10));
            DrawLetterY += round(lengthdir_y(1, (Frame + (l * 2)) * 10));
        }
        
        draw_set_font(TextFont[l][TextPage]);
        draw_text_color(DrawLetterX, DrawLetterY, Letter[l][TextPage], Color, Color, Color, Color, 1);
    }
    
    CurrentTextboxX += ((TextBoxX - CurrentTextboxX) * approach_factor(0.2, TextSpeed));
    CurrentTextboxY += ((TextBoxY - CurrentTextboxY) * approach_factor(0.2, TextSpeed));
    
    if (Speaker == "" || TextBoxY != 232)
        CurrentNameboxY += ((640 - CurrentNameboxY) * approach_factor(0.2, TextSpeed));
    else
        CurrentNameboxY += ((176 - CurrentNameboxY) * approach_factor(0.2, TextSpeed));
    
    Frame += TextSpeed;
    
    if (Delay[TextPage] > 0)
        Delay[TextPage] -= TextSpeed;
    
    TransitionAmount += ((Transitioning - TransitionAmount) * approach_factor(0.2, TextSpeed));
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4
}
