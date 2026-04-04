var TopBarOffset = -224 * (1 - TileSize);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, TopBarOffset, 0, 220, 360);
draw_sprite_stretched(sTextBox_Windows, 1, TopBarOffset + 28, 4, 188, 22);
draw_text(TopBarOffset + 33, 5, "Boss Rematch");
draw_sprite_stretched(sButtonMini, 0, TopBarOffset + 4, 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, TopBarOffset + 4 + 11, 15);
var Quit = clicked(4, 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
var ButtonX = TopBarOffset + 4;
var ButtonY = 28;
var ButtonWidth = 212;
var ButtonHeight = 48;
draw_set_halign(fa_right);

with (oCustomNightGuardSelect)
    y = lerp(-16, 48, other.TileSize);

for (var i = 0; i < 3; i++)
{
    draw_sprite_stretched(sTextBox_Windows, BossSelected == i, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
    
    if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && BossSelected != i)
    {
        BossSelected = i;
        
        if (DifficultySelected == 4)
            DifficultySelected = -1;
        
        audio_play_sound(sfxClick, 5, false);
        PreviousPortrait = Portrait;
        PreviousImageSize = ImageSize;
        var Portraits = [FB_Salvage, FB_Nightmare, FB_Fredbear];
        Portrait = Portraits[BossSelected];
        ImageSize = 0;
    }
    
    switch (i)
    {
        case 0:
            draw_text((ButtonX + ButtonWidth) - 4, (ButtonY + ButtonHeight) - 21, "VS. Salvage");
            draw_sprite(sCustomNightFaces, UnknownEnum.Value_49, ButtonX, ButtonY);
            break;
        
        case 1:
            draw_text((ButtonX + ButtonWidth) - 4, (ButtonY + ButtonHeight) - 21, "VS. The Nightmares");
            
            for (var j = 4; j >= 0; j--)
                draw_sprite(sCustomNightFaces, UnknownEnum.Value_50 + j, ButtonX + (16 * j), ButtonY);
            
            break;
        
        case 2:
            draw_text((ButtonX + ButtonWidth) - 4, (ButtonY + ButtonHeight) - 21, "VS. Psycho Foe Fredbear");
            draw_sprite(sCustomNightFaces, UnknownEnum.Value_55, ButtonX, ButtonY);
            break;
    }
    
    ButtonY += ButtonHeight;
}

if (BossSelected != -1)
{
    ButtonY = 174;
    ButtonWidth = 71;
    ButtonHeight = 22;
    var OptionText = ["Easy", "Normal", "Hard", "Lunatic", (BossSelected == 1) ? "Peaceful" : "Endless"];
    draw_set_halign(fa_left);
    
    for (var i = 0; i < 5; i++)
    {
        draw_set_halign(fa_left);
        
        if (i == 4 && BossSelected == 0)
            break;
        
        draw_sprite_stretched(sTextBox_Windows, DifficultySelected == i, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
        
        if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && DifficultySelected != i)
        {
            DifficultySelected = i;
            audio_play_sound(sfxBump, 5, false);
        }
        
        draw_text(ButtonX + 6, ButtonY + 1, OptionText[i]);
        draw_sprite_stretched(sTextBox_Windows, 2, ButtonX + ButtonWidth, ButtonY, 212 - ButtonWidth, ButtonHeight);
        draw_text(ButtonX + ButtonWidth + 6, ButtonY + 1, (BossSelected == 2) ? "Hi-Score:" : "Best Time:");
        draw_set_halign(fa_right);
        var Score = global.BossHiScores[BossSelected][i];
        draw_text((TopBarOffset + 212) - 1, ButtonY + 1, (Score == 0) ? "-" : ((BossSelected == 2) ? string(Score) : format_as_timer(Score, true)));
        ButtonY += ButtonHeight;
    }
}

if (DifficultySelected != -1 && BossSelected != 1 && !(BossSelected == 2 && DifficultySelected == 4))
{
    draw_set_halign(fa_left);
    ButtonY = 286;
    draw_sprite_stretched(sTextBox_Windows, 1, ButtonX, ButtonY, 212, ButtonHeight);
    draw_text(ButtonX + 6, ButtonY + 1, "Animatronic Selection");
    var OptionText = ["Default", "Random", "Custom"];
    ButtonX = TopBarOffset + 4;
    ButtonY = 310;
    ButtonWidth = 71;
    ButtonHeight = 22;
    
    for (var i = 0; i < 3; i++)
    {
        if (i == 2)
            ButtonWidth--;
        
        draw_sprite_stretched(sTextBox_Windows, AnimatronicSelected == i, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
        
        if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && AnimatronicSelected != i)
        {
            AnimatronicSelected = i;
            audio_play_sound(sfxBump, 5, false);
        }
        
        draw_text(ButtonX + 6, ButtonY + 1, OptionText[i]);
        ButtonX += ButtonWidth;
    }
}

if (DifficultySelected != -1 && BossSelected != -1)
{
    draw_set_halign(fa_left);
    ButtonX = 4 + TopBarOffset;
    ButtonY = 334;
    ButtonWidth = 212;
    ButtonHeight = 22;
    draw_sprite_stretched(sTextBox_Windows, 0, ButtonX, ButtonY, 212, ButtonHeight);
    draw_text(ButtonX + 6, ButtonY + 1, "Start Night");
    
    if ((clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) || input_check_pressed(UnknownEnum.Value_0)) && Active)
        start_night();
}

TileSize += ((Active - TileSize) / 5);

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras.Active = true;
}

if (TileSize < 0.01 && oExtras.Active)
    instance_destroy();

Frame++;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_49 = 49,
    Value_50,
    Value_55 = 55
}
