initialize_ui_surface();

if (SalvageAmount != array_length(global.SalvagesCurrent))
{
    SalvageAmount += 1;
    SalvageIconOffset = 48;
}

var AltColor = 13695200;
draw_sprite_ext(sTextBox, 1, 512, 0, 2, 0.75, 0, c_white, 1);
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_left);
draw_text_color(524, 12, "$" + string_format(DisplayedEarnings, 3, 2), AltColor, AltColor, AltColor, AltColor, 1);

if (global.HasGift)
{
    draw_sprite(sShopItemSalvageIcons, UnknownEnum.Value_18, 494, 18 + GiftOffset);
    GiftOffset -= (GiftOffset / 10);
}

for (var i = 0; i < array_length(global.SalvagesCurrent); i++)
{
    var YOffset = 0;
    
    if (instance_exists(oTransitionMinigame) || i == (array_length(global.SalvagesCurrent) - 1))
        YOffset = SalvageIconOffset;
    
    draw_sprite(sCustomNightFacesM, global.SalvagesCurrent[i], i * 48, 0 - YOffset);
}

if (instance_exists(oTransitionMinigame))
    SalvageIconOffset += ((48 - SalvageIconOffset) / 10);
else
    SalvageIconOffset -= (SalvageIconOffset / 10);

draw_rectangle_color(0, 0, 640, round(180 * TransitionPercent), #002F33, #002F33, #002F33, #002F33, false);
draw_rectangle_color(0, 360, 640, 360 - round(180 * TransitionPercent), #002F33, #002F33, #002F33, #002F33, false);
surface_reset_target();

if (abs(global.RunEarnings - DisplayedEarnings) < 0.5)
{
    DisplayedEarnings = global.RunEarnings;
}
else
{
    DisplayedEarnings += (sign(global.RunEarnings - DisplayedEarnings) * 0.5);
    audio_play_sound(sfxTally, 1, false, 0.5);
}

if (TransitionFrames > 0)
    TransitionFrames--;
else
    TransitionPercent -= (TransitionPercent / 5);

enum UnknownEnum
{
    Value_18 = 18
}
