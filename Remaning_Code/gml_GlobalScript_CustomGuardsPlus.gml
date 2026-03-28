function get_guard_property(arg0, arg1, arg2 = global.Guard, arg3 = false)
{
    var filename = working_directory + "addons/" + guard_name(arg2) + (arg3 ? "/SPOILERS/spoiler_" : "/") + "properties.txt";
    
    try
    {
        if (file_find_first(filename, 0) != "")
        {
            var _buffer = buffer_load(filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            var properties = json_parse(_string);
            
            if (variable_struct_exists(properties, arg0))
                return variable_struct_get(properties, arg0);
            else
                return arg1;
        }
        else
        {
            return arg1;
        }
    }
    catch (_exception)
    {
        show_message("ERROR trying to parse " + string(filename));
    }
}

function can_play_dialogue(arg0, arg1)
{
    var filename = working_directory + "addons/" + guard_name() + arg0;
    return file_find_first(filename, 0) != "";
}

function read_custom_dialogue(arg0, arg1 = "DIALOGUE", arg2, arg3)
{
    arg0 = "/" + arg0;
    var Import = import_dialogue(global.Guard, arg0);
    
    if (can_play_dialogue(arg0) && variable_struct_exists(Import, arg1))
    {
        var Struct = variable_struct_get(Import, arg1);
        read_script(Struct, arg3);
    }
    else
    {
        show_debug_message("Dialogue could not be played");
        read_script(arg2, arg3);
    }
}

function handle_line(arg0, arg1)
{
    if (!is_array(arg0) || array_length(arg0) < 1)
        exit;
    
    switch (arg0[0])
    {
        case "_skip":
            Skip[TextPageNumber] = true;
            break;
        
        case "_delay":
            Delay[TextPageNumber] = real(arg0[1]);
            break;
        
        case "_effect":
            text_effect(real(arg0[1]), real(arg0[2]), string(arg0[3]));
            break;
        
        case "_lock":
            Lock[TextPageNumber] = true;
            break;
        
        case "_hide":
            Hide[TextPageNumber - 1] = true;
            break;
        
        case "_buffer":
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            break;
        
        case "_split":
            var Value = bool(arg0[1]) ? variable_instance_get(global, arg0[2]) : (variable_struct_exists(arg1, arg0[2]) ? variable_struct_get(arg1, arg0[2]) : undefined);
            var Index = (Value == arg0[3]) ? 4 : 5;
            var CurrentText = arg0[Index];
            
            for (var i = 0; i < array_length(CurrentText); i++)
                handle_line(CurrentText[i], arg1);
            
            break;
        
        case "_func":
            CGPFunction[TextPageNumber][0] = function(arg0)
            {
                for (var i = 0; i < array_length(arg0); i++)
                    handle_func(arg0[i]);
            };
            
            CGPFunction[TextPageNumber][1] = arg0[1];
            break;
        
        case "_money":
            var defaultMoneyScript = [["_delay", 120], ["_func", [["playSound", "sfxPhoneRing", 10, true]]], ["...Seems like something else has come up.", ""], ["_func", [["stopSound", "sfxPhoneRing"], ["playSound", "sfxPhonePickup", 10, false]]], ["_delay", 120], ["WAAAAAAAAAAHH!!", "The Boss"], ["_effect", 0, 99, "Shake"], ["_func", [["playMusic", "musMidnight_TheBoss", 0.5]]], ["I've been SCAMMED! SWINDLED! HOODWINKED!", "The Boss"], ["_effect", 10, 99, "Shake"], ["When were you gonna tell me about these files, huh!?", "The Boss"], ["...What!? Don't tell me you don't know what I'm talking about!", "The Boss"], ["The ones I found in your office, you stooge! I took a look through them, and as it turns out...", "The Boss"], ["Those jerks who sold me the company were hiding MILLIONS in property RIGHT UNDER MY NOSE!", "The Boss"], ["Look, you're the only chump I can trust with this, so shut your trap and listen up!", "The Boss"], ["According to these files, there's a secret bunker out there in the middle of the woods.", "The Boss"], ["And, more importantly...the place is stuffed to the brim with animatronics that could make me RRRRRRRICH!!", "The Boss"], ["_effect", 94, 128, "Shake"], ["_split", false, "IsGoodOrEvil", false, [["...What? You just wanna go home?", "The Boss"], ["Grrr...FINE! I'll sweeten the deal.", "The Boss"], ["If you do this for me, I'll take you out to a steakhouse I like. My treat!", "The Boss"], ["...Huh? It's a deal?", "The Boss"], ["Wahaha, excellent! I knew I could count on you.", "The Boss"], ["Now MOVE IT!! Time is money!", "The Boss"], ["_effect", 4, 13, "Shake"]], [["I need you to crawl down there and retrieve those bots! And it better be NOW!", "The Boss"], ["...Oh, and if you do, I'll, uh...take you out to dinner or something. My treat!", "The Boss"], ["I BETTER see you there!", "The Boss"]]], ["_delay", 120], ["_func", [["stopSound", "musMidnight_TheBoss"], ["playSound", "sfxPhonePickup", 10, false]]], ["_split", false, "IsGoodOrEvil", true, [["...Well, you can't do two things at once. You've got a choice to make here.", ""], ["Who will you along with?", ""], ["_option", ["Help the Boss", "ChoiceConfirm_Money"]], ["_split", false, "IsGood", true, [["_option", ["Help Michael", "ChoiceConfirm_Good"]]], [["_option", ["Help the Rabbit", "ChoiceConfirm_Evil"]]]]], [["...Seems your work isn't over quite yet.", ""], ["Time to see what awaits you in the Faz-bunker.", ""], ["_func", [["salvage"]]]]]];
            read_custom_dialogue("SPOILERS/dialogue/cutscene_Midnight_Night5_Money.txt", "DIALOGUE", defaultMoneyScript, arg1);
            break;
        
        case "_prescripted_sequence":
            switch (arg0[1])
            {
                case "mci":
                    read_script([["_delay", 240], ["_func", [["fadeMusic", "musMidnight_Vanny", 0, 3], ["setObjectDepth", "oTextBox", -5], ["fadeOut", 3]]], ["_buffer"], ["_hide"], ["_func", [["setObject", "oTextBox", "TextBoxSprite", [true, "sNOTHING"]], ["setObject", "oFadeMachine", "FadeBox", [false, false]], ["setObject", "oTalksprite", "visible", [false, false]], ["setObject", "oMidnightCutscene", "sprite_index", [true, "sNOTHING"]], ["addObject", "oMCICutscene", [0, 0, oTextBox.depth + 1]], ["playMusic", "mus_MCICutscene", 1]]], ["So, this place...", ""], ["Pretty run down these days, huh?", ""], ["...But that wasn't always the case.", ""], ["_func", [["setObject", "oMCICutscene", "FadeTarget", [false, 1]]]], ["Back in the 80's? Gosh, Freddy's was the place to BE!", ""], ["Everyone and their grandmother wanted to hang out here! If you were a kid, you wouldn't be caught dead anywhere else!", ""], ["_func", [["setObject", "oMCICutscene", "FadeTarget", [false, 0]]]], ["...Er, well, you get what I mean. Kids loved this place. I'm sure you can imagine how big the crowds were here.", ""], ["But among those happy crowds, there were a few kids who...weren't so happy.", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 1]], ["setObject", "oMCICutscene", "FadeTarget", [false, 1]]]], ["The lonely ones. The ones who had trouble making friends.", ""], ["There they sat, far away from the crowds, all on their own, all sad and lonely.", ""], ["Until one day....", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 2]]]], ["...A friend came their way.", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 3]]]], ["A man. One of the place's performers, actually. He loved putting smiles on kids' faces, so he'd seek out the loneliest ones he could find.", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 4]]]], ["And - hoo boy, was he good at his job! He'd help them beat the arcade games, sneak them toys from behind the prize corner...stuff like that.", ""], ["And the kids absolutely adored him. I mean, who wouldn't?", ""], ["_func", [["setObject", "oMCICutscene", "FadeTarget", [false, 0]]]], ["...Eventually, those kids' birthdays would come around.", ""], ["Nobody would show up, of course.", ""], ["...That is, except for the man.", ""], ["_func", [["setObject", "oMCICutscene", "FadeTarget", [false, 1]], ["setObject", "oMCICutscene", "CurrentSlide", [false, 5]]]], ["\"Why the long face?\", he'd say. \"Did you not like the gift I got for you?\"", ""], ["\"...Oh, silly me! You must not have found it yet. I should've known!\"", ""], ["\"Here, I'll show you to it! Follow me.\"", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 6]]]], ["They'd follow along, of course. Who would they be to not trust their best friend?", ""], ["_func", [["setObject", "oMCICutscene", "CurrentSlide", [false, 7]]]], ["He brought them to a back room, in a corner of the pizzeria few ever looked...and fewer ever ventured to.", ""], ["\"Are you ready? Close your eyes!\" he'd say, as he ushered them into the room.", ""], ["_func", [["setObject", "oMCICutscene", "FadeTarget", [false, 0]], ["fadeMusic", "mus_MCICutscene", 0, 2000]]], ["They went in. He followed behind.", ""], ["And just as they opened their eyes...", ""], ["_func", [["addObject", "oSpringtrapSlashCutscene", [0, 0, 1]], ["removeObject", "oMCICutscene"]]], ["_delay", 240], ["...There were four children in total. The police never found any of them.", ""], ["...The police never found the man, either.", ""], ["Do you wanna know the funniest part?", ""], ["That man...", ""], ["_func", [["playSound", "sfxSwoosh", 10, false], ["addObject", "oSpringtrapRevealCutscene", [0, 0, 1]]]], ["_delay", 120], ["He's been right here with you this whole time!", ""], ["_func", [["playSound", "sfxMetalImpact", 10, false], ["stopSound", "mus_MCICutscene"], ["removeObject", "oSpringtrapRevealCutscene"], ["fadeIn", -2], ["setActor", 3], ["setObject", "oTalksprite", "visible", [false, true]], ["setObject", "oMidnightCutscene", "sprite_index", [true, "sParkingLotBG"]]]], ["_delay", 240], ["_buffer"], ["_hide"], ["_func", [["setObject", "oTextBox", "TextBoxSprite", [true, "sTextBox"]], ["fadeMusic", "musMidnight_Vanny", 1, 5000]]], ["_buffer"]]);
                    break;
                
                case "talbert":
                    read_script([["_func", [["switchActor", [2, 1]]]], ["Come to think of it, I wouldn't exactly call YOU charming either. You're BOTH obnoxious.", "White Rabbit"], ["Oh PLEASE! You wouldn't know the first thing about what makes a good manager!", "The Boss"], ["_func", [["switchActor", [5, 0]]]], ["Do either of you have any idea what kinds of decisions I have to make!? Like just last week!", "The Boss"], ["My favorite pizza place jacked up the price on their garlic powder pizza, so I had to fire half my staff to maintain a profit!", "The Boss"], ["_func", [["playSound", "sfxWindyAmbience", 10, true], ["fadeMusic", "sfxWindyAmbience", 1, 10000], ["fadeMusic", "musMidnight_TheBoss", 0, 10000], ["fadeMusic", "voc_tsTheBoss", 0, 10000], ["fadeMusic", "voc_tsMichael", 0, 10000], ["fadeMusic", "voc_tsVanny", 0, 10000], ["fadeMusic", "voc_tsDefault", 0, 10000], ["fadeOut", 10], ["switchActor", [7, 1]]]], ["_skip"], ["_lock"], ["You OWN A PIZZERIA! Can't you just, I dunno, MAKE YOUR OWN!?.", "White Rabbit"], ["_skip"], ["_lock"], ["Oh, please! Have you TRIED the pizza here? I've had motor oil that tasted better!.", "The Boss"], ["_skip"], ["_lock"], ["_func", [["switchActor", [5, 0]]]], ["Oh, angels above, both of you, listen! NONE of you have a single clue what you're getting yourselves into!.", "Hooded Man"], ["_skip"], ["_lock"], ["_func", [["switchActor", [2, 1]]]], ["What did he say about motor oil?.", "White Rabbit"], ["_skip"], ["_lock"], ["Like I said, difficult decisions! You have no IDEA how expensive fast food is these days!.", "The Boss"], ["_delay", 120], ["_buffer"], ["_func", [["setObject", "oTextBox", "TextBoxSprite", [true, "sNOTHING"]], ["setObject", "oFadeMachine", "FadeBox", [false, false]], ["destroyObject", "oTalksprite"], ["setObject", "oMidnightCutscene", "sprite_index", [true, "sNOTHING"]], ["fadeMusic", "sfxWindyAmbience", 0.25, 0], ["stopSound", "musMidnight_TheBoss"], ["fadeMusic", "musMidnight_TheBoss", 0.5, 0], ["fadeMusic", "voc_tsTheBoss", 1, 0], ["fadeMusic", "voc_tsMichael", 1, 0], ["fadeMusic", "voc_tsVanny", 1, 0], ["fadeMusic", "voc_tsDefault", 1, 0]]]]);
            }
            
            break;
        
        case "_option":
            add_option(arg0[1][0], arg0[1][1]);
            break;
        
        default:
            if (array_length(arg0) > 1)
                add_page(arg0[0], arg0[1]);
            else
                add_page(arg0[0], "");
            
            break;
    }
}

