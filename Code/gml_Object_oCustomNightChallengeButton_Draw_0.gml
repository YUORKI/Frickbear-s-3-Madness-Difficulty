if (!Loaded)
{
    var LevelsSaved = [];
    var CheatsSaved = [];
    array_copy(LevelsSaved, 0, global.AILevels, 0, array_length(global.AILevels));
    array_copy(CheatsSaved, 0, global.Cheats, 0, array_length(global.Cheats));
    set_levels(Text);
    
    for (var i = 0; i < array_length(global.AILevels); i += 1)
    {
        if (!global.UnlockedAnimatronics[i] && global.AILevels[i] > 0)
            Locked = true;
        
        global.AILevels[i] = LevelsSaved[i];
    }
    
    if ((Text == "Gaming Hard?" && !global.UnlockedMinigames[UnknownEnum.Value_7]) || (Text == "The LolzHax Shuffle" && !global.UnlockedTrophies[UnknownEnum.Value_33]))
        Locked = true;
    
    array_copy(global.Cheats, 0, CheatsSaved, 0, array_length(CheatsSaved));
    
    with (oCustomNightDurationSelector)
    {
        TimeSetting = 5;
        Text = SettingsArray[TimeSetting][0];
        global.NightSpeedup = SettingsArray[TimeSetting][1];
    }
    
    Loaded = true;
}

if (ChallengeID == global.Challenge)
    image_index = 1;
else
    image_index = 0;

if (oCustomNightMenu.ChallengesOpen)
{
    if (touching_mouse() && mouse_check_button_pressed(mb_left) && y >= 8 && y < 320 && !Locked && mouse_in_zone(480, 32, 144, 288))
    {
        global.Cheats = array_create(10, false);
        audio_play_sound(sfxBump, 1, false);
        global.Cheats = array_create(10, false);
        set_levels(Text);
        
        for (var i = 0; i < array_length(global.AILevels); i += 1)
        {
            if (!global.UnlockedAnimatronics[i] || (i >= 40 && !global.Cheats[UnknownEnum.Value_0]))
                global.AILevels[i] = 0;
        }
    }
    
    y = BaseY - oCustomNightMenu.ChallengesOffset;
    
    if (y >= 8 && y < 320)
    {
        draw_self();
        
        if (!Locked)
        {
            draw_text(x + 6, y + 2, Text);
        }
        else
        {
            draw_sprite(sCustomNightChallengeSticker, 3, x + 3, y + 3);
            Desc = "This challenge has yet to be unlocked.";
        }
        
        var ChallengeClear = global.ClearedChallenges[ChallengeID];
        
        if (ChallengeClear > 0)
            draw_sprite(sCustomNightChallengeSticker, 0, (x + sprite_width) - 21, y + 3);
        
        if (ChallengeClear > 1)
            draw_sprite(sCustomNightChallengeSticker, ChallengeClear - 1, (x + sprite_width) - 29, y + 3);
    }
    
    var RelativeMouseX = device_mouse_x_to_gui(0) - x;
    var RelativeMouseY = device_mouse_y_to_gui(0) - y;
    
    if (0 <= RelativeMouseX && RelativeMouseX < sprite_width && global.ChallengeTitle == Text)
    {
        with (oCustomNightMenu)
        {
            var FullDescription = string("{0} (NIGHT LENGTH: {1})", other.Desc, oCustomNightDurationSelector.Text);
            
            if (global.Cheats[UnknownEnum.Value_2])
                FullDescription += " (No Power Drain)";
            
            if (global.Cheats[UnknownEnum.Value_4])
                FullDescription += " (No Temperature Gain)";
            
            draw_text_ext(5, WindowY, FullDescription, 14, 462);
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4,
    Value_7 = 7,
    Value_33 = 33
}
