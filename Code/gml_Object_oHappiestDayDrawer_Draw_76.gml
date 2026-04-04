if (instance_exists(oCamera))
{
    if (oCamera.HandheldUp != InGame)
    {
        InGame = oCamera.HandheldUp;
        audio_sound_gain(CurrentGameSong, InGame * MusicVolume, 500);
        audio_sound_gain(CurrentOfficeSong, !InGame * MusicVolume, 500);
    }
}

if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);
shader_set(shRecolor);
Pal = [13695200, 7389320, 5662772, 3354368];

if (FadeVal < 0)
    replace_color(Pal[0], Pal[1], Pal[2], Pal[3], col(0), col(1), col(2), col(3));
else
    replace_color(Pal[3], Pal[2], Pal[1], Pal[0], col(3), col(2), col(1), col(0));

var TexC = 3354368;
var TexCLight = 13695200;
draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
draw_sprite(sHD_Crybaby, floor(Timer / 30) % 2, 0, 16);
draw_set_font(global.FontGameboy);

switch (Screen)
{
    case "EmilySoft":
        draw_rectangle_color(0, 0, 160, 144, TexCLight, TexCLight, TexCLight, TexCLight, false);
        draw_sprite(sEmilySoftScreen, 1, 0, max(80 - Timer, 0));
        
        if (Timer == 80)
            audio_play_sound(sfxBitCollect, 10, false);
        
        if (Timer >= 180)
            FadeVal += (sign(3 - FadeVal) / 20);
        
        if (Timer == 240)
        {
            Screen = "OpeningScene";
            Timer = 0;
            change_music(mus_BossNightmare_Cutscene, sfxAmbience);
        }
        
        break;
    
    case "OpeningScene":
        if (TextNum < array_length(TextStorage))
        {
            FadeVal += (sign(0 - FadeVal) / 20);
            var TextToType = string_copy(TextStorage[TextNum], 0, floor(TextType));
            draw_set_color(TexCLight);
            draw_text_ext(8, 72, TextToType, 12, 144);
            draw_set_color(c_white);
            
            if (Timer > 60)
            {
                TextType += 0.5;
                TextType = min(TextType, string_length(TextStorage[TextNum]));
                
                if ((TextType % 1) == 0.5)
                    audio_play_sound(sfxBump, 5, false, 0.5, 0, random_range(0.8, 1.2));
            }
            
            if (input_check_pressed(UnknownEnum.Value_0) && InGame)
            {
                if (TextType < string_length(TextStorage[TextNum]))
                {
                    TextType = string_length(TextStorage[TextNum]);
                }
                else
                {
                    TextType = 0;
                    TextNum++;
                    audio_play_sound(sfxBitCrunch, 5, false);
                }
            }
        }
        else
        {
            FadeVal += (sign(-3 - FadeVal) / 20);
            
            if (FadeVal == -3)
            {
                Timer = 0;
                Screen = "Title";
                change_music(sfxNOTHING, sfxAmbience);
            }
        }
        
        break;
    
    case "Title":
    case "TitleStart":
        if (Screen == "Title")
            FadeVal += (sign(0 - FadeVal) / 20);
        
        draw_sprite(sHD_Title, 0, 0, 0);
        var GuardImage = global.Guard * 4;
        GuardImage += (floor(Timer / 16) % 2);
        
        if ((floor(Timer / 16) % 4) == 3)
            GuardImage += 1;
        
        if (input_check_pressed(UnknownEnum.Value_0) && Screen == "Title")
        {
            Timer = 0;
            Screen = "TitleStart";
            audio_play_sound(sfxBitBoost, 5, false);
        }
        
        if (Screen == "TitleStart")
        {
            GuardImage = global.Guard * 4;
            
            if (Timer < 60 && (floor(Timer / 4) % 2) == 0)
            {
                draw_rectangle_color(40, 96, 160, 128, TexC, TexC, TexC, TexC, false);
            }
            else if (Timer >= 60)
            {
                FadeVal += (sign(3 - FadeVal) / 20);
                
                if (Timer == 120)
                {
                    Screen = "LevelOpen";
                    Timer = 0;
                }
            }
        }
        
        draw_sprite_ext(GuardSprites, GuardImage, 28, 110, 1, 1, 0, c_white, 1);
        break;
    
    case "LevelOpen":
        if (Timer == 30 && (Level == 2 || Level == 5))
        {
            MusicVolume = 0;
            audio_sound_gain(CurrentGameSong, 0, 2000);
            audio_sound_gain(CurrentOfficeSong, 0, 2000);
        }
        
        if (Timer < 120)
            FadeVal += (sign(0 - FadeVal) / 20);
        else
            FadeVal += (sign(3 - FadeVal) / 20);
        
        if (Timer == 175 && !PeacefulMode)
        {
            switch (Level)
            {
                case 2:
                    with (oPhoneGuy_Nightmare)
                    {
                        CallTimer = 1;
                        VoiceClip = voc_Michael_Call2;
                    }
                    
                    break;
                
                case 3:
                    with (oPhoneGuy_Nightmare)
                    {
                        CallTimer = 1;
                        VoiceClip = voc_Michael_Call3;
                    }
                    
                    break;
                
                case 4:
                    with (oPhoneGuy_Nightmare)
                    {
                        CallTimer = 1;
                        VoiceClip = voc_Michael_Call4;
                    }
                    
                    break;
                
                case 5:
                    with (oPhoneGuy_Nightmare)
                    {
                        CallTimer = 1;
                        VoiceClip = voc_Michael_Call5;
                    }
                    
                    break;
            }
        }
        
        if (Timer >= 180)
        {
            MusicVolume = 0.5;
            load_level(Level);
            Timer = 0;
            Screen = "Level";
            var AILevel = (global.Difficulty + 1) * 5;
            
            if (PeacefulMode)
                AILevel = 0;
            
            if (Level == 1)
                change_music(mus_BossNightmare_Opening, sfxAmbience);
            
            if (Level == 2)
            {
                change_music(mus_BossNightmare_MainAlt, mus_BossNightmare_Main);
                
                with (oNightmare)
                    Timer = 0;
                
                with (oNightmareFreddy)
                {
                    AI = AILevel;
                    FreddleCountdown = 9;
                }
            }
            
            if (Level == 3)
            {
                change_music(mus_BossNightmare_MainAlt, mus_BossNightmare_Main);
                
                with (oNightmareBonnie)
                {
                    AI = AILevel;
                    WaitTime = 8;
                }
            }
            
            if (Level == 4)
            {
                change_music(mus_BossNightmare_MainAlt, mus_BossNightmare_Main);
                
                with (oNightmareChica)
                {
                    AI = AILevel;
                    WaitTime = 8;
                }
            }
            
            if (Level == 5)
                change_music(mus_BossNightmare_FinalAlt, mus_BossNightmare_Final);
            
            if (!instance_exists(oNightmare))
                instance_create_depth(0, 0, 0, oNightmare);
            
            if (Level >= 2)
            {
                with (oNightmareFreddy)
                {
                    AI = AILevel;
                    FreddleCountdown = 8;
                }
            }
            
            if (Level >= 3)
            {
                if (oNightmareBonnie.AI == 0)
                {
                    with (oNightmareBonnie)
                    {
                        AI = AILevel;
                        WaitTime = 2;
                    }
                }
            }
            
            if (Level >= 4)
            {
                if (oNightmareChica.AI == 0)
                {
                    with (oNightmareChica)
                    {
                        AI = AILevel;
                        WaitTime = 2;
                    }
                }
            }
            
            if (Level >= 5)
            {
                with (oNightmareFoxy)
                    AI = AILevel;
            }
            
            global.BossPhase = Level;
            
            with (oNightmareFreddy)
                Frozen = false;
            
            with (oNightmareBonnie)
                Frozen = false;
            
            with (oNightmareChica)
                Frozen = false;
        }
        
        draw_rectangle_color(0, 0, 160, 144, TexC, TexC, TexC, TexC, false);
        var LevelNames = ["FAZBEAR HILLS", "BUNNYHOP MOUNTAIN", "DONUT VALLEY", "BRISTLE CLIFFS", "HAPPIEST DAY"];
        draw_set_color(TexCLight);
        draw_text(8, 52, "LEVEL " + string(Level));
        draw_text(8, 76, LevelNames[Level - 1]);
        draw_set_color(c_white);
        break;
    
    case "Level":
        FadeVal += (sign(0 - FadeVal) / 20);
        break;
}

