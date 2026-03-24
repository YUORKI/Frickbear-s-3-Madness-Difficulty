function new_game(arg0)
{
    save_permanent_data();
    initialize_save_data();
    global.Difficulty = arg0;
    global.CanContinue = true;
    
    if (global.Difficulty >= 3)
        array_push(global.AllTimeSalvages, UnknownEnum.Value_14);
    
    load_permanent_data();
    create_save();
    Lock = true;
    RoomDestination = NightOpening;
    goto_menu("Null", 0);
    
    with (oCameraTitleScreen)
    {
        TransitionToCutscene = true;
        Frame = 1;
    }
    
    audio_play_sound(sfxMeleeConfirm, 10, false);
    audio_stop_sound(musTitleScreen);
    audio_stop_sound(musTitleScreen_Evil);
    
    if (skip_cutscenes())
    {
        Lock = false;
        RoomDestination = NightOpening;
        Transitioning = true;
    }
}

if (!Transitioning && !Lock && array_length(CurrentOptions) > 1)
{
    SelectedOption = (SelectedOption + array_length(CurrentOptions) + (input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2))) % array_length(CurrentOptions);
    
    if ((input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2)) != 0)
        audio_play_sound(sfxCamSwitch, 5, false);
}

if (input_check_pressed(UnknownEnum.Value_1) && !Transitioning && CurMenu != "Remap In Progress")
{
    if (CurMenu != "Title")
    {
        audio_play_sound(sfxBump, 5, false);
        PreviousOptions = CurrentOptions;
        PreviousDesc = CurrentDesc;
        SetXOffset = 120;
        PreviousSetXOffset = 0;
    }
    
    switch (CurMenu)
    {
        case "Pause":
            goto_menu("Resume", 0);
            break;
        
        case "New Game":
        case "Options":
        case "Review Animatronics":
        case "Review Upgrades":
            if (room != TitleScreenMap)
                goto_menu("Pause", 0);
            else
                goto_menu("Title", 0);
            
            break;
        
        case "Difficulty":
            goto_menu("New Game", global.Guard);
            break;
        
        case "Remap Controls":
        case "Graphics":
        case "Audio":
        case "Gameplay":
        case "Delete Save Data":
            goto_menu("Options", OptionsMenu);
            save_permanent_data();
            break;
    }
}

