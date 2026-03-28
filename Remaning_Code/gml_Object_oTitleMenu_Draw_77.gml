set_target_to_ui();
draw_set_font(FontNightOpening);
draw_set_halign(fa_right);

for (var i = 0; i < array_length(GuardOffset); i++)
{
    if (room != TitleScreenMap)
        break;
    
    draw_sprite_ext(FaceSprites, i * 2, GuardOffset[i], 0, 1, 1, 0, c_gray, 1);
    shader_set(shDiscardBlack);
    draw_sprite_ext(FaceSprites, (i * 2) + 1, GuardOffset[i], 0, 1, 1, 0, c_white, 1);
    shader_reset();
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.FontW97White);
    
    if (i < 4)
    {
        draw_sprite_ext(sDifficulty, i, GuardOffset[i] + 640, 360, 1, 1, 0, c_white, 1);
        draw_text_ext(16, 344 - (GuardOffset[i] / 2), DifficultyDescriptions[i], 14, 400);
    }
    
    if (i == SelectedOption && CurrentOptions[0] == "Jeremy")
        GuardOffset[i] += (0 - GuardOffset[i]) / 5;
    else
        GuardOffset[i] += (-640 - GuardOffset[i]) / 5;
}

var ContinueText = "";

if (CurrentOptions[SelectedOption] == "Continue" || (CurMenu == "Review Animatronics" || CurMenu == "Review Upgrades"))
    ContDescOffset += ((0 - ContDescOffset) / 5);
else
    ContDescOffset += ((-32 - ContDescOffset) / 5);

if (CurrentOptions[SelectedOption] == "Continue")
{
    ContinueText = "Night " + string(global.Night) + " - ";
    
    switch (global.Difficulty)
    {
        case 0:
            ContinueText += "Easy";
            break;
        
        case 1:
            ContinueText += "Normal";
            break;
        
        case 2:
            ContinueText += "Hard";
            break;
        
        case 3:
            ContinueText += "Lunatic";
            break;
    }
    
    ContinueText += " - ";
    
    switch (global.StartRoom)
    {
        case NightOpening:
            ContinueText += "Office";
            break;
        
        case MidnightCutscnes:
            ContinueText += "Post-Night";
            break;
        
        case MinigameStartup:
            ContinueText += "Salvaging";
            break;
        
        case Credits:
            ContinueText += "Credits";
            break;
    }
}

if ((CurMenu == "Review Animatronics" || CurMenu == "Review Upgrades") && SelectedOption < array_length(DescriptionList))
    ContinueText = DescriptionList[SelectedOption];

draw_set_font(global.FontW97White);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_ext(16, 344 - ContDescOffset, ContinueText, 14, 400);
draw_set_font(global.FontHanddrawn);
draw_set_valign(fa_top);
draw_set_halign(fa_right);

if (!Lock)
{
    for (var i = 0; i < array_length(CurrentOptions); i++)
    {
        if (i == SelectedOption)
        {
            XOffset[i] += (28 - XOffset[i]) / 5;
        }
        else
        {
            XOffset[i] += (0 - XOffset[i]) / 5;
            draw_set_alpha(0.5);
        }
        
        draw_text((624 - XOffset[i]) + SetXOffset, (16 + (40 * i)) - YOffset, CurrentOptions[i]);
        draw_set_alpha(1);
    }
}

for (var i = 0; i < array_length(PreviousOptions); i++)
{
    draw_set_alpha(0.5);
    draw_text(624 + PreviousSetXOffset, (16 + (40 * i)) - YOffset, PreviousOptions[i]);
    draw_set_alpha(1);
}

draw_set_halign(fa_left);
draw_text_ext(16, 16 - (SetXOffset / 2), CurrentDesc, 32, 612);
draw_text_ext(16, 16 - (PreviousSetXOffset / 2), PreviousDesc, 32, 612);

if (OptionsMenu == 0 && CurMenu != "Remap In Progress")
{
    for (var i = 0; i < array_length(global.Settings[OptionsMenu]); i++)
    {
        if (i != SelectedOption)
            draw_set_alpha(0.5);
        
        var CurSettingText = key_name(global.Settings[OptionsMenu][i]);
        draw_text(16 - SetXOffset, (16 + (40 * i)) - YOffset, CurSettingText);
        draw_set_alpha(1);
        
        if (i == SelectedOption)
        {
        }
    }
}

if (OptionsMenu > 0)
{
    for (var i = 0; i < array_length(Options[OptionsMenu]); i++)
    {
        if (i != SelectedOption)
            draw_set_alpha(0.5);
        
        var CurSettingNum = global.Settings[OptionsMenu][i];
        var CurSettingText = Options[OptionsMenu][i][CurSettingNum];
        draw_text(16 - SetXOffset, (16 + (40 * i)) - YOffset, CurSettingText);
        draw_set_alpha(1);
        
        if (i == SelectedOption)
        {
            var OptionChange = input_check_pressed(UnknownEnum.Value_5) - input_check_pressed(UnknownEnum.Value_3);
            
            if (OptionChange != 0)
            {
                audio_play_sound(sfxCamSwitch, 10, false);
                var AmountOfOptions = array_length(Options[OptionsMenu][i]);
                global.Settings[OptionsMenu][i] = (global.Settings[OptionsMenu][i] + OptionChange + AmountOfOptions) % AmountOfOptions;
                apply_settings(OptionsMenu == 1);
            }
        }
    }
}

SetXOffset -= (SetXOffset / 5);
PreviousSetXOffset += ((120 - SetXOffset) / 5);
YOffset += (((16 + (40 * SelectedOption)) - 168 - YOffset) / 5);

if (Transitioning)
{
    draw_rectangle_color(0, 0, display_get_gui_width(), (display_get_gui_height() * TransitionDegree) / 2, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, display_get_gui_height(), display_get_gui_width(), display_get_gui_height() - ((display_get_gui_height() * TransitionDegree) / 2), c_black, c_black, c_black, c_black, false);
    TransitionDegree += ((1 - TransitionDegree) / 8);
}

surface_reset_target();

enum UnknownEnum
{
    Value_3 = 3,
    Value_5 = 5
}