Timer++;

if (Screen == "Level" || Screen == "KidTalk")
{
    draw_rectangle_color(0, 0, 160, 144, TexCLight, TexCLight, TexCLight, TexCLight, false);
    
    if (LockZone == undefined)
        LockZone = instance_nearest(x, y, oHD_CamZone);
    
    TargetX = oHD_Guard.x + 32;
    TargetY = oHD_Guard.y;
    var BoundLeft = 80 + LockZone.x;
    var BoundRight = (LockZone.x + LockZone.sprite_width) - 80;
    var BoundTop = 72 + LockZone.y;
    var BoundBottom = (LockZone.y + LockZone.sprite_height) - 72;
    TargetX = clamp(round(TargetX), BoundLeft, BoundRight);
    TargetY = clamp(round(TargetY), BoundTop, BoundBottom);
    x += ((TargetX - x) / 4);
    y += ((TargetY - y) / 4);
    var rX = clamp(round(x), 80, room_width - 80);
    var rY = clamp(round(y), 72, room_height - 72);
    draw_set_font(global.FontGameboy);
    var Obj = 0;
    var XOff = 80;
    var YOff = 72;
    
    if (instance_exists(oHD_CutsceneZone))
    {
        Obj = oHD_CutsceneZone;
        var ZoneX = (Obj.x - x) + XOff;
        var ZoneY = (Obj.y - y) + YOff;
        draw_sprite(sHD_Kid, ((Level - 1) * 2) + ((Timer / 30) % 2), ZoneX + 128, ZoneY + 112);
        
        if (Level == 5)
        {
            draw_sprite(sHD_Balloon, (Timer / 30) % 2, ZoneX + 32, ZoneY + 128);
            draw_sprite(sHD_Balloon, !((Timer / 30) % 2), ZoneX + 128, ZoneY + 128);
            draw_sprite(sHD_PartyBG, (Timer / 30) % 2, (ZoneX - 160) + 32, ZoneY + 64);
            draw_sprite(sHD_PartyBG, !((Timer / 30) % 2), (ZoneX - 320) + 32, ZoneY + 64);
        }
    }
    
    var Instances = instance_number(oHappiestDayObject);
    
    with (oHD_Guard)
        sprite_index = other.GuardSprites;
    
    for (var o = 0; o < Instances; o++)
    {
        Obj = instance_find(oHappiestDayObject, o);
        
        if (Obj.object_index == oHD_CutsceneZone)
            continue;
        
        if (Obj.sprite_index == -1 || Obj.object_index == oHD_CamZone)
            continue;
        
        draw_sprite_ext(Obj.sprite_index, Obj.image_index, ((Obj.x + Obj.XOffset) - x) + XOff, ((Obj.y + Obj.YOffset) - y) + YOff, Obj.image_xscale, Obj.image_yscale, Obj.image_angle, c_white, 1);
    }
}

