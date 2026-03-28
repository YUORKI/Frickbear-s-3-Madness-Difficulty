draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var ButtX = 0;
var ButtY = 0;
var SongPlaying = audio_is_playing(MusicPlaying);

if (!SongPlaying && Grooving)
{
    Grooving = false;
    FredSquishSpeed = -0.1;
}

if (!surface_exists(OptionsSurf))
    OptionsSurf = surface_create(194, 281);

surface_set_target(OptionsSurf);
draw_clear_alpha(c_black, 0);
var OptionsHeight = 0;

for (var i = 1; i < array_length(MusicList); i++)
{
    var YPos = (i * 14) - ScrollOffset - 14;
    
    if (clicked(0 + (MenuOffset + 6), YPos + 30, 194, 14) && YPos > -14 && YPos < 281 && MusicList[i].Unlocked)
        switch_page(i);
    
    draw_set_font(global.FontW97White);
    var BGColor = 16777215;
    var TextColor = 0;
    
    if (i == Selected)
    {
        BGColor = 0;
        TextColor = 16777215;
    }
    
    draw_rectangle_color(0, YPos, 194, YPos + 14, BGColor, BGColor, BGColor, BGColor, false);
    var Text = MusicList[i].Name;
    
    if (!MusicList[i].Unlocked)
    {
        Text = "-- LOCKED --";
        TextColor = 12632256;
    }
    
    draw_text_color(3, -3 + YPos, Text, TextColor, TextColor, TextColor, TextColor, 1);
    draw_set_font(global.FontW97Black);
}

surface_reset_target();
draw_sprite_stretched(sTextBox_Windows, 0, MenuOffset, 0, 220, 360);
draw_sprite_stretched(sTextBox_Windows, 1, MenuOffset + 28, 4, 188, 22);
draw_text(MenuOffset + 33, 5, "Music Player");
draw_sprite_stretched(sTextBox_Windows, 2, MenuOffset + 4, 28, 212, 285);
draw_surface(OptionsSurf, MenuOffset + 6, 30);
var ScrollBar = scroll_bar(ScrollOffset, ScrollClicked, MenuOffset + 6, 30, 192, 281, (array_length(MusicList) - 1) * 14, 14);
ScrollOffset = ScrollBar[0];
ScrollClicked = ScrollBar[1];
draw_sprite_stretched(sTextBox_Windows, 2, MenuOffset + 4, 318, 212, 38);
draw_text(MenuOffset + 11, 320, MusicList[Selected].OrgName);
draw_text(MenuOffset + 11, 334, MusicList[Selected].OrgGame);
draw_sprite_stretched(sTextBox_Windows, 0, 224 - MenuOffset, 4, 412, 312);
draw_sprite_stretched(sTextBox_Windows, 2, 228 - MenuOffset, 8, 404, 304);
var BGx = (228 - MenuOffset) + 2;
var BGy = 10;
draw_sprite(sSoundTest_BG, Grooving, BGx, BGy);
var FredFrame = 0;

if (Grooving)
    FredFrame = ((DanceFrame * 0.1 * (MusicList[Selected].BPM / 120)) % 12) + 1;

draw_sprite_ext(sSoundTest_Bonnie, FredFrame, (BGx + 200) - 96, (BGy + 243) - 13, 1 / FredSquish, FredSquish, 0, c_white, 1);

if (Grooving)
    FredFrame = ((DanceFrame * 0.13333333333333333 * (MusicList[Selected].BPM / 120)) % 4) + 1;

draw_sprite_ext(sSoundTest_Chica, FredFrame, BGx + 200 + 96, (BGy + 243) - 13, 1 / FredSquish, FredSquish, 0, c_white, 1);

if (Grooving)
    FredFrame = ((DanceFrame * 0.13333333333333333 * (MusicList[Selected].BPM / 120)) % 8) + 1;

draw_sprite_ext(sSoundTest_Freddy, FredFrame, BGx + 200, BGy + 246, 1 / FredSquish, FredSquish, 0, c_white, 1);
draw_sprite_stretched(sTextBox_Windows, 0, 224 - MenuOffset, 316, 412, 40);
ButtX = MenuOffset + 4;
ButtY = 4;
var Quit = clicked(ButtX, ButtY, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
draw_sprite_stretched(sButtonMini, 0, ButtX, ButtY, 22, 22);
draw_sprite(sButtonMini_Icons, 0, ButtX + 11, ButtY + 11);
ButtX = 228 - MenuOffset;
ButtY = 320;
draw_sprite_stretched(sTextBox_Windows, !Grooving, ButtX, ButtY, 32, 32);
draw_sprite(sButtonMini_Icons, 31 + Grooving, ButtX + 16, ButtY + 16);

if (clicked(ButtX, ButtY, 32, 32) && SongPlaying)
{
    audio_stop_sound(MusicPlaying);
    audio_play_sound(sfxBump, 5, false);
}

var CanLoop = MusicList[Selected].Loop;
ButtX = 260 - MenuOffset;
draw_sprite_stretched(sTextBox_Windows, !Loop || !CanLoop, ButtX, ButtY, 32, 16);
draw_sprite(sButtonMini_Icons, 33, ButtX + 16, ButtY + 8);

if (clicked(ButtX, ButtY, 32, 16) && Loop && CanLoop)
{
    Loop = false;
    audio_play_sound(sfxBump, 5, false);
}

ButtY += 16;
draw_sprite_stretched(sTextBox_Windows, Loop || !CanLoop, ButtX, ButtY, 32, 16);
draw_sprite(sButtonMini_Icons, 34, ButtX + 16, ButtY + 8);

if (clicked(ButtX, ButtY, 32, 16) && !Loop && CanLoop)
{
    Loop = true;
    audio_play_sound(sfxBump, 5, false);
}

var MusicPos = 0;
var MusicLength = 0;

if (SongPlaying)
{
    MusicPos = audio_sound_get_track_position(MusicPlaying);
    MusicLength = audio_sound_length(MusicPlaying);
}

ButtX = 294 - MenuOffset;
draw_sprite_stretched(sTextBox_Windows, 2, ButtX, ButtY, 338, 16);
draw_rectangle_color(ButtX + 4, ButtY + 4, ButtX + 3 + (330 * (MusicPos / MusicLength)), ButtY + 11, c_black, c_black, c_black, c_black, false);
draw_set_halign(fa_center);
draw_text(ButtX + 169, 317, string("{0} / {1}", format_as_timer(MusicPos), format_as_timer(MusicLength)));
draw_set_halign(fa_left);

if (Quit)
{
    audio_play_sound(sfxBump, 5, false);
    
    if (SongPlaying)
        audio_stop_sound(MusicPlaying);
    
    Active = false;
    
    with (oExtras)
        Active = true;
    
    with (oLoopingMusicPlayer)
        audio_sound_gain(MusicPlaying, 1, 1000);
}

if (Active)
{
    MenuOffset -= (MenuOffset / 5);
}
else
{
    MenuOffset += ((-480 - MenuOffset) / 10);
    
    if (round(MenuOffset) == -480)
        instance_destroy();
}

DanceFrame++;
FredSquish += FredSquishSpeed;
FredSquishSpeed = lerp(FredSquishSpeed, (1 - FredSquish) * 0.5, 0.5);

enum UnknownEnum
{
    Value_1 = 1
}
