var ButtX = 6;
var ButtY = 30 + WindowOffset;

if (!surface_exists(StatSurf))
    StatSurf = surface_create(612, 324);

surface_set_target(StatSurf);
draw_clear_alpha(c_white, 0);
draw_surface(application_surface, 0 - ButtX, 0 - ButtY);
draw_set_alpha(0.9);
draw_rectangle_color(0, 0, 612, 324, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);

switch (StatsMenu)
{
    case 0:
        StatsArray[0][1] = format_as_timer(global.Playtime);
        
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            draw_set_halign(fa_right);
            draw_text(606, ((14 * i) + 1) - MenuScroll, StatsArray[i][1]);
            draw_set_halign(fa_left);
            draw_text(6, ((14 * i) + 1) - MenuScroll, StatsArray[i][0]);
        }
        
        break;
    
    case 1:
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            var ID = StatsArray[i].CharID;
            var TotalKills = StatsArray[i].Kills;
            var NameString = global.Descriptions[ID][0];
            
            if (ID == UnknownEnum.Value_56)
                NameString = "Overheat";
            
            if (ID == UnknownEnum.Value_27)
                NameString += string(" ({0}) ({1} Funtime Freddy, {2} Bon-Bon)", TotalKills, global.DeathRecord[UnknownEnum.Value_27], global.DeathRecord[UnknownEnum.Value_30]);
            else
                NameString += string(" ({0} {1})", TotalKills, (TotalKills == 1) ? "Death" : "Deaths");
            
            if (StatsArray[i].Hide)
            {
                NameString = "???";
                draw_sprite(sMysteryTile, 1, 0, (48 * i) - MenuScroll);
            }
            else if (ID == UnknownEnum.Value_56)
            {
                draw_sprite(sFanIcon, 0, 0, (48 * i) - MenuScroll);
            }
            else
            {
                draw_sprite(sCustomNightFaces, ID, 0, (48 * i) - MenuScroll);
            }
            
            if (TotalKills > 0)
                draw_rectangle_color(48, (21 + (i * 48)) - MenuScroll, 48 + ((TotalKills / MaxValue) * 564), (45 + (i * 48)) - MenuScroll, c_black, c_black, c_black, c_black, false);
            
            draw_set_font(global.FontW97Black);
            draw_text(50, ((48 * i) + 1) - MenuScroll, NameString);
        }
        
        break;
    
    case 2:
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            var ID = StatsArray[i].CharID;
            var TotalKills = StatsArray[i].Salvages;
            var NameString = global.Descriptions[ID][0];
            NameString += string(" ({0} {1})", TotalKills, (TotalKills == 1) ? "Salvage" : "Salvages");
            
            if (StatsArray[i].Hide)
            {
                NameString = "???";
                draw_sprite(sMysteryTile, 1, 0, (48 * i) - MenuScroll);
            }
            else
            {
                draw_sprite(sCustomNightFaces, ID, 0, (48 * i) - MenuScroll);
            }
            
            if (TotalKills > 0)
                draw_rectangle_color(48, (21 + (i * 48)) - MenuScroll, 48 + ((TotalKills / MaxValue) * 564), (45 + (i * 48)) - MenuScroll, c_black, c_black, c_black, c_black, false);
            
            draw_set_font(global.FontW97Black);
            draw_text(50, ((48 * i) + 1) - MenuScroll, NameString);
        }
        
        break;
    
    case 3:
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            var ID = StatsArray[i].CharID;
            var TotalTokens = StatsArray[i].Tokens;
            var NameString = string("{0} ({1} Tokens Earned) (Hi-Score: {2})", StatsArray[i].Name, TotalTokens, array_contains([UnknownEnum.Value_0, UnknownEnum.Value_4, UnknownEnum.Value_7], ID) ? format_as_timer(global.HiScoresOverall[ID], true) : global.HiScoresOverall[ID]);
            
            if (StatsArray[i].Hide)
            {
                NameString = "???";
                draw_sprite(sMinigameCarts, 11, 0, (32 * i) - MenuScroll);
            }
            else
            {
                draw_sprite(sMinigameCarts, StatsArray[i].CharID, 0, (32 * i) - MenuScroll);
            }
            
            if (TotalTokens > 0)
                draw_rectangle_color(32, (21 + (i * 32)) - MenuScroll, 32 + ((TotalTokens / MaxValue) * 596), (30 + (i * 32)) - MenuScroll, c_black, c_black, c_black, c_black, false);
            
            draw_set_font(global.FontW97Black);
            draw_text(34, ((32 * i) + 1) - MenuScroll, NameString);
        }
        
        break;
    
    case 4:
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            var ID = StatsArray[i].CharID;
            var TotalTokens = StatsArray[i].Tokens;
            var NameString = string("{0} (Bought {1} {2})", StatsArray[i].Name, TotalTokens, (TotalTokens == 1) ? "Time" : "Times");
            
            if (StatsArray[i].Hide)
            {
                NameString = "???";
                draw_sprite(sMinigameCarts, 11, 0, (32 * i) - MenuScroll);
            }
            else
            {
                draw_sprite(sShopItemSalvageIcons, StatsArray[i].CharID, 16, 16 + ((32 * i) - MenuScroll));
            }
            
            if (TotalTokens > 0)
                draw_rectangle_color(32, (21 + (i * 32)) - MenuScroll, 32 + ((TotalTokens / MaxValue) * 596), (30 + (i * 32)) - MenuScroll, c_black, c_black, c_black, c_black, false);
            
            draw_set_font(global.FontW97Black);
            draw_text(34, ((32 * i) + 1) - MenuScroll, NameString);
        }
        
        break;
    
    case 5:
        for (var i = 0; i < array_length(StatsArray); i++)
        {
            for (var j = 0; j < array_length(StatsArray[i]); j++)
            {
                if (StatsArray[array_length(StatsArray) - 1][j] == 0)
                    continue;
                
                if (j == 6)
                {
                    draw_set_halign(fa_right);
                    draw_text(606, ((14 * i) + 1) - MenuScroll, string(StatsArray[i][j]));
                    draw_set_halign(fa_left);
                }
                else
                {
                    draw_set_halign(fa_left);
                    draw_text(6 + (j * 80), ((14 * i) + 1) - MenuScroll, string(StatsArray[i][j]));
                }
            }
        }
        
        break;
}