if (input_check_pressed(UnknownEnum.Value_0) && !Transitioning && !Lock && ((OptionsMenu == -1 && (CurMenu != "Review Animatronics" && CurMenu != "ReviewUpgrades")) || CurrentOptions[SelectedOption] == "Back" || CurrentOptions[SelectedOption] == "Restore Defaults"))
{
    audio_play_sound(sfxClick, 5, false);
    var Selection = CurrentOptions[SelectedOption];
    PreviousOptions = CurrentOptions;
    PreviousDesc = CurrentDesc;
    
    if (CurMenu == "New Game" && SelectedOption >= 4)
        Selection = "CUSTOM GUARD";
    
    if (!Transitioning)
        CurMenu = Selection;
    
    switch (Selection)
    {
        case "Resume":
            goto_menu("Resume", 0);
            break;
        
        case "Restart Night":
            audio_resume_all();
            audio_stop_all();
            
            if (room == Office && !(boss_fight_night() && global.Route == UnknownEnum.Value_4))
            {
                clear_summons();
                room_restart();
            }
            else
            {
                instance_destroy(oFredbearManager);
                instance_destroy(oPersistentPauser);
                room_goto(FredbearHome);
            }
            
            break;
        
        case "Quit to Menu":
            Transitioning = true;
            
            if (global.Night == "Custom")
                RoomDestination = (global.Route == UnknownEnum.Value_0) ? CustomNightMenu : Extras;
            else
                RoomDestination = TitleScreenMap;
            
            instance_destroy(oFredbearManager);
            instance_destroy(oPersistentPauser);
            break;
        
        case "Quit Game":
            Transitioning = true;
            RoomDestination = GameEnd;
            break;
        
        case "New Game":
            goto_menu("New Game", 0);
            break;
        
        case "Continue":
            Transitioning = true;
            load_save();
            RoomDestination = global.StartRoom;
            break;
        
        case "Custom Night":
            Transitioning = true;
            RoomDestination = CustomNightMenu;
            break;
        
        case "No":
        case "Options":
            goto_menu("Options", 0);
            break;
        
        case "Extras":
            Transitioning = true;
            RoomDestination = Extras;
            break;
        
        case "Remap Controls":
            goto_menu("Remap Controls", 0);
            break;
        
        case "Graphics":
            goto_menu("Graphics", 0);
            break;
        
        case "Audio":
            goto_menu("Audio", 0);
            break;
        
        case "Gameplay":
            goto_menu("Gameplay", 0);
            break;
        
        case "Delete Save Data":
            goto_menu("Delete Save Data", 0);
            break;
        
        case "Restore Defaults":
            switch (OptionsMenu)
            {
                case -1:
                    default_settings();
                    break;
                
                case 0:
                    global.Settings[0] = [32, 27, 87, 65, 83, 68, 83, 87, 65, 68, 90, 88, 49, 50, 51, 52, 53, 54, 55, 56, 81, 87, 69, 82, 32, 16];
                    break;
                
                case 1:
                    global.Settings[1] = [0, 0];
                    break;
                
                case 2:
                    global.Settings[2] = [10, 10, 10];
                    break;
                
                case 3:
                    global.Settings[3] = [0, 0];
                    break;
            }
            
            apply_settings();
            create_save();
            break;
        
        case "Review Animatronics":
            goto_menu("Review Animatronics", 0);
            break;
        
        case "Review Upgrades":
            goto_menu("Review Upgrades", 0);
            break;
        
        case "Yes":
            audio_play_sound(sfxBitExplosion, 10, false);
            var temp = global.Settings;
            initialize_save_data();
            global.Settings = temp;
            apply_settings();
            create_save();
            save_permanent_data();
            room_restart();
        
        case "Back":
            if (OptionsMenu == -1)
            {
                goto_menu("Title", 0);
            }
            else
            {
                goto_menu("Options", 0);
                save_permanent_data();
            }
            
            break;
        
        case "Jeremy":
            global.Guard = 0;
            new_game(0);
            break;
        
        case "Easy":
            new_game(0);
            break;
        
        case "Mike":
            global.Guard = 1;
            new_game(1);
            break;
        
        case "Normal":
            new_game(1);
            break;
        
        case "Vanessa":
            global.Guard = 2;
        
        case "Hard":
            new_game(2);
            break;
        
        case "Fritz":
            global.Guard = 3;
        
        case "Lunatic":
            new_game(3);
            break;
        
        case "Madness":
            new_game(4);
            break;
        
        case "CUSTOM GUARD":
            global.Guard = SelectedOption;
            goto_menu("Difficulty", 0);
            break;
        
        default:
            break;
    }
    
    if (!Transitioning)
    {
        SetXOffset = 120;
        PreviousSetXOffset = 0;
    }
    else
    {
        audio_stop_sound(musTitleScreen);
        audio_stop_sound(musTitleScreen_Evil);
    }
}
else if (input_check_pressed(UnknownEnum.Value_0) && CurMenu == "Remap Controls")
{
    audio_play_sound(sfxClick, 5, false);
    PreviousOptions = CurrentOptions;
    PreviousDesc = CurrentDesc;
    
    if (!Transitioning)
        CurMenu = CurrentOptions[SelectedOption];
    
    RemapKey = SelectedOption;
    CurMenu = "Remap In Progress";
    CurrentOptions = ["Press any key not in use."];
    SelectedOption = 0;
    CurrentDesc = "";
    SetXOffset = 120;
    PreviousSetXOffset = 0;
}
else if (keyboard_check_pressed(vk_anykey) && CurMenu == "Remap In Progress")
{
    var KeyInUse = false;
    
    if (RemapKey < UnknownEnum.Value_6)
    {
        for (var i = 0; i < UnknownEnum.Value_6; i++)
        {
            if (i == UnknownEnum.Value_1 || i == RemapKey)
                continue;
            
            if (global.Settings[0][i] == keyboard_lastkey)
                KeyInUse = true;
        }
    }
    
    if (KeyInUse)
    {
        audio_play_sound(sfxError, 5, false);
    }
    else
    {
        audio_play_sound(sfxClick, 5, false);
        PreviousOptions = CurrentOptions;
        PreviousDesc = CurrentDesc;
        
        if (!Transitioning)
            CurMenu = CurrentOptions[SelectedOption];
        
        if (keyboard_lastkey != global.Settings[0][UnknownEnum.Value_1])
            global.Settings[0][RemapKey] = keyboard_lastkey;
        
        goto_menu("Remap Controls", RemapKey);
        SetXOffset = 120;
        PreviousSetXOffset = 0;
    }
}

if (TransitionFrame >= 60)
    room_goto(RoomDestination);

if (Transitioning)
    TransitionFrame += 1;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4,
    Value_6 = 6,
    Value_14 = 14
}
