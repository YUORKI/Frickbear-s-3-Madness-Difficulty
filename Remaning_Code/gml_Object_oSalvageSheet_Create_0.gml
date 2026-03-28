TextOrder = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¿áéíóú™";
CostFont = font_add_sprite_ext(sSalvageSheet_Font, TextOrder, true, 0);
SalvageStats = get_salvage_data();
ID = UnknownEnum.Value_0;
Delete = false;
HidePage = false;
PageMode = 0;

if (room == SalvageResults)
{
    global.Night++;
    global.StartRoom = NightOpening;
    create_save();
    room_goto(NightOpening);
    window_set_cursor(cr_default);
}

if (!variable_global_exists("Power"))
{
    global.Power = 0;
    global.Tokens = 0;
}

y = 360;

if (room == NightResults || room == Credits)
{
    window_set_cursor(cr_default);
    TotalEarnings = 0;
    Bonus_Power = max(round(global.Power * 0.1 * 10) / 10, 0);
    Bonus_Tokens = round(global.Tokens * 0.1 * 10) / 10;
    TotalEarnings = Bonus_Power + Bonus_Tokens;
    global.RunEarnings += TotalEarnings;
    global.RunEarningsTotal += TotalEarnings;
}

function draw_stuff()
{
    draw_sprite(sSalvageSheet, PageMode, x, y);
    
    if (room == NightResults)
    {
        global.SalvagesCurrent = [];
        PageMode = 2;
        
        if (input_check_pressed(UnknownEnum.Value_0) && !instance_exists(oTransitionMinigame))
        {
            audio_play_sound(sfxCamSwitch, 5, false);
            global.StartRoom = MidnightCutscnes;
            create_save();
            room_goto(MidnightCutscnes);
        }
    }
    
    draw_set_font(CostFont);
    
    if (PageMode == 0)
    {
        draw_set_halign(fa_right);
        var XOffset = 304;
        var SalvageValue = SalvageStats[ID][3];
        
        if (global.UnlockedAnimatronics[ID])
            draw_sprite(sSalvageSheet_Check, 0, x + 247, y + 9);
        
        draw_text(x + XOffset, y + 74, "\"" + string(global.Descriptions[ID][0]) + "\"");
        draw_text(x + XOffset, y + 74 + 24, string(SalvageStats[ID][1]));
        draw_text(x + XOffset, y + 74 + 48, string(SalvageStats[ID][2]));
        
        if (array_contains([UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_46], ID))
        {
            draw_text(x + XOffset, y + 194, "$" + string_format(SalvageValue * 0.01, 1, 2));
        }
        else
        {
            draw_text(x + XOffset, y + 194, "$" + string_format(SalvageValue, 1, 2));
            draw_text(x + XOffset, y + 194 + 16, "(YOUR CUT: $" + string_format(SalvageValue * 0.01, 1, 2) + ")");
        }
        
        draw_set_halign(fa_left);
        XOffset = 47;
        draw_text(x + XOffset, y + 74, "Model Name");
        draw_text(x + XOffset, y + 74 + 24, "Risk of Injury");
        draw_text(x + XOffset, y + 74 + 48, "Defense Type");
        draw_text(x + XOffset, y + 194, "Salvage Value");
    }
    else if (PageMode == 1)
    {
        draw_set_halign(fa_right);
        var XOffset = 304;
        draw_text(x + XOffset, y + 74, "\"" + string(global.Descriptions[ID][0]) + "\"");
        draw_set_halign(fa_left);
        XOffset = 47;
        draw_text(x + XOffset, y + 74, "Model Name");
        draw_text_ext(x + XOffset, y + 74 + 32, string(global.Descriptions[ID][1]), 16, 256);
        draw_text(x + XOffset, y + 74 + 272, "Press space to continue.");
    }
    else if (PageMode == 2)
    {
        draw_set_halign(fa_left);
        var XOffset = 47;
        draw_text(x + XOffset, y + 74, "Power Bonus:");
        draw_text(x + XOffset, y + 74 + 24, "Token Bonus:");
        draw_text(x + XOffset, y + 74 + 208, "Tonight's Earnings:");
        draw_text(x + XOffset, y + 74 + 232, "Total Earnings:");
        draw_text(x + XOffset, y + 74 + 272, "Press space to continue.");
        draw_set_halign(fa_right);
        XOffset = 304;
        draw_text(x + XOffset, y + 74, "$" + string_format(Bonus_Power, 1, 2));
        draw_text(x + XOffset, y + 74 + 24, "$" + string_format(Bonus_Tokens, 1, 2));
        draw_text(x + XOffset, y + 74 + 208, "$" + string_format(TotalEarnings, 1, 2));
        draw_text(x + XOffset, y + 74 + 232, "$" + string_format(global.RunEarnings, 1, 2));
    }
    else if (PageMode == 3)
    {
        draw_set_halign(fa_right);
        var XOffset = 304;
        TotalEarnings = 0;
        
        for (var a = 0; a < array_length(global.SalvagesCurrent); a++)
        {
            draw_text(x + XOffset, y + 74 + (24 * a), "$" + string(SalvageStats[global.SalvagesCurrent[a]][3]));
            TotalEarnings += SalvageStats[global.SalvagesCurrent[a]][3];
        }
        
        draw_text(x + XOffset, y + 74 + 208, "$" + string(TotalEarnings));
        draw_text(x + XOffset, y + 74 + 232, "$" + string(TotalEarnings));
        draw_set_halign(fa_left);
        XOffset = 47;
        
        for (var a = 0; a < array_length(global.SalvagesCurrent); a++)
            draw_text(x + XOffset, y + 74 + (24 * a), "\"" + string(global.Descriptions[global.SalvagesCurrent[a]][0]) + "\"");
        
        draw_text(x + XOffset, y + 74 + 208, "Tonight's Earnings:");
        draw_text(x + XOffset, y + 74 + 232, "Total Earnings:");
        draw_text(x + XOffset, y + 74 + 272, "Press space to continue.");
    }
    
    HidePage = false;
    
    with (oTextBox)
    {
        if (Delay[TextPage] > 0)
        {
            with (other)
                HidePage = true;
        }
    }
    
    if (Delete == true)
    {
        y += ((360 - y) / 5);
        
        if (y > 359)
            instance_destroy();
    }
    else if (HidePage == true)
    {
        y += ((360 - y) / 5);
    }
    else
    {
        y += ((0 - y) / 5);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_20 = 20,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_46 = 46
}