surface_reset_target();
draw_sprite_stretched(sTextBox_Windows, 0, 0, WindowOffset, 640, 360);
ButtX = 28;
ButtY = WindowOffset + 4;
var OptionNames = ["General", "Deaths", "Salvages", "Minigames", "Upgrades", "Endings"];
var ButtonWidth = floor(608 / array_length(OptionNames));
var ButtonOffset = 608 - (ButtonWidth * array_length(OptionNames));

for (var i = 0; i < array_length(OptionNames); i++)
{
    ButtX = 28 + (i * ButtonWidth) + ButtonOffset;
    
    if (mouse_in_zone(ButtX, ButtY, ButtonWidth, 22) && mouse_check_button_pressed(mb_left))
    {
        StatsMenu = i;
        get_stats(StatsMenu);
        audio_play_sound(sfxClick, 10, false);
    }
    
    draw_sprite_stretched(sButtonMini, StatsMenu == i, ButtX, ButtY, ButtonWidth, 22);
    draw_text(ButtX + 6, ButtY + 1, OptionNames[i]);
}

ButtX = 4;
ButtY = WindowOffset + 28;
draw_sprite_stretched(sTextBox_Windows, 2, ButtX, ButtY, 632, 328);
ButtX = 6;
ButtY = 30 + WindowOffset;
draw_surface(StatSurf, ButtX, ButtY);
var ScrollBar = scroll_bar(MenuScroll, BarHeld, ButtX, ButtY, 612, 324, TextHeight, 14);
MenuScroll = ScrollBar[0];
BarHeld = ScrollBar[1];
ButtX = 4;
ButtY = WindowOffset + 4;
var Quit = clicked(ButtX, ButtY, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
draw_sprite_stretched(sButtonMini, 0, ButtX, ButtY, 22, 22);
draw_sprite(sButtonMini_Icons, 0, ButtX + 11, ButtY + 11);

if (Quit)
{
    Active = false;
    audio_play_sound(sfxBump, 5, false);
    oExtras.Active = true;
}

if (Active)
{
    WindowOffset -= (WindowOffset / 5);
}
else
{
    WindowOffset += ((360 - WindowOffset) / 5);
    
    if (round(WindowOffset) == 360)
        instance_destroy();
}

show_debug_message(MenuScroll);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_4 = 4,
    Value_7 = 7,
    Value_27 = 27,
    Value_30 = 30,
    Value_56 = 56
}
