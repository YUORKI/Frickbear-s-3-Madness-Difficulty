Alpha = 0;
Frame = 0;
FadeoutAlpha = 0;
audio_bus_main.effects[0] = undefined;
shader_reset();
Bonus_Power = max(round(global.Power * 0.1 * 100) / 100, 0);
Bonus_Tokens = round(global.Tokens * 0.1 * 10) / 10;

with (instance_create_depth(89, 347, -1, oScorePopup))
{
    TargetOffset = -32;
    DollarAmount = other.Bonus_Power;
}

with (instance_create_depth(576, 13, -1, oScorePopup))
{
    TargetOffset = 32;
    DollarAmount = other.Bonus_Tokens;
}

LineOffsets = [180, 180, 180, 180];

function draw_results()
{
    if (Frame > 4.7)
        LineOffsets[0] -= LineOffsets[0] / 5;
    
    if (Frame > 5.6)
        LineOffsets[1] -= LineOffsets[1] / 5;
    
    if (Frame > 6.5)
        LineOffsets[2] -= LineOffsets[2] / 5;
    
    if (Frame > 7.4)
        LineOffsets[3] -= LineOffsets[3] / 5;
    
    draw_set_font(global.FontW97White);
    draw_set_alpha(Alpha);
    draw_set_halign(fa_left);
    draw_text(200, 230 + LineOffsets[0], "Power Saved:");
    draw_text(200, 250 + LineOffsets[1], "Tokens Saved:");
    
    if (numbered_night())
    {
        draw_text(200, 270 + LineOffsets[2], "Deaths:");
        draw_text(200, 290 + LineOffsets[3], "Performance Bonus:");
    }
    
    if (global.Night == "Custom" && global.Route != UnknownEnum.Value_0)
    {
        var BossSelected = (global.Route == UnknownEnum.Value_3) ? 0 : ((global.Route == UnknownEnum.Value_2) ? 1 : 2);
        var Score = global.BossHiScores[BossSelected][global.Difficulty];
        draw_text(200, 270 + LineOffsets[2], (global.Route == UnknownEnum.Value_4) ? "Score: " : "Time: ");
    }
    
    draw_set_halign(fa_right);
    var PowerSaved = max(0, global.Power);
    draw_text(400, 230 + LineOffsets[0], string_format(PowerSaved, 1, 2) + "%");
    draw_text(400, 250 + LineOffsets[1], string_format(global.Tokens, 1, 0));
    
    if (numbered_night())
    {
        var Earnings = (global.Tokens + PowerSaved) / 10;
        draw_text(400, 270 + LineOffsets[2], string_format(global.Deaths[global.Night - 1], 1, 0));
        draw_text(400, 290 + LineOffsets[3], "$" + string_format(Earnings, 1, 2));
    }
    
    if (global.Night == "Custom" && global.Route != UnknownEnum.Value_0)
    {
        var Score = global.ThisBossHiScore;
        
        if (global.Route != UnknownEnum.Value_4)
            Score = format_as_timer(Score, true);
        
        draw_text(400, 270 + LineOffsets[2], string(Score));
    }
}

if (global.AILevels[UnknownEnum.Value_46] > 0)
    reverb_sound(choose(voc_Rodney_Win_BeginnersLuck, voc_Rodney_Win_BigBrother, voc_Rodney_Win_GamblingRegulations, voc_Rodney_Win_GetToLeave, voc_Rodney_Win_HarderWithoutMe, voc_Rodney_Win_NotImpressed), 0, 0, false, 3, 1, 0.05);

VictoryThemes = get_guard_themes([[sfxWarioWin, 0.75], [sfxWarioWinDeluxe, 0.5], [sfxWarioWinUltimate, 0.5]], ["theme_victory", "theme_victory_night5", "theme_victory_night6"]);

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_46 = 46
}
