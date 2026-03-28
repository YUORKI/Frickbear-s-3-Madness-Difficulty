var YTarget = 256 + (64 * global.Cheats[UnknownEnum.Value_0]);
WindowY += ((YTarget - WindowY) / 4);
draw_sprite_stretched(sWindowBase, 0, 0, WindowY, 480, 360 - WindowY);

if (!ChallengesOpen)
{
    draw_sprite_stretched(sWindowBase, 0, 480, 96, 160, 168);
    draw_sprite_stretched(sWindowBase, 0, 480, 264, 112, 64);
    global.Challenge = undefined;
    global.ChallengeTitle = "None";
}
else
{
    var ScrollbarHeight = array_length(CNChallenges) - 2;
    
    if (global.ClearedChallenges[array_length(CNChallenges) - 1])
        ScrollbarHeight += 2;
    else if (global.ClearedChallenges[array_length(CNChallenges) - 1])
        ScrollbarHeight++;
    
    draw_sprite_stretched(sWindowBase, 0, 480, 320, 160, 8);
    var ScrollBar = scroll_bar(ChallengesOffset, ChallengesDrag, 480, 32, 144, 288, ScrollbarHeight * 24, 24);
    ChallengesOffset = ScrollBar[0];
    ChallengesDrag = ScrollBar[1];
}

if (input_check_pressed(UnknownEnum.Value_1))
{
    audio_stop_sound(musCustomNight);
    audio_play_sound(sfxBump, 10, false);
    room_goto(TitleScreenMap);
}

draw_set_font(global.FontW97Black);

enum UnknownEnum
{
    Value_0,
    Value_1
}
