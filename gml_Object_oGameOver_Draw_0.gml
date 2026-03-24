if (global.Jumpscare == -1)
    draw_sprite_ext(sJumpscareDeathscreen, UnknownEnum.Value_15, 320, 180, 1, 1, 0, c_white, 1);
else if (global.Skins[global.Jumpscare] > -1)
    draw_imported_deathscreen(CustomDeathscreen);
else
    draw_sprite_ext(sJumpscareDeathscreen, global.Jumpscare, 320, 180, 1, 1, 0, c_white, 1);

draw_self();
draw_set_halign(fa_center);
draw_set_font(global.FontW97White);
draw_set_color(c_red);
draw_set_alpha(Alpha);
var TimeLasted = "Time Lasted: " + format_as_timer(min(global.TimeOfDeath, 359.99), true);

if (boss_fight_night())
    TimeLasted = "Died on phase " + string(global.BossPhase);

draw_text_ext(320, 216, Tip, 14, 600);
draw_text_ext(320, 12, TimeLasted, 14, 600);
draw_set_alpha(1);

if (Frame > 15 && SoundPlaying != undefined && subtitles_enabled())
{
    draw_set_halign(fa_center);
    draw_set_font(global.FontW97White);
    var SubtitleText = SubtitleList[SubtitleEntry];
    var SubtitleEndpoint = 999;
    
    if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
        SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
    
    if (audio_sound_get_track_position(SoundPlaying) > SubtitleEndpoint)
        SubtitleEntry++;
    
    if (!audio_is_playing(SoundPlaying))
        SoundPlaying = undefined;
    
    draw_text_ext(320, 330, SubtitleText, 14, 600);
}

draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
draw_set_color(c_white);

if (Frame > 120)
    Alpha = min(Alpha + 0.016666666666666666, 1);

Frame += 1;

if (Frame > 120)
{
    draw_set_halign(fa_center);
    draw_set_font(global.FontW97White);
    draw_text_color(320, 270 + OptionOffset, "Retry Night", c_red, c_red, c_red, c_red, Alpha * (1 - (abs(0 - OptionOffset) / 20)));
    draw_text_color(320, 290 + OptionOffset, "Quit to Menu", c_red, c_red, c_red, c_red, Alpha * (1 - (abs(-10 - OptionOffset) / 20)));
    draw_text_color(320, 310 + OptionOffset, "Quit Game", c_red, c_red, c_red, c_red, Alpha * (1 - (abs(-20 - OptionOffset) / 20)));
    OptionOffset += (((-10 * SelectedOption) - OptionOffset) / 5);
    
    if (ExitFrame == 0)
        SelectedOption += (input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2));
    
    if ((input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2)) != 0)
        audio_play_sound(sfxCamSwitch, 99, false);
    
    SelectedOption = (SelectedOption + 3) % 3;
    draw_set_halign(fa_left);
}

if (input_check_pressed(UnknownEnum.Value_0) && ExitFrame == 0 && Frame > 120)
{
    ExitFrame = 1;
    
    if (SoundPlaying != undefined)
        audio_stop_sound(SoundPlaying);
    
    instance_destroy(oSoundPlayer);
    audio_play_sound(sfxClick, 99, false);
}

if (Frame == 15 && global.Jumpscare != -1)
{
    var Subtitles;
    
    if (global.Skins[global.Jumpscare] > -1)
    {
        var QuipList = skin_sound_array(global.Jumpscare, "voc_deathquip");
        
        if (array_length(QuipList) == 0)
        {
            Sound = sfxNOTHING;
            Subtitles = subtitle(Sound);
        }
        else
        {
            var Line = ((global.DeathRecord[global.Jumpscare] + global.FunValue[0]) * global.FunValue[1]) % array_length(QuipList);
            var File = QuipList[Line];
            Sound = audio_create_stream(File);
            Subtitles = skin_sound_subtitles(File);
        }
    }
    else
    {
        Sound = get_deathquip(global.Jumpscare);
        Subtitles = subtitle(Sound);
    }
    
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SoundPlaying = reverb_sound(Sound, 0, 0, false, 1.25);
    SubtitleEntry = 0;
}

if (ExitFrame != 0)
{
    draw_rectangle_color(0, 0, 640, 180 * ExitDegree, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 360 - (180 * ExitDegree), 640, 360, c_black, c_black, c_black, c_black, false);
    ExitDegree += ((1 - ExitDegree) / 5);
    
    if (ExitFrame >= 60)
    {
        switch (SelectedOption)
        {
            case 0:
                clear_summons();
                room_goto(Office);
                break;
            
            case 1:
                if (global.Night == "Custom")
                    room_goto(CustomNightMenu);
                else
                    room_goto(TitleScreenMap);
                
                break;
            
            case 2:
                game_end();
                break;
        }
    }
    
    ExitFrame++;
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4,
    Value_15 = 15
}