if (Screen != "Level")
{
    with (oNightmare)
        global.Temperature = max(global.Temperature - 0.5, 0);
}

if (Screen == "KidTalk")
{
    with (oNightmareFreddy)
        Frozen = true;
    
    with (oNightmareBonnie)
        Frozen = true;
    
    with (oNightmareChica)
        Frozen = true;
    
    draw_rectangle_color(0, 0, 160, 96, TexC, TexC, TexC, TexC, false);
    var Dialogue = EndLevelDialogue[Level - 1];
    
    if (TextNum < array_length(Dialogue))
    {
        FadeVal += (sign(0 - FadeVal) / 20);
        var TextToType = string_copy(Dialogue[TextNum], 0, floor(TextType));
        draw_set_color(TexCLight);
        draw_text_ext(8, 8, TextToType, 12, 144);
        draw_set_color(c_white);
        
        if ((TextType % 1) == 0.5 && TextType < string_length(Dialogue[TextNum]))
            audio_play_sound(sfxBump, 5, false, 0.5, 0, random_range(0.8, 1.2));
        
        if (Timer > 60)
        {
            TextType += 0.5;
            TextType = min(TextType, string_length(Dialogue[TextNum]));
        }
        
        if (input_check_pressed(UnknownEnum.Value_0) && InGame)
        {
            if (TextType < string_length(Dialogue[TextNum]))
            {
                TextType = string_length(Dialogue[TextNum]);
            }
            else
            {
                TextType = 0;
                TextNum++;
                audio_play_sound(sfxBitCrunch, 5, false);
            }
        }
    }
    else
    {
        FadeVal += (sign(3 - FadeVal) / 20);
        
        if (FadeVal == 3)
        {
            Timer = 0;
            Level++;
            Screen = "LevelOpen";
            instance_destroy(oHappiestDayObject, false);
        }
    }
}

surface_reset_target();
shader_reset();

enum UnknownEnum
{
    Value_0
}