function handle_func(arg0)
{
    switch (arg0[0])
    {
        case "addObject":
            instance_create_depth(arg0[2][0], arg0[2][1], oTextBox.depth + 1, asset_get_index(arg0[1]));
            break;
        
        case "setObject":
            var Object = asset_get_index(arg0[1]);
            
            with (Object)
            {
                if (variable_instance_exists(Object, arg0[2]))
                {
                    if (arg0[3][0])
                        variable_instance_set(Object, arg0[2], asset_get_index(arg0[3][1]));
                    else
                        variable_instance_set(Object, arg0[2], arg0[3][1]);
                }
            }
            
            break;
        
        case "removeObject":
            instance_destroy(asset_get_index(arg0[1]));
            break;
        
        case "setObjectDepth":
            with (asset_get_index(arg0[1]))
                depth -= real(arg0[2]);
            
            break;
        
        case "addActor":
            with (instance_create_depth(800, 0, 50, oTalksprite))
            {
                Image = arg0[1];
                sprite_index = asset_get_index(arg0[2]);
            }
            
            break;
        
        case "setActor":
            with (oTalksprite)
                Image = arg0[1];
            
            break;
        
        case "switchActor":
            with (oTalksprite)
            {
                switch_chars(arg0[1][0], arg0[1][1]);
                
                if (array_length(arg0) > 2)
                    SecondarySprite = asset_get_index(arg0[2]);
            }
            
            break;
        
        case "removeActor":
            with (oTalksprite)
                Enter = false;
            
            break;
        
        case "fadeOut":
            with (instance_create_depth(x, y, oTextBox.depth + 2, oFadeMachine))
            {
                FadeSeconds = arg0[1];
                Alpha = 0;
                FadeBox = true;
            }
            
            break;
        
        case "fadeIn":
            with (oFadeMachine)
            {
                Alpha = 2;
                FadeSeconds = arg0[1];
                FadeBox = true;
            }
            
            break;
        
        case "playSound":
            if (array_length(arg0) > 4)
                audio_play_sound(asset_get_index(arg0[1]), arg0[2], arg0[3], arg0[4]);
            else
                audio_play_sound(asset_get_index(arg0[1]), arg0[2], arg0[3]);
            
            break;
        
        case "playMusic":
            play_music(asset_get_index(arg0[1]), arg0[2]);
            break;
        
        case "fadeMusic":
            audio_sound_gain(asset_get_index(arg0[1]), arg0[2], arg0[3]);
            break;
        
        case "stopSound":
            audio_stop_sound(asset_get_index(arg0[1]));
            break;
        
        case "night6":
            switch (arg0[1])
            {
                case "vanny":
                    global.Route = UnknownEnum.Value_3;
                    break;
                
                case "michael":
                    global.Route = UnknownEnum.Value_2;
                    break;
            }
            
            with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                Destination = SalvageResults;
            
            break;
        
        case "credits":
            with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                Destination = Credits;
            
            break;
        
        case "failTransition":
            if (global.Night == 5 && array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                with (oTextBox)
                    money_route_split(has_been_good() && currently_good(), has_been_evil() && currently_evil());
            }
            else if (global.Night == 5 && !currently_good() && !currently_evil())
            {
                audio_stop_all();
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = Credits;
            }
            else
            {
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            }
            
            break;
        
        case "salvage":
            if (global.Night == 1 && global.Difficulty < 3)
                array_push(global.AllTimeSalvages, UnknownEnum.Value_14);
            
            if (global.Night == 5)
                global.Route = UnknownEnum.Value_1;
            
            instance_create_depth(0, 0, 0, oTransitionMinigame);
            break;
        
        case "talbertReveal":
            instance_create_depth(0, 0, depth, oTalbertReveal);
            break;
        
        case "talbertPuppet":
            with (oTalbertReveal)
                PuppetReveal = true;
            
            break;
        
        case "talbert":
            room_goto(TalbertRoom);
            break;
        
        default:
            break;
    }
}

function initialize_mask_sprites()
{
    var MaskSprite = sprite_duplicate(sMask);
    
    for (var i = 1; i < 4; i++)
    {
        var Sprite = sprite_duplicate(sMask);
        
        if (Sprite != -1)
        {
            sprite_merge(MaskSprite, Sprite);
            sprite_delete(Sprite);
        }
    }
    
    MaskSprite = import_sprites("mask.png", MaskSprite, 2, 0, 0, sMask);
    return MaskSprite;
}

function get_guard_themes(arg0, arg1)
{
    var returnThemes = arg0;
    
    for (var i = 0; i < array_length(returnThemes) && i < array_length(arg1); i++)
    {
        var CurrentTheme = get_guard_property(arg1[i], returnThemes[i]);
        
        if (CurrentTheme != returnThemes[i])
        {
            CurrentTheme[0] = import_sound(global.Guard, "/songs/" + CurrentTheme[0]);
            returnThemes[i] = CurrentTheme;
        }
    }
    
    return returnThemes;
}

function get_guard_music_player(arg0, arg1)
{
    var Themes = [];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        var Data = arg0[i];
        var CanLoop = array_length(Data) == 6;
        var Song = 
        {
            Name: Data[0],
            File: import_sound(arg1, string("/songs/{0}", Data[1]), CanLoop ? Data[5] : -4),
            Unlocked: true,
            Loop: CanLoop,
            BPM: Data[2],
            OrgName: Data[3],
            OrgGame: Data[4]
        };
        array_push(Themes, Song);
    }
    
    return Themes;
}

function read_script(arg0, arg1 = {})
{
    for (var i = 0; i < array_length(arg0); i++)
        handle_line(arg0[i], arg1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_14 = 14,
    Value_41 = 41
}
