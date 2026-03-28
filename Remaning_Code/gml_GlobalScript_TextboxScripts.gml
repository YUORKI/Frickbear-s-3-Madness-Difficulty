function set_defaults_for_text()
{
    line_break_pos[0][TextPageNumber] = 999;
    line_break_num[TextPageNumber] = 0;
    line_break_offset[TextPageNumber] = 0;
    
    for (var l = 0; l < 999; l++)
    {
        TextColor[l][TextPageNumber] = 3354368;
        TextEffect[l][TextPageNumber] = undefined;
        TextFont[l][TextPageNumber] = global.FontHanddrawn;
        TextYOffset[l][TextPageNumber] = 4;
    }
    
    if (array_length(Function) <= TextPageNumber)
    {
        Function[TextPageNumber] = function()
        {
        };
    }
    
    if (array_length(Delay) <= TextPageNumber)
        Delay[TextPageNumber] = 0;
    
    if (array_length(Hide) <= TextPageNumber)
        Hide[TextPageNumber] = false;
    
    if (array_length(Skip) <= TextPageNumber)
        Skip[TextPageNumber] = false;
    
    if (array_length(Lock) <= TextPageNumber)
        Lock[TextPageNumber] = false;
}

function add_page(arg0, arg1)
{
    set_defaults_for_text();
    Text[TextPageNumber] = arg0;
    CharacterSpeaking[TextPageNumber] = arg1;
    TextPageNumber++;
}

function add_function(arg0)
{
    Function[TextPageNumber] = arg0;
}

function add_option(arg0, arg1)
{
    TextOption[TextOptionNumber] = arg0;
    TextOptionLink[TextOptionNumber] = arg1;
    TextOptionNumber++;
}

function text_color(arg0, arg1, arg2)
{
    for (var l = arg0; l <= arg1; l++)
        TextColor[l][TextPageNumber - 1] = arg2;
}

function text_effect(arg0, arg1, arg2)
{
    for (var l = arg0; l <= arg1; l++)
        TextEffect[l][TextPageNumber - 1] = arg2;
}

function text_font(arg0, arg1, arg2)
{
    for (var l = arg0; l <= arg1; l++)
        TextFont[l][TextPageNumber - 1] = arg2;
}

function replace_text(arg0, arg1)
{
    with (oInteractionPoint)
    {
        if (Text == arg0)
            Text = arg1;
    }
}

function salvage_options(arg0)
{
    SalvageID = arg0;
    
    if (arg0 == UnknownEnum.Value_20 || arg0 == UnknownEnum.Value_33 || arg0 == UnknownEnum.Value_34 || arg0 == UnknownEnum.Value_35)
    {
        if (global.SalvagedScraps[0])
            add_page("This animatronic seems to be in very poor condition...Though that white rabbit may be interested in it.", "");
        else
            add_page("This animatronic seems to be in very poor condition... Corporate probably won't accept this.", "");
        
        add_page("You can choose to salvage it anyway and pocket the earnings for yourself, but it won't count towards your quota.", "");
        
        Function[TextPageNumber] = function()
        {
            with (instance_create_depth(320, 360, 256, oSalvageSheet))
                ID = other.SalvageID;
        };
        
        add_page("Salvage this animatronic regardless?", "");
        add_option("Yes", "Salvage_Yes_Special");
        add_option("No", "Salvage_No");
    }
    else
    {
        Function[TextPageNumber] = function()
        {
            with (instance_create_depth(320, 360, 256, oSalvageSheet))
                ID = other.SalvageID;
        };
        
        add_page("Salvage this animatronic?", "");
        add_option("Yes", "Salvage_Yes");
        add_option("No", "Salvage_No");
    }
}

function upgrade_shop()
{
    add_option("Buy Upgrades", "Shop_Upgrades");
    
    if (global.HasGift)
        add_option("Give Gift", "Shop_Gift");
    
    add_option("Tell a story!", "Shop_Story");
    add_option("Info", "Shop_Explain");
    add_option("Quit", "Shop_Quit");
}

function check_if_last_ending()
{
    if (oEndingPFFredbear.EndingsSeen == 3)
    {
        add_page("...", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(1);
        };
        
        add_page("...But you've already seen every way this story ends, haven't you?", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(3);
        };
        
        add_page("And no matter how you go about it, you can't help everyone. Someone gets left behind...", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(0);
        };
        
        add_page("...And by the end of it, you're just back at square one.", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(2);
        };
        
        add_page("Hey, don't be upset! You tried your best, you know?", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(3);
        };
        
        add_page("Besides, it isn't ALL bad...", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(2);
        };
        
        add_page("Even if things stay the same, there's...something comforting about that, you know?", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(1);
        };
        
        add_page("...Well, either way, I'd say you deserve some rest.", "");
        
        Function[TextPageNumber] = function()
        {
            with (oEndingPFFredbear)
                change_expression(0);
        };
        
        add_page("Why don't you take it easy for a while?", "");
    }
}

function game_text(arg0)
{
    add_page("", "");
    var CanTakeMask = !array_contains_ext(global.SalvagesCurrent, [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34], false) || ultimate_route_unlocked() || global.Night >= 2 || global.DevMode;
    
    switch (arg0)
    {
        case "Test":
            add_page("Test Test Test. This is test dialogue.", "Name");
            add_page("Isn't it kinda crazy that Freddy Fazbear's actually been real this whole time? Like, who knew, right?", "Name");
            add_page("This text shakes! This text is haunted!", "Name");
            text_effect(0, 17, "Shake");
            text_effect(18, 999, "Spin");
            add_option("Buy", "Test2");
            add_option("Sell", "Test2");
            break;
        
        case "Test2":
            add_page("Test Test Test. This is more test dialogue.", "Name");
            break;
        
        case "CreditsEnd":
            Function[TextPageNumber] = function()
            {
                global.SalvagesCurrent = [];
                
                with (oSalvageSheet)
                    Delete = true;
                
                with (instance_create_depth(160, 360, 0, oSalvageSheet))
                    PageMode = 2;
            };
            
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oSalvageSheet)
                    Delete = true;
            };
            
            add_page("Thank you for playing, and I hope you had fun!", "");
            
            Function[TextPageNumber] = function()
            {
                audio_sound_gain(musCredits, 0, 1000);
                global.CanContinue = false;
                create_save();
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = TitleScreenMap;
            };
            
            break;
        
        case "GuardIntro":
            Function[TextPageNumber] = function()
            {
                with (oTextBox)
                {
                    IntroTheme = get_guard_themes([[sfxWarioLose, 1]], ["theme_intro"]);
                    Sound = IntroTheme[0][0];
                    
                    if (audio_get_type(Sound))
                        audio_play_sound(Sound, 100, true, IntroTheme[0][1]);
                    else
                        Sound = play_music(musGuardOpening);
                }
                
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = global.Guard;
                    Sprite = import_sprites("outside.png", sTalksprites_GuardIntros, 1, 320, 0);
                    sprite_index = Sprite;
                }
                
                audio_play_sound(sfxSwoosh, 10, false);
            };
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Hello there! My name's Jeremy. Jeremy Fitzgerald!", "Jeremy");
                    add_page("Now, you may be wondering, 'Gosh Jeremy, what's a fella like you doing working at a place like this?'", "Jeremy");
                    add_page("Well, it's quite simple, really! My tuition won't pay for itself, so I figured it was the perfect time to get a summer job.", "Jeremy");
                    add_page("...Well, ANOTHER summer job. The last couple never seemed to end well...", "Jeremy");
                    add_page("First there was that time that old lady's nails almost poked my eye out, and that time I spilled that scalding hot coffee all over my face...", "Jeremy");
                    add_page("...Then that mishap with the knives, THAT was a close one, and that one time the car I was chauffeuring got hijacked...", "Jeremy");
                    add_page("...And that accident I got into during that OTHER chauffeuring job that sent me hurtling through the windshield towards that old lady...", "Jeremy");
                    add_page("...Who was carrying a big tray of hot coffee and knives...", "Jeremy");
                    add_page("But on the bright side, my time in the hospital gave me plenty of time to send out applications, and wouldn't you know it, this one got accepted!", "Jeremy");
                    add_page("I'm confident that this will finally be the one! A kiddie pizza place is just about as safe as it gets, after all.", "Jeremy");
                    add_page("And hey, you know what they say - thirteenth time's the charm!", "Jeremy");
                    add_page("...Oh, right, what am I doing standing out here in the rain? There's mascots to be monitored!", "Jeremy");
                    break;
                
                case 1:
                    add_page("The name's Mike. Mike Schmidt.", "Mike");
                    add_page("The job market's been rough...Well, for me at least. Haven't exactly had the best track record, especially with my resume being...how it is.", "Mike");
                    add_page("I didn't expect to end up working at a place like this, but the career counseler told me it was, quote...", "Mike");
                    add_page("...'Probably the last place in town that would even think about hiring a blasphemously incompetent neanderthal like you'...as he put it.", "Mike");
                    add_page("I'm not really used to night shifts...part of me wonders if I could just sleep through it, but I can't risk getting caught. I'm on thin ice as is.", "Mike");
                    add_page("Even then, this gig seems...odd. Not sure what at this run-down pizza joint is important enough to justify hiring a security guard...", "Mike");
                    add_page("But hey, I'm getting paid for it, and I need this job. Better keep my eyes peeled regardless.", "Mike");
                    add_page("...Right, looks like it's almost midnight. Time to get this started.", "Mike");
                    break;
                
                case 2:
                    add_page("I'm Vanessa Shelley.", "Vanessa");
                    add_page("I didn't think I'd ever wind up here again, but...I guess things have a funny way of working themselves out.", "Vanessa");
                    add_page("To think taking that summer job who knows how many years ago would've led to a whole career...", "Vanessa");
                    add_page("...Right right, about what I'm doing here.", "Vanessa");
                    add_page("I've actually been working at this chain for a while, even before it changed owners - I still slip up and call it Freddy Fazbear's sometimes, heh.", "Vanessa");
                    add_page("Before now I had a job at our flagship location, but the hustle and bustle got to be a bit much for me.", "Vanessa");
                    add_page("And so, I asked upper management if I could transfer to a smaller location, and even with how few locations were still open...", "Vanessa");
                    add_page("...This one happened to have a position available.", "Vanessa");
                    add_page("It almost seemed like fate, y'know? Like the universe itself wanted me to be right back here, at this very moment...", "Vanessa");
                    add_page("...Not that I believe in any of that stuff, of course.", "Vanessa");
                    add_page("Regardless, that's where I am now. Right back where my whole career started...", "Vanessa");
                    add_page("...But that's enough about the past, I suppose. Today begins this new chapter of my career!", "Vanessa");
                    break;
                
                case 3:
                    add_page("...", "Fritz");
                    add_page("...I forgot my name.", "Fritz");
                    break;
                
                default:
                    if (get_guard_property("new_opening_dialogue", false))
                    {
                        read_custom_dialogue("dialogue/cutscene_Opening.txt", "DIALOGUE");
                    }
                    else
                    {
                        var Import = import_dialogue(global.Guard);
                        var NarratorName = "";
                        
                        if (string_lower(Import.FIRST_PERSON) == "true")
                            NarratorName = guard_nickname();
                        
                        for (var i = 0; i < array_length(Import.DIALOGUE); i++)
                            add_page(Import.DIALOGUE[i], NarratorName);
                    }
                    
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(Sound);
                
                with (oTextBox)
                {
                    if (audio_get_type(Sound))
                        audio_destroy_stream(Sound);
                }
                
                with (oTitleMenu)
                    Transitioning = true;
            };
            
            break;
        
        case "Pause":
            add_page("What would you like to do?", "");
            add_option("Resume", "Resume");
            
            if (array_length(global.SalvagesCurrent) > 0)
                add_option("View Salvages", "View_Salvages");
            
            add_option("Quit Game", "Quit_Game");
            break;
        
        case "Resume":
            break;
        
        case "View_Salvages":
            add_page("Which animatronic would you like to check?", "");
            
            for (var i = 0; i < array_length(global.SalvagesCurrent); i++)
                add_option(string(global.Descriptions[global.SalvagesCurrent[i]][0]), "View_Salvage_" + string(i));
            
            add_option("Back", "Pause");
            break;
        
        case "View_Salvage_0":
        case "View_Salvage_1":
        case "View_Salvage_2":
        case "View_Salvage_3":
        case "View_Salvage_4":
        case "View_Salvage_5":
        case "View_Salvage_6":
            SalvageNum = real(string_char_at(arg0, 14));
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(160, 360, 256, oSalvageSheet))
                {
                    ID = global.SalvagesCurrent[other.SalvageNum];
                    PageMode = 1;
                }
            };
            
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oSalvageSheet)
                    Delete = true;
            };
            
            add_page("Which animatronic would you like to check?", "");
            
            for (var i = 0; i < array_length(global.SalvagesCurrent); i++)
                add_option(string(global.Descriptions[global.SalvagesCurrent[i]][0]), "View_Salvage_" + string(i));
            
            add_option("Back", "Pause");
            break;
        
        case "Quit_Game":
            add_page("Are you sure you want to quit? Any unsaved progress will be lost.", "");
            add_option("Quit", "Quit");
            add_option("Back", "Pause");
            break;
        
        case "Quit":
            Function[TextPageNumber] = function()
            {
                game_end();
            };
            
            break;
        
        case "Salvage_Yes":
            var SalvQuota = global.SalvageQuota;
            var SalvAmount = array_length(global.SalvagesCurrent) + 1;
            var Tutorialize = SalvAmount == 1 && global.Night == 1 && !global.UnlockedAnimatronics[UnknownEnum.Value_56];
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxTallyTotal, 30, false);
                array_push(global.SalvagesCurrent, other.SalvageID);
                array_push(global.AllTimeSalvages, other.SalvageID);
                global.SalvageRecord[other.SalvageID]++;
                var Earnings = oSalvageSheet.SalvageStats[other.SalvageID][3] * 0.01;
                global.RunEarnings += Earnings;
                global.RunEarningsTotal += Earnings;
                
                if (array_contains([UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46], other.SalvageID))
                    get_trophy(UnknownEnum.Value_13);
                
                with (oCamera3DMaze.LockOnTarget)
                    Text = "Destroy";
                
                with (oSalvageSheet)
                    Delete = true;
                
                with (instance_create_depth(160, 360, 256, oSalvageSheet))
                {
                    ID = other.SalvageID;
                    PageMode = 1;
                }
            };
            
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oSalvageSheet)
                    Delete = true;
            };
            
            if (SalvAmount < SalvQuota)
            {
                if (Tutorialize)
                {
                    add_page("Animatronic salvaged! If you need a refresher, you can review their mechanics in the pause menu.", "");
                    add_page(string(SalvQuota - SalvAmount) + " more until your quota is met.", "");
                }
                else
                {
                    add_page("Animatronic salvaged! " + string(SalvQuota - SalvAmount) + " more until your quota is met.", "");
                }
            }
            else if (Tutorialize)
            {
                add_page("Animatronic salvaged! If you need a refresher, you can review their mechanics in the pause menu.", "");
                add_page("You can head back to the entrance now.", "");
            }
            else
            {
                add_page("That makes " + string(SalvQuota) + "! You can head back to the entrance now.", "");
            }
            
            break;
        
        case "Salvage_Yes_Special":
            global.SalvageQuota += 1;
            var SalvQuota = global.SalvageQuota;
            var SalvAmount = array_length(global.SalvagesCurrent) + 1;
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxTallyTotal, 30, false, 1, 0, 0.8);
                array_push(global.SalvagesCurrent, other.SalvageID);
                array_push(global.AllTimeSalvages, other.SalvageID);
                global.SalvageRecord[other.SalvageID]++;
                var Earnings = oSalvageSheet.SalvageStats[other.SalvageID][3] * 0.01;
                global.RunEarnings += Earnings;
                global.RunEarningsTotal += Earnings;
                global.SalvagedScraps[global.Night - 1] = true;
                
                with (oCamera3DMaze.LockOnTarget)
                    Text = "Destroy";
                
                with (oSalvageSheet)
                    Delete = true;
                
                with (instance_create_depth(160, 360, 256, oSalvageSheet))
                {
                    ID = other.SalvageID;
                    PageMode = 1;
                }
                
                if (ultimate_route_unlocked())
                {
                    with (oInteraction_Disappearing)
                        CanAppear = true;
                }
            };
            
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oSalvageSheet)
                    Delete = true;
            };
            
            add_page("Animatronic salvaged! ...Hopefully you won't come to regret this.", "");
            
            if (SalvAmount < SalvQuota)
                add_page(string(SalvQuota - SalvAmount) + " more until your quota is met.", "");
            else
                add_page("You can head back to the entrance now.", "");
            
            break;
        
        case "Salvage_No":
            Function[TextPageNumber] = function()
            {
                with (oSalvageSheet)
                    Delete = true;
            };
            
            add_page("Probably best to peruse your other options first.", "");
            break;
        
        case "PsychicFriendFredbear_Intro":
            Delay[TextPageNumber] = 60;
            add_page(global.UnlockedAnimatronics[UnknownEnum.Value_56] ? "Well well well, look who's back!" : "Well gosh, look who it is! I was wondering when you'd show up!", "???");
            var Height = floor(clamp(get_guard_property("player_height", 48), 16, 80) / 20);
            var Message = "";
            
            switch (Height)
            {
                case 0:
                    Message = "...Ahem. Uh, up here.";
                    break;
                
                case 1:
                    Message = "...Ahem. Over here.";
                    break;
                
                case 2:
                    Message = "...Ahem. Down here.";
                    break;
                
                default:
                    Message = "...Ahem. Uh, down here, big guy.";
                    break;
            }
            
            add_page(Message, "???");
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze)
                {
                    var NearestPoint = instance_nearest(x, y, oInteraction_Animatronic);
                    LockOnTarget = NearestPoint;
                    LockX = NearestPoint.x;
                    LockY = NearestPoint.y;
                    LockZ = NearestPoint.Height;
                }
            };
            
            add_page("Welcome! You're the new hire, aren't you?", "???");
            add_page("You can call me your Psychic Friend Fredbear! I'm here to help you on your salvaging duties.", "Psychic Friend Fredbear");
            add_page("...Oh, you seem a little confused! Don't worry, I'll explain.", "Psychic Friend Fredbear");
            add_page("Y'see, the company's been a tad shorthanded lately. Because of that, some employees have had to double up on duties!", "Psychic Friend Fredbear");
            add_page("And thanks to that, you not only have the honor of being our one and only security guard, but our one and only salvager as well!", "Psychic Friend Fredbear");
            add_page("Doesn't that make you feel special?", "Psychic Friend Fredbear");
            
            if (global.SalvageQuota == 1)
                add_page("Your job here's real simple - Investigate these abandoned locations, find an animatronic, and bring it back with you for spare parts!", "Psychic Friend Fredbear");
            else
                add_page("Your job here's real simple - Investigate these abandoned locations, find " + string(global.SalvageQuota) + " animatronics, and bring 'em back with you for spare parts!", "Psychic Friend Fredbear");
            
            add_page("Be on the lookout for trinkets and papers left behind by old employees, too - you might learn a thing or two from them!", "Psychic Friend Fredbear");
            add_page("Oh, and don't worry, the animatronics here should all be friendly. Just try talking to them - they'd love a new place to stay!", "Psychic Friend Fredbear");
            add_page("...Once they're back at your location and learn what we're planning on using them for though, I'm not sure.", "Psychic Friend Fredbear");
            add_page("EITHER WAY, you might as well get to it! Feel free to come back here and talk to me once you're ready to leave.", "Psychic Friend Fredbear");
            add_page("Good luck!", "Psychic Friend Fredbear");
            replace_text(arg0, "PsychicFriendFredbear_Leave");
            break;
        
        case "PsychicFriendFredbear_2":
            Delay[TextPageNumber] = 60;
            add_page("Ah, there you are!", "Psychic Friend Fredbear");
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze)
                {
                    var NearestPoint = instance_nearest(x, y, oInteraction_Animatronic);
                    LockOnTarget = NearestPoint;
                    LockX = NearestPoint.x;
                    LockY = NearestPoint.y;
                    LockZ = NearestPoint.Height;
                }
            };
            
            add_page("Glad to see you found your way here!", "Psychic Friend Fredbear");
            add_page("Have you been paying attention to the salvage values of the animatronics? You get a 1% commission on whatever they're worth!", "Psychic Friend Fredbear");
            add_page("Isn't the company generous?", "Psychic Friend Fredbear");
            add_page("More expensive animatronics might be harder to deal with...but hey, I'm sure they're worth the price!", "Psychic Friend Fredbear");
            add_page("Other than that, same rigmarole as last night! Talk to me when you're done. Now get salvaging!", "Psychic Friend Fredbear");
            replace_text("PsychicFriendFredbear_Intro", "PsychicFriendFredbear_Leave");
            break;
        
        case "PsychicFriendFredbear_3":
            Delay[TextPageNumber] = 60;
            add_page("Ah, there you are!", "Psychic Friend Fredbear");
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze)
                {
                    var NearestPoint = instance_nearest(x, y, oInteraction_Animatronic);
                    LockOnTarget = NearestPoint;
                    LockX = NearestPoint.x;
                    LockY = NearestPoint.y;
                    LockZ = NearestPoint.Height;
                }
            };
            
            add_page("Glad to see you found your way here again!", "Psychic Friend Fredbear");
            add_page("You know how to crawl through vents, right? You'll probably need to do a lot of that here.", "Psychic Friend Fredbear");
            add_page("That aside...have fun salvaging!", "Psychic Friend Fredbear");
            replace_text("PsychicFriendFredbear_Intro", "PsychicFriendFredbear_Leave");
            break;
        
        case "PsychicFriendFredbear_4":
            Delay[TextPageNumber] = 60;
            var UltimateRoute = has_been_ultimate() && currently_ultimate();
            add_page(UltimateRoute ? "Ah, took you long enough!" : "Ah, there you are!", "Psychic Friend Fredbear");
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze)
                {
                    var NearestPoint = instance_nearest(x, y, oInteraction_Animatronic);
                    LockOnTarget = NearestPoint;
                    LockX = NearestPoint.x;
                    LockY = NearestPoint.y;
                    LockZ = NearestPoint.Height;
                }
            };
            
            add_page("Glad to see you found your way here again!", "Psychic Friend Fredbear");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...Uh...do I have the right place? This just looks like someone's house.", "Jeremy");
                    break;
                
                case 1:
                    add_page("The boss wanted me to salvage animatronics in...some guy's house?", "Mike");
                    break;
                
                case 2:
                    add_page("...Surely this can't be the place, right?", "Vanessa");
                    break;
                
                case 3:
                    add_page("The woods...Not what I was expecting, though I suppose this IS a likely place to find bears and rabbits.", "Fritz");
                    add_page("...Do I need to bring a live bear back?", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "psy_friend_fredbear_house", [["...Huh? What is this place? Why did your boss send you here?", "Psychic Friend Fredbear"]]);
                    break;
            }
            
            add_page("Hey, I don't know any better than you! I'm sure you'll find what you're looking for if you search hard enough.", "Psychic Friend Fredbear");
            add_page("Either way...good luck!", "Psychic Friend Fredbear");
            
            if (UltimateRoute)
                add_page("...And don't bite off more than you can chew.", "Psychic Friend Fredbear");
            
            replace_text("PsychicFriendFredbear_Intro", "PsychicFriendFredbear_Leave");
            break;
        
        case "PsychicFriendFredbear_5":
            Delay[TextPageNumber] = 60;
            add_page("Ah, there you are!", "Psychic Friend Fredbear");
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze)
                {
                    var NearestPoint = instance_nearest(x, y, oInteraction_Animatronic);
                    LockOnTarget = NearestPoint;
                    LockX = NearestPoint.x;
                    LockY = NearestPoint.y;
                    LockZ = NearestPoint.Height;
                }
            };
            
            add_page("...Hey, wait a second! You aren't supposed to be in here! How did you get in here!?", "Psychic Friend Fredbear");
            add_page("...Oh well, I guess I can't really stop you, can I?", "Psychic Friend Fredbear");
            add_page("Word to the wise - the animatronics here are MEAN. You're probably gonna have a rough time tomorrow night no matter who you salvage.", "Psychic Friend Fredbear");
            add_page("...But hey, you've made it this far, right? I'm sure it's nothing you can't handle.", "Psychic Friend Fredbear");
            add_page("Now, you better not linger too long! You still aren't supposed to be here, you know!", "Psychic Friend Fredbear");
            replace_text("PsychicFriendFredbear_Intro", "PsychicFriendFredbear_Leave");
            break;
        
        case "PsychicFriendFredbear_Leave":
            if (global.HasGift)
            {
                add_page("...Oh? Is that a gift box? For me?", "Psychic Friend Fredbear");
                add_page("Well, I appreciate the gesture...but I can't exactly open it! I'm just a plushie, after all.", "Psychic Friend Fredbear");
                add_page("Although... Say, try taking that to Upgrade Cadet, he might be willing to give you something in exchange for it.", "Psychic Friend Fredbear");
                break;
            }
            
            if (array_length(global.SalvagesCurrent) == (global.SalvageQuota - 1) && (array_contains(global.SalvagesCurrent, UnknownEnum.Value_20) || array_contains(global.SalvagesCurrent, UnknownEnum.Value_33) || array_contains(global.SalvagesCurrent, UnknownEnum.Value_34) || array_contains(global.SalvagesCurrent, UnknownEnum.Value_35)))
            {
                add_page("Hey, where do you think YOU'RE going, silly? You...", "Psychic Friend Fredbear");
                add_page("...Huh? Well, it DOES appear you've met the quota, but...", "Psychic Friend Fredbear");
                add_page("One of the animatronics you're carrying looks far too raggedy to be of any use to us! Sorry, but you'll need to find one more.", "Psychic Friend Fredbear");
                break;
            }
            
            if (array_length(global.SalvagesCurrent) < global.SalvageQuota)
            {
                var SalvAmount = global.SalvageQuota - array_length(global.SalvagesCurrent);
                add_page(string("Hey, where do you think YOU'RE going, silly? You're still {0} animatronic{1} short!", SalvAmount, (SalvAmount == 1) ? "" : "s"), "Psychic Friend Fredbear");
                add_page("No leaving until the salvage quota's met. Company policy!", "Psychic Friend Fredbear");
                break;
            }
            
            add_page("Hey, where do you - Oh! I see you've met the quota!", "Psychic Friend Fredbear");
            add_page("Great work, buddy! Do you wanna head on home now?", "Psychic Friend Fredbear");
            add_option("Leave", "PsychicFriendFredbear_Quit");
            add_option("Stay", "PsychicFriendFredbear_Stay");
            replace_text(arg0, "PsychicFriendFredbear_LeaveAlt");
            break;
        
        case "PsychicFriendFredbear_LeaveAlt":
            add_page("Do you wanna head home now?", "Psychic Friend Fredbear");
            add_option("Leave", "PsychicFriendFredbear_Quit");
            add_option("Stay", "Default");
            break;
        
        case "PsychicFriendFredbear_Stay":
            add_page("Uh...alright, if you say so! Maybe you'll find something if you look around longer?", "Psychic Friend Fredbear");
            break;
        
        case "PsychicFriendFredbear_Quit":
            Delay[TextPageNumber] = 600;
            
            Function[TextPageNumber] = function()
            {
                audio_stop_all();
                instance_destroy(oPauser);
                
                with (instance_create_depth(0, 0, 1000, oTransitionMinigame))
                    Destination = SalvageResults;
                
                global.DiedToEndo = false;
            };
            
            add_page(" ", "");
            break;
        
        case "Escape":
            Delay[TextPageNumber] = 600;
            
            Function[TextPageNumber] = function()
            {
                global.SalvagedMasks[global.Night - 1] = 1;
                audio_stop_all();
                instance_destroy(oPauser);
                global.DiedToEndo = false;
                global.UnlockedAnimatronics[UnknownEnum.Value_59] = true;
                
                with (instance_create_depth(0, 0, 1000, oTransitionMinigame))
                    Destination = SalvageResults;
                
                instance_destroy(oMazeEnemy);
            };
            
            add_page(" ", "");
            break;
        
        case "Shop_Intro":
            replace_text(arg0, "Shop");
            play_selection_voiceline(UnknownEnum.Value_58);
            add_page("I AM THE UPGRADE CADET. I HAVE UPGRADES ALL DAY, EVERYDAY. UPGRADES. UPGRADES. UPGRADES.", "Upgrade Cadet");
            add_page("...I DO NOT RECOGNIZE YOU. YOU MUST BE A NEW PATRON.", "Upgrade Cadet");
            add_page("WOULD YOU LIKE ME TO EXPLAIN MY SERVICES?", "Upgrade Cadet");
            add_option("Yes", "Shop_Explain");
            add_option("No", "Shop_Continue");
            break;
        
        case "Shop_Explain":
            add_page("VERY WELL. AHEM...", "Upgrade Cadet");
            add_page("I AM UPGRADE CADET. I PROVIDE VARIOUS GOODS AND SERVICES, WHICH YOU CAN PURCHASE WITH MONEY.", "Upgrade Cadet");
            add_page("YOU MAY PURCHASE UPGRADES FROM ME, WHICH SHOULD MAKE YOUR JOB SIGNIFICANTLY EASIER.", "Upgrade Cadet");
            add_page("THESE UPGRADES WILL PERSIST UNTIL THE END OF YOUR WORK WEEK, BUT COME AT A PRICE.", "Upgrade Cadet");
            add_page("...THAT PRICE BEING MONEY.", "Upgrade Cadet");
            add_page("YOU CAN EARN MONEY FROM SALVAGES, AS WELL AS BONUSES FOR SAVING POWER OR TOKENS DURING A NIGHT.", "Upgrade Cadet");
            add_page("NOW...WOULD YOU LIKE TO BUY SOMETHING?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_Continue":
            add_page("UNDERSTOOD. LESS WORK FOR ME, THEN.", "Upgrade Cadet");
            add_page("NOW...WOULD YOU LIKE TO BUY SOMETHING?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop":
            play_selection_voiceline(UnknownEnum.Value_58);
            add_page("I AM THE UPGRADE CADET. I HAVE UPGRADES ALL DAY, EVERYDAY.", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_Gift":
            add_page("OH, A GIFT BOX?", "Upgrade Cadet");
            add_page("HMM, WELL, I SUPPOSE WHATEVER'S INSIDE MAY MAKE FOR A WORTHWHILE ADDITION TO MY INVENTORY...", "Upgrade Cadet");
            add_page("...TELL YOU WHAT. I WILL GIVE YOU $5.00 IN EXCHANGE FOR IT. DO WE HAVE A DEAL?", "Upgrade Cadet");
            add_option("Yes", "Shop_GiftAccept");
            add_option("No", "Shop_GiftRefuse");
            break;
        
        case "Shop_GiftAccept":
            global.HasGift = false;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxRegister, 5, false);
                global.RunEarnings += 5;
                global.RunEarningsTotal += 5;
                global.HasGift = false;
            };
            
            add_page("PLEASURE DOING BUSINESS WITH YOU.", "Upgrade Cadet");
            add_page("NOW...WOULD YOU LIKE TO BUY SOMETHING?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_GiftRefuse":
            if (global.Night == 5)
            {
                add_page("SAVING IT FOR A SPECIAL OCCASION? I UNDERSTAND.", "Upgrade Cadet");
                add_page("...EVEN IF THERE'S NOBODY ELSE YOU CAN GIVE IT TO HERE.", "Upgrade Cadet");
            }
            else
            {
                add_page("SAVING IT FOR A SPECIAL OCCASION? I UNDERSTAND. I AM SURE THERE IS SOMEONE HERE WHO WANTS IT MORE.", "Upgrade Cadet");
            }
            
            add_page("NOW... WOULD YOU LIKE TO BUY SOMETHING?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_Upgrades":
            Delay[TextPageNumber] = 5;
            Skip[TextPageNumber] = true;
            
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, 0, oShopMenu);
                ExternalPause = true;
            };
            
            add_page("", "Upgrade Cadet");
            Hide[TextPageNumber - 1] = true;
            add_page("ANYTHING ELSE?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_Story":
            if (array_contains(global.UnlockFlags, "CCStory_Ultimate"))
            {
                add_page("WHICH STORY WOULD YOU LIKE TO HEAR?", "Upgrade Cadet");
                add_option("The Beans", "Shop_StoryTell_Money");
                add_option("The Jester", "Shop_StoryTell_Evil");
                add_option("The Maid", "Shop_StoryTell_Good");
                add_option("The Boy", "Shop_StoryTell_Ultimate");
                add_option("Nevermind", "Shop_Continue");
            }
            else if (oInteraction_Shop.HeardStory)
            {
                add_page("I'M AFRAID I ONLY HAD ONE STORY PREPARED...PERHAPS I WILL TELL ANOTHER IF YOU COME BACK ANOTHER NIGHT.", "Upgrade Cadet");
                add_page("ANYTHING ELSE?", "Upgrade Cadet");
                upgrade_shop();
            }
            else if (global.RunEarnings >= 2.5)
            {
                add_page("A STORY WILL COST YOU $2.50. WOULD YOU LIKE ME TO TELL YOU ONE?", "Upgrade Cadet");
                add_option("Yes", "Shop_StoryTell");
                add_option("No", "Shop_Continue");
            }
            else
            {
                add_page("A STORY WILL COST YOU $2.50.", "Upgrade Cadet");
                add_page("...YOU CANNOT AFFORD THAT.", "Upgrade Cadet");
                add_page("ANYTHING ELSE?", "Upgrade Cadet");
                upgrade_shop();
            }
            
            break;
        
        case "Shop_StoryTell":
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxRegister, 5, false);
                global.RunEarnings -= 2.5;
                audio_sound_gain(global.Music, 0, 1000);
                oInteraction_Shop.HeardStory = true;
                global.UnlockedAnimatronics[UnknownEnum.Value_58] = true;
            };
            
            var Story = irandom(2);
            
            if (array_contains(global.UnlockFlags, "CCStory_Money") && array_contains(global.UnlockFlags, "CCStory_Evil") && array_contains(global.UnlockFlags, "CCStory_Good"))
            {
                Story = 3;
            }
            else
            {
                while ((array_contains(global.UnlockFlags, "CCStory_Money") && Story == 0) || (array_contains(global.UnlockFlags, "CCStory_Evil") && Story == 1) || (array_contains(global.UnlockFlags, "CCStory_Good") && Story == 2))
                    Story = irandom(2);
            }
        
        case "Shop_StoryTell_Money":
        case "Shop_StoryTell_Evil":
        case "Shop_StoryTell_Good":
        case "Shop_StoryTell_Ultimate":
            if (arg0 == "Shop_StoryTell_Money")
            {
                Story = 0;
                
                Function[TextPageNumber] = function()
                {
                    audio_sound_gain(global.Music, 0, 1000);
                };
            }
            
            if (arg0 == "Shop_StoryTell_Evil")
            {
                Story = 1;
                
                Function[TextPageNumber] = function()
                {
                    audio_sound_gain(global.Music, 0, 1000);
                };
            }
            
            if (arg0 == "Shop_StoryTell_Good")
            {
                Story = 2;
                
                Function[TextPageNumber] = function()
                {
                    audio_sound_gain(global.Music, 0, 1000);
                };
            }
            
            if (arg0 == "Shop_StoryTell_Ultimate")
            {
                Story = 3;
                
                Function[TextPageNumber] = function()
                {
                    audio_sound_gain(global.Music, 0, 1000);
                };
            }
            
            add_page("VERY WELL. AHEM...", "Upgrade Cadet");
            
            Function[TextPageNumber] = function()
            {
                play_music(mus_CandyCadetStory);
            };
            
            switch (Story)
            {
                case 0:
                    add_page("TODAY, I WILL TELL YOU THE STORY OF A YOUNG BOY NAMED JACK.", "Upgrade Cadet");
                    add_page("THE BOY GREW UP POOR ON A FARM, LIVING ONLY WITH HIS MOTHER.", "Upgrade Cadet");
                    add_page("THE TWO HAD RUN DRY THE LITTLE SAVINGS THEY HAD, SO DESPERATELY, JACK'S MOTHER ASKED HIM TO SELL THEIR ONLY COW.", "Upgrade Cadet");
                    add_page("JACK TOOK THE COW TO THE MARKET, WHERE HE MET A STRANGE MAN.", "Upgrade Cadet");
                    add_page("IN EXCHANGE FOR THE COW, THE MAN OFFERED JACK A HANDFUL OF BEANS. JACK ACCEPTED.", "Upgrade Cadet");
                    add_page("ONCE HE RETURNED HOME, HIS MOTHER WAS FURIOUS, THROWING THE BEANS OUT OF THE WINDOW.", "Upgrade Cadet");
                    add_page("HOWEVER, LITTLE DID SHE KNOW, THE USELESS BEANS WERE MUCH MORE VALUABLE THAN ANY MONEY COULD HAVE POSSIBLY BEEN.", "Upgrade Cadet");
                    add_page("SOON, A GIANT BEANSTALK GREW FROM THE MAGIC BEANS, ONE WHICH JACK CLIMBED TO REACH A KINGDOM IN THE SKY.", "Upgrade Cadet");
                    Skip[TextPageNumber] = true;
                    add_page("IN THE KINGDOM LIVED A GIANT AND HIS WIFE. JACK ASKED", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        audio_stop_sound(mus_CandyCadetStory);
                    };
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Uh...I don't mean to interrupt or anything, but...", "Jeremy");
                            add_page("...This is just Jack and the Beanstalk.", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("This is just Jack and the Beanstalk. You're telling me Jack and the Beanstalk.", "Mike");
                            break;
                        
                        case 2:
                            add_page("Isn't this just Jack and the Beanstalk?", "Vanessa");
                            break;
                        
                        case 3:
                            add_page("When does the death and destruction begin? I'm falling asleep over here...", "Fritz");
                            break;
                        
                        default:
                            read_custom_dialogue("properties.txt", "upgrade_cadet_story", [["You interrupt Upgrade Cadet to tell him you've heard this story before.", ""], ["YOU ASKED FOR A STORY. I AM TELLING YOU A STORY. I DO NOT SEE THE ISSUE.", "Upgrade Cadet"], ["...WHAT? CONTINUE?", "Upgrade Cadet"]]);
                            break;
                    }
                    
                    add_page("YOU ASKED FOR A STORY. I AM TELLING YOU A STORY. I DO NOT SEE THE ISSUE.", "Upgrade Cadet");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Well, I just thought it'd be something more...I dunno, original?", "Jeremy");
                            add_page("IT IS A GOOD STORY. ANY ALTERATIONS WOULD DISTRACT FROM ITS MESSAGE.", "Upgrade Cadet");
                            add_page("Alright, sorry sorry, continue with the story.", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("I paid two bucks and fifty cents for this, dude. The least you could do is tell an original story.", "Mike");
                            add_page("IT IS A GOOD STORY. ANY ALTERATIONS WOULD DISTRACT FROM ITS MESSAGE.", "Upgrade Cadet");
                            add_page("Fine, whatever, keep going then.", "Mike");
                            break;
                        
                        case 2:
                            Skip[TextPageNumber] = true;
                            add_page("Well I dunno, I guess I was just expecting", "Vanessa");
                            add_page("IT IS A GOOD STORY. ANY ALTERATIONS WOULD DISTRACT FROM ITS MESSAGE.", "Upgrade Cadet");
                            add_page("...Y'know what, never mind, just continue.", "Vanessa");
                            break;
                        
                        case 3:
                            add_page("I know how these stories go, the kid dies. Go on, just skip to that part.", "Fritz");
                            break;
                    }
                    
                    add_page("NO. YOU HAVE COMPLETELY THROWN OFF MY FLOW. I CANNOT STORYTELL IN THIS CONDITION.", "Upgrade Cadet");
                    add_page("STORIES ARE MORE THE STRONG SUIT OF MY CANDY-DISPENSING BRETHREN ANYWAY...", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        audio_sound_gain(global.Music, 0.5, 1000);
                        array_push(global.UnlockFlags, "CCStory_Money");
                    };
                    
                    break;
                
                case 1:
                    add_page("TODAY, I WILL TELL YOU THE STORY OF THE FOOLISH JESTER AND THE TYRANT KING.", "Upgrade Cadet");
                    add_page("THERE ONCE LIVED A JESTER, EVER-LOYAL TO HIS RUTHLESS KING.", "Upgrade Cadet");
                    add_page("ONE DAY, THE KING ORDERED THE JESTER TO TRAVEL THE LAND AND FIND FOUR BRAVE WARRIORS.", "Upgrade Cadet");
                    add_page("HE ONLY WANTED THE BEST, ONLY THE STRONGEST, MOST COURAGEOUS, DAUNTLESS WARRIORS FOR HIS ROYAL GUARD.", "Upgrade Cadet");
                    add_page("KNOWING THE KING WOULD HAVE HIS HEAD IF HE REFUSED, THE JESTER OBLIGED.", "Upgrade Cadet");
                    add_page("ONE BY ONE, HE FOUND THE BEST WARRIORS ACROSS THE LAND. THEY WOULD NOT JOIN HIS SIDE EASILY, HOWEVER.", "Upgrade Cadet");
                    add_page("EACH DEMANDED THE JESTER PROVE HIS DEDICATION THROUGH INCREASINGLY PERILOUS TRIALS...", "Upgrade Cadet");
                    add_page("...YET DESPITE THE HARDSHIPS, THE JESTER FOLLOWED THROUGH, EACH AND EVERY TIME.", "Upgrade Cadet");
                    add_page("THE JESTER RETURNED TO THE KING WITH THE FOUR WARRIORS IN TOW, PRESENTING THEM BEFORE THE KING.", "Upgrade Cadet");
                    add_page("THE KING WAS IMPRESSED...BUT NOT YET CONVINCED.", "Upgrade Cadet");
                    add_page("TO PROVE THEIR MIGHT, THE KING ORDERED THE FOUR WARRIORS TO SLAY THE JESTER.", "Upgrade Cadet");
                    add_page("THEY OBLIGED.", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        audio_stop_sound(mus_CandyCadetStory);
                        audio_sound_gain(global.Music, 0.5, 1000);
                        array_push(global.UnlockFlags, "CCStory_Evil");
                    };
                    
                    add_page("...THE END.", "Upgrade Cadet");
                    add_page("I HOPE YOU FOUND THIS STORY ENTERTAINING.", "Upgrade Cadet");
                    break;
                
                case 2:
                    add_page("TODAY, I WILL TELL YOU THE STORY OF THE OLD MAID AND THE SICKLY BOY.", "Upgrade Cadet");
                    add_page("ONCE, THERE WAS A MAID WHO TENDED TO THE MANOR OF A VERY WEALTHY COUPLE.", "Upgrade Cadet");
                    add_page("EVERY DAY, SHE WOULD SWEEP THROUGH THE HOUSE...ALL OF IT, WITH THE EXCEPTION OF ONE ROOM.", "Upgrade Cadet");
                    add_page("THE COUPLE TOLD HER SHE WAS NEVER TO OPEN THE DOOR TO THE GUEST BEDROOM, NOT UNDER ANY CIRCUMSTANCE.", "Upgrade Cadet");
                    add_page("NOT WANTING TO LOSE HER JOB, SHE OBLIGED...UNTIL ONE DAY.", "Upgrade Cadet");
                    add_page("ONE DAY, TENDING TO THE HOUSE AS SHE ALWAYS HAD BEEN, DRIFTING PAST THE DOOR TO THE ROOM...SHE HEARD CRYING.", "Upgrade Cadet");
                    add_page("SHE COULDN'T HELP HER CURIOSITY. SHE OPENED THE DOOR, AND INSIDE...", "Upgrade Cadet");
                    add_page("...WAS A SICKLY BOY. THE COUPLE'S SON.", "Upgrade Cadet");
                    add_page("HE WAS HAPPY TO HAVE COMPANY AGAIN. HE RARELY SAW HIS PARENTS...THEY SEEMED ASHAMED OF HIM.", "Upgrade Cadet");
                    add_page("THE MAID, HOWEVER, HAD FAR MORE SYMPATHY FOR THE BOY.", "Upgrade Cadet");
                    add_page("WANTING TO HELP HIM FEEL BETTER, SHE ASKED IF THERE WAS ANYTHING SHE COULD DO.", "Upgrade Cadet");
                    add_page("THE BOY ASKED HER TO BRING HIM HIS TOYS FROM AROUND THE HOUSE, SO HE COULD HAVE SOMETHING TO PLAY WITH.", "Upgrade Cadet");
                    add_page("SHE ACCEPTED HIS REQUEST.", "Upgrade Cadet");
                    add_page("SHE SWEPT THROUGH THE HOUSE YET AGAIN, THROUGH EVERY NOOK AND CRANNY, PICKING UP FOUR DUSTY TOYS ALONG THE WAY.", "Upgrade Cadet");
                    add_page("MAKING HER WAY BACK TO THE BOY'S ROOM, SHE CREAKED OPEN HIS DOOR...", "Upgrade Cadet");
                    add_page("...ONLY TO FIND HE HAD PASSED WHILE SHE WAS AWAY.", "Upgrade Cadet");
                    add_page("AND YET...THE BOY HAD A SMILE ON HIS FACE. IT SEEMS ALL IT TOOK TO MAKE HIM HAPPY AGAIN WAS HER COMPANY.", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        audio_stop_sound(mus_CandyCadetStory);
                        audio_sound_gain(global.Music, 0.5, 1000);
                        array_push(global.UnlockFlags, "CCStory_Good");
                    };
                    
                    add_page("...THE END.", "Upgrade Cadet");
                    add_page("I HOPE YOU FOUND THIS STORY ENTERTAINING.", "Upgrade Cadet");
                    break;
                
                case 3:
                    add_page("TODAY, I WILL TELL YOU THE STORY OF THE BOY.", "Upgrade Cadet");
                    add_page("THERE ONCE LIVED A BOY, A VERY ORDINARY BOY. NOT TOO SHORT, NOT TOO TALL. NOT TOO SMART, NOT TOO DULL.", "Upgrade Cadet");
                    add_page("AND YET, ONE DAY...HE FOUND HIMSELF FULL OF AMBITION.", "Upgrade Cadet");
                    add_page("HE TOLD HIS MOTHER RIGHT THEN AND THERE THAT HE WOULD BECOME A POLICE OFFICER, AND A FIREMAN, AND AN ASTRONAUT.", "Upgrade Cadet");
                    add_page("OF COURSE, HIS MOTHER KNEW THIS WAS SILLY. NOBODY CAN BE EVERYTHING ALL AT ONCE.", "Upgrade Cadet");
                    add_page("...BUT THE BOY WOULD NOT HEAR IT.", "Upgrade Cadet");
                    add_page("ONE DAY, HE LEFT HOME TO PURSUE HIS DREAMS...AND IN HIS FOOLISHNESS, HE SOON FOUND HIMSELF...", "Upgrade Cadet");
                    add_page("...", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        audio_stop_sound(mus_CandyCadetStory);
                        audio_sound_gain(global.Music, 0.5, 1000);
                        array_push(global.UnlockFlags, "CCStory_Ultimate");
                    };
                    
                    add_page("...HMMM.", "Upgrade Cadet");
                    add_page("IT'S...STRANGE. I DO NOT SEEM TO ACTUALLY RECALL HOW THIS STORY ENDS.", "Upgrade Cadet");
                    add_page("OH WELL. I SUPPOSE IT'S UP TO YOU TO WRITE YOUR OWN ENDING NOW.", "Upgrade Cadet");
                    
                    Function[TextPageNumber] = function()
                    {
                        get_trophy(UnknownEnum.Value_27);
                    };
                    
                    add_page("...AH. IT SEEMS I HAVE NOW TOLD YOU EVERY STORY I KNOW.", "Upgrade Cadet");
                    add_page("I KNOW STORIES ARE NOT MY STRONG SUIT...BUT I THANK YOU FOR LISTENING ALL THE SAME.", "Upgrade Cadet");
                    add_page("IF YOU WOULD LIKE ME TO TELL YOU ONE OF THESE STORIES AGAIN, FEEL FREE TO ASK. I SHALL DO SO FREE OF CHARGE.", "Upgrade Cadet");
                    break;
            }
            
            add_page("ANYTHING ELSE?", "Upgrade Cadet");
            upgrade_shop();
            break;
        
        case "Shop_Quit":
            add_page("COME AGAIN.", "Upgrade Cadet");
            break;
        
        case "Marionette":
            if (oMarionetteProp.Holding == 2)
            {
                add_page("Take the mask?", "");
                add_option("Yes", "TakeMask");
                add_option("No", "Marionette_No");
                break;
            }
            else
            {
                if (!oMarionetteProp.Checked)
                {
                    Function[TextPageNumber] = function()
                    {
                        oMarionetteProp.Checked = true;
                    };
                    
                    add_page("It seems to be a Marionette... Wait, was this thing always here?", "");
                    add_page("Its hands are empty. It almost seems like it's expecting you to put something between them...", "");
                    
                    if (!global.HasGift)
                        break;
                    
                    if (!CanTakeMask)
                    {
                        add_page("You could give it that gift box you found...", "");
                        add_page("...Though you're already taking back that old model off the record, so this might be pushing it. Better leave it be...for now.", "");
                        break;
                    }
                    
                    add_page("...Give it the gift box?", "");
                }
                else
                {
                    if (!global.HasGift)
                    {
                        add_page("Doesn't seem like you have anything to give it.", "");
                        break;
                    }
                    
                    if (!CanTakeMask)
                    {
                        add_page("You consider giving the Marionette that gift box you found...", "");
                        add_page("...Though you're already taking back that old model off the record, so this might be pushing it. Better leave it be...for now.", "");
                        break;
                    }
                    
                    add_page("Give it the gift box?", "");
                }
                
                add_option("Yes", "Marionette_Yes");
                add_option("No", "Marionette_No");
            }
            
            break;
        
        case "Marionette_Yes":
            Function[TextPageNumber] = function()
            {
                global.HasGift = false;
                oMarionetteProp.Holding = 1;
            };
            
            add_page("The Marionette ascends into the ceiling...", "");
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                oMarionetteProp.Holding = 2;
            };
            
            add_page("...And returns with a mask.", "");
            add_page("Take the mask?", "");
            add_option("Yes", "TakeMask");
            add_option("No", "Marionette_No");
            break;
        
        case "TakeMask":
            if (CanTakeMask)
            {
                Function[TextPageNumber] = function()
                {
                    with (oInteractionPoint)
                    {
                        if (object_index != oMarionetteProp && Text != "Escape")
                            instance_destroy();
                    }
                    
                    with (oMarionetteProp)
                        Activated = true;
                    
                    with (oEnemySpawnPoint)
                    {
                        with (instance_create_depth(x, y, 0, oMazeEnemy))
                            PatrolID = other.PatrolID;
                    }
                    
                    with (oCamera3DMaze)
                    {
                        CurrentPalette = 14;
                        CurrentLoadZone = 99;
                    }
                    
                    audio_stop_sound(musMinigameA);
                    audio_stop_sound(musMinigameB);
                    audio_stop_sound(musMinigameC);
                    audio_stop_sound(musMinigameD);
                    audio_stop_sound(musMinigameE);
                    audio_play_sound(sfxAmbience, 10, true, 1);
                    audio_play_sound(sfxPowerDown, 10, false, 1);
                    
                    with (oMazeWall_Flat)
                    {
                        if (Sprite == sMazeDecor_Boards)
                            instance_destroy();
                    }
                };
                
                Delay[TextPageNumber] = 60;
                add_page("Get back to the exit...quietly.", "");
                replace_text("Marionette", "Marionette_Active");
            }
            else
            {
                add_page("You reach out to take the mask...", "");
                add_page("...But you remember you're already taking back that old model off the record, and fear this might be pushing it.", "");
                add_page("Maybe you could try after another couple weeks on the job...but not wanting get fired on your first day, you decide not to take the mask.", "");
            }
            
            break;
        
        case "Marionette_No":
            break;
        
        case "Marionette_Active":
            add_page("Do you have any idea what you're getting yourself into?", "");
            break;
        
        case "Endo_Death":
            Delay[TextPageNumber] = 180;
            add_page("...You wake up outside.", "");
            add_page("You still have the mask...but it seems your pockets are five dollars lighter.", "");
            add_page("Better luck next time!", "");
            Delay[TextPageNumber] = 600;
            
            Function[TextPageNumber] = function()
            {
                global.SalvagedMasks[global.Night - 1] = 1;
                audio_stop_all();
                instance_destroy(oPauser);
                global.DiedToEndo = true;
                
                with (instance_create_depth(0, 0, 1000, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            add_page(" ", "");
            break;
        
        case "BB_Normal":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_14);
            };
            
            add_page("Hi! Hello! Hahaha!", "BB");
            add_page("...Seems like someone bolted him to the floor. Guess you won't be salvaging this one.", "");
            break;
        
        case "BB_Quiz":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_14);
            };
            
            add_page("Hi! Hello! Hahaha!", "BB");
            add_page("...Huh? You're looking for a key?", "BB");
            add_page("Haha! Well, you're in luck, because I've got one right here!", "BB");
            add_page("...Huh? GIVE it to you? C'mon, where's the fun in that?", "BB");
            add_page("Hmmm...tell ya what, I'll give this key to you...", "BB");
            add_page("...If you pass my quiz! Whaddaya say?", "BB");
            replace_text(arg0, "BB_Quiz_Short");
            add_option("Yes", "BB_Quiz_1");
            add_option("No", "BB_Quiz_No");
            break;
        
        case "BB_Quiz_Short":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_14);
            };
            
            add_page("Wanna retry the quiz?", "BB");
            add_option("Yes", "BB_Quiz_1");
            add_option("No", "BB_Quiz_No");
            break;
        
        case "BB_Quiz_Cleared":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_14);
            };
            
            add_page("Those were my best questions...I'd better think up some new ones for the next guy who comes through here.", "BB");
            break;
        
        case "BB_Quiz_No":
            add_page("Aww, you're no fun! No key for you, then...", "BB");
            break;
        
        case "BB_Quiz_Fail":
            add_page("...BZZZZT! WRONG!", "BB");
            add_page("Sorry buddy! Looks like you'll have to try again.", "BB");
            break;
        
        case "BB_Quiz_1":
            add_page("Alright, let's get this started!", "BB");
            add_page("QUESTION 1!", "BB");
            var Answers;
            
            switch (irandom_range(0, 2))
            {
                case 0:
                    add_page("How many salvagable animatronics are at this location?", "BB");
                    var NumOffset = array_contains(global.Upgrades, UnknownEnum.Value_8) ? 1 : (array_contains(global.Upgrades, UnknownEnum.Value_9) ? 2 : (array_contains(global.Upgrades, UnknownEnum.Value_10) ? 3 : 0));
                    Answers = array_shuffle([[string(5 + NumOffset), "BB_Quiz_Fail"], [string(6 + NumOffset), "BB_Quiz_Fail"], [string(7 + NumOffset), "BB_Quiz_2"], [string(8 + NumOffset), "BB_Quiz_Fail"]]);
                    break;
                
                case 1:
                    add_page("What does Toy Chica's bib say?", "BB");
                    Answers = array_shuffle([["Let's party!", "BB_Quiz_2"], ["Let's eat!", "BB_Quiz_Fail"], ["Let's rock!", "BB_Quiz_Fail"], ["Let's play!", "BB_Quiz_Fail"]]);
                    break;
                
                case 2:
                    add_page("What's your reason for working here?", "BB");
                    Answers = array_shuffle([["Pay for tuition", (global.Guard == 0) ? "BB_Quiz_2" : "BB_Quiz_Fail"], ["Bad resume", (global.Guard == 1) ? "BB_Quiz_2" : "BB_Quiz_Fail"], ["Work environment", (global.Guard == 2) ? "BB_Quiz_2" : "BB_Quiz_Fail"], ["I forgot", (global.Guard == 3) ? "BB_Quiz_2" : "BB_Quiz_Fail"]]);
                    
                    if (global.Guard >= 4)
                        Answers[irandom(3)] = [get_guard_property("bb_quiz_answer", "I was modded in"), "BB_Quiz_2"];
                    
                    break;
            }
            
            add_option(Answers[0][0], Answers[0][1]);
            add_option(Answers[1][0], Answers[1][1]);
            add_option(Answers[2][0], Answers[2][1]);
            add_option(Answers[3][0], Answers[3][1]);
            break;
        
        case "BB_Quiz_2":
            add_page("...CORRECT! Nice job!", "BB");
            add_page("ONTO QUESTION 2!", "BB");
            var Answers;
            
            switch (irandom_range(0, 2))
            {
                case 0:
                    add_page("What year did Fazbear Entertainment file for bankruptcy?", "BB");
                    Answers = array_shuffle([["2004", "BB_Quiz_3"], ["2023", "BB_Quiz_Fail"], ["1987", "BB_Quiz_Fail"], ["1993", "BB_Quiz_Fail"]]);
                    break;
                
                case 1:
                    add_page("How many tokens do you get for clearing Fredsweeper?", "BB");
                    Answers = array_shuffle([["30", "BB_Quiz_3"], ["15", "BB_Quiz_Fail"], ["10", "BB_Quiz_Fail"], ["20", "BB_Quiz_Fail"]]);
                    break;
                
                case 2:
                    add_page("Which of these animatronics is worth $1400?", "BB");
                    Answers = array_shuffle([["Withered Bonnie", "BB_Quiz_3"], ["Withered Freddy", "BB_Quiz_Fail"], ["Withered Chica", "BB_Quiz_Fail"], ["Endoskeleton", "BB_Quiz_Fail"]]);
                    break;
            }
            
            add_option(Answers[0][0], Answers[0][1]);
            add_option(Answers[1][0], Answers[1][1]);
            add_option(Answers[2][0], Answers[2][1]);
            add_option(Answers[3][0], Answers[3][1]);
            break;
        
        case "BB_Quiz_3":
            add_page("...CORRECT! I'm impressed!", "BB");
            add_page("FINAL QUESTION!", "BB");
            var Answers;
            
            switch (irandom_range(0, 2))
            {
                case 0:
                    add_page("If you earn 100 tokens and buy a Golden Cupcake, a Distortion Clock and two Snowcones, how much do you have left?", "BB");
                    Answers = array_shuffle([["30", "BB_Quiz_Win"], ["25", "BB_Quiz_Fail"], ["40", "BB_Quiz_Fail"], ["45", "BB_Quiz_Fail"]]);
                    break;
                
                case 1:
                    add_page("How many party tables are at this location, total?", "BB");
                    Answers = array_shuffle([["18", "BB_Quiz_Win"], ["19", "BB_Quiz_Fail"], ["20", "BB_Quiz_Fail"], ["17", "BB_Quiz_Fail"]]);
                    break;
                
                case 2:
                    add_page("What's Shadow Bonnie's legal name?", "BB");
                    Answers = array_shuffle([["RWQFSFASXC", "BB_Quiz_Win"], ["RXQFSFASXC", "BB_Quiz_Fail"], ["RWQFSFASWC", "BB_Quiz_Fail"], ["RWQFSAFSXC", "BB_Quiz_Fail"]]);
                    break;
            }
            
            add_option(Answers[0][0], Answers[0][1]);
            add_option(Answers[1][0], Answers[1][1]);
            add_option(Answers[2][0], Answers[2][1]);
            add_option(Answers[3][0], Answers[3][1]);
            break;
        
        case "BB_Quiz_Win":
            add_page("...CORRECT!", "BB");
            add_page("Alright alright, you beat me fair and square. Here's the key!", "BB");
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxBitCollect, 10, false);
            };
            
            add_page("You got the Parts & Service key.", "");
            replace_text("BB_Quiz_Short", "BB_Quiz_Cleared");
            replace_text("FT_LockedParts&ServiceDoor", "FT_LockedParts&ServiceDoor_Unlocked");
            break;
        
        case "Withered Freddy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_10);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_10);
                break;
            }
            
            add_page("You know me! I'm the bear who stares, scares, and is a little worse for wear, Freddy Fazbear™!", "Withered Freddy");
            add_page("Looking for a new friend to join you back at your pizzeria? Well, shoot - Freddy's ALWAYS up for making new friends!", "Withered Freddy");
            add_page("I'd love to keep you company there...Well, as long as you have enough pizza. Gyuh-huh!", "Withered Freddy");
            add_page("So whaddaya say? Wanna take me home?", "Withered Freddy");
            salvage_options(UnknownEnum.Value_10);
            break;
        
        case "Withered Bonnie":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_11);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_11);
                break;
            }
            
            add_page("¿Eh? ¿Quien está aquí? No puedo ver muy bien sin mi cara.", "Withered Bonnie");
            var Insult = "gordo";
            
            switch (global.Guard)
            {
                case 0:
                    Insult = "hombre-sin-cara desgraciado";
                    break;
                
                case 1:
                    Insult = "gordo baboso";
                    break;
                
                case 2:
                    Insult = "nina fea";
                    break;
                
                case 3:
                    Insult = "bastardo loco";
                    break;
                
                default:
                    Insult = get_guard_property("withered_bonnie", "gordo");
                    break;
            }
            
            add_page(string("¡Oye! ¡Hola! Te estoy hablando, {0}! ¿Puedes escucharme?", Insult), "Withered Bonnie");
            add_page("...Oh, solo hablas ingles? Lo siento, cambiaré mi configuración de idioma.", "Withered Bonnie");
            add_page("Ahem...my apologies.", "Withered Bonnie");
            add_page("Looking for animatronics to salvage? You should take me! I'm bilingual, I'm a rabbit, and my guitar skills are second to none!", "Withered Bonnie");
            add_page("...Well, they were before I lost my other arm, at least. But two for one ain't bad, eh?", "Withered Bonnie");
            salvage_options(UnknownEnum.Value_11);
            break;
        
        case "Withered Chica":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_12);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_12);
                break;
            }
            
            add_page("GRAAAAAUAAAAAAAAAAAUAUGHHHGHHH", "Withered Chica");
            add_page("H-H-HEL-H-H-HE-H-HEL-HE-HEL-H-H-H-HE-HEL", "Withered Chica");
            add_page("GFVNWGHIEIIRWQFSAFSXCGHSFJLGHDFSG", "Withered Chica");
            add_page("GRAAAAAUAAAAAAAAAAAUAUGHHHGHHH", "Withered Chica");
            salvage_options(UnknownEnum.Value_12);
            break;
        
        case "Withered Foxy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_13);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_13);
                break;
            }
            
            add_page("Yarr, ahoy there, ye scurvy sea dog! ", "Withered Foxy");
            add_page("I can tell by that look in yer eye - yer lookin' for a mate to sail the high seas with, aren'tcha?", "Withered Foxy");
            add_page("Well, assumin' you've got the booty, I'd love to join your crew!", "Withered Foxy");
            add_page("...And that's booty as in treasure, y'know. So don't get any ideas.", "Withered Foxy");
            add_page("So what do you say to me becomin' your first mate, matey? Is it a yay, or is it a nay?", "Withered Foxy");
            salvage_options(UnknownEnum.Value_13);
            break;
        
        case "Golden Freddy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_4);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_4);
                break;
            }
            
            add_page("...This one doesn't seem much for conversation.", "");
            add_page("In fact, it doesn't seem like it's functional at all...", "");
            salvage_options(UnknownEnum.Value_4);
            break;
        
        case "Endoskeleton":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_5);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_5);
                break;
            }
            
            add_page("DIALOGUE ERROR: NO ANIMATRONIC IDENTITY SET.", "Endoskeleton");
            add_page("PLEASE ASSIGN VALUE AND TRY AGAIN.", "Endoskeleton");
            salvage_options(UnknownEnum.Value_5);
            break;
        
        case "Springtrap":
            salvage_options(UnknownEnum.Value_20);
            break;
        
        case "Toy Freddy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_6);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_6);
                break;
            }
            
            add_page("Bored, bored, BORED!", "Toy Freddy");
            add_page("I thought all these arcade machines would keep me busy while I was stuck in here, but...", "Toy Freddy");
            add_page("...D'oh, I've mastered every single one already! Now none of them are FUN anymore!", "Toy Freddy");
            add_page("Sigh...it's tough being a gamer bear like me...", "Toy Freddy");
            add_page("...Say, you wouldn't happen to have any games at YOUR location, would you?", "Toy Freddy");
            add_page("You do!? HURRAY! There's hope for me yet!", "Toy Freddy");
            add_page("How about you let a bear hitch a ride with you back there, eh?", "Toy Freddy");
            salvage_options(UnknownEnum.Value_6);
            break;
        
        case "Toy Bonnie":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_7);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_7);
                break;
            }
            
            add_page("Ah, another fan! Right then, hand over whatever you want me to autograph.", "Toy Bonnie");
            add_page("...Huh? You're here to salvage me? You wanna take me with you back to your location?", "Toy Bonnie");
            add_page("Pshhh, quit fooling around! There's no way you'd be able to afford my rates.", "Toy Bonnie");
            add_page("A rising star like me can't just putz around with whoever. My fans here need me!", "Toy Bonnie");
            add_page("...Although I suppose having a bigger audience would definitely be nice...", "Toy Bonnie");
            add_page("...You know what, I changed my mind! I'll go with you! Go on then, show me to my limousine.", "Toy Bonnie");
            salvage_options(UnknownEnum.Value_7);
            break;
        
        case "Toy Chica":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_8);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_8);
                break;
            }
            
            add_page("Huh? You wanna, like, take me back to your place?", "Toy Chica");
            add_page("Uh...yeah, in your DREAMS! At LEAST, like, take me out to dinner first.", "Toy Chica");
            add_page("...What? You're a salvager? ...Oooh, that like, makes way more sense, yeah.", "Toy Chica");
            add_page("Well in that case, you should, like, TOTALLY take us back to your place, yeah. We're like, TOTALLY fun at parties.", "Toy Chica");
            add_page("So? Am I coming with?", "Toy Chica");
            salvage_options(UnknownEnum.Value_8);
            break;
        
        case "Mangle":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_9);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_9);
                break;
            }
            
            add_page("OOH, A NEW FRIEND! A NEW FRIEND TO PLAY WITH! IT'S BEEN YEARS!", "Mangle");
            add_page("YOU KNOW, IT GETS AWFUL LONELY HERE...THE OTHERS DON'T TALK TO ME MUCH.", "Mangle");
            add_page("I THINK THEY'RE JUST JEALOUS OF HOW PRETTY I AM.", "Mangle");
            add_page("BUT YOU SEEM FRIENDLY! HOW ABOUT WE HANG OUT BACK AT YOUR PLACE, FRIEND?", "Mangle");
            salvage_options(UnknownEnum.Value_9);
            break;
        
        case "JJ":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_15);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_15);
                break;
            }
            
            add_page("Shhh, quiet! Me and my brother are playing hide-n-seek, and I can't let him find me!", "JJ");
            add_page("...Whuzzat? You think you know a better hiding spot?", "JJ");
            add_page("Ooh, a completely different location? That's genius! I bet he'll NEVER find me there!", "JJ");
            add_page("...Especially since I don't think his programming even allows him to leave the building!", "JJ");
            add_page("So sure, I'll go with you! Will you take me there?", "JJ");
            salvage_options(UnknownEnum.Value_15);
            break;
        
        case "RWQFSFASXC":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_18);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_18);
                break;
            }
            
            add_page("∎∎∎∎∎ ∎∎∎∎∎∎∎∎ ∎∎∎∎∎∎∎∎ ∎∎ ∎∎∎∎∎∎∎∎ ∎∎∎∎∎. ∎∎∎ ∎∎∎ ∎∎∎∎ ∎∎∎∎ ∎'∎ ∎∎∎∎∎∎?", "RWQFSFASXC");
            add_page("...∎∎∎∎. ∎ ∎∎∎∎∎∎∎ ∎∎ ∎∎∎∎.", "RWQFSFASXC");
            add_page("∎∎∎∎, ∎∎ ∎∎∎ ∎∎∎ ∎∎∎∎ ∎∎∎∎ ∎'∎ ∎∎∎∎∎∎, ∎∎∎∎∎ ∎∎∎∎∎∎∎ ∎∎?", "RWQFSFASXC");
            salvage_options(UnknownEnum.Value_18);
            break;
        
        case "Lefty":
            salvage_options(UnknownEnum.Value_33);
            break;
        
        case "Shadow Freddy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_17);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_17);
                break;
            }
            
            add_page("As you reach out to inspect this animatronic...you notice that your hand phases right through it.", "");
            add_page("The animatronic may not actually exist within this physical realm. Luckily, the boss never said your salvages necessarily needed to.", "");
            salvage_options(UnknownEnum.Value_17);
            break;
        
        case "The Phantoms":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_19);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_19);
                break;
            }
            
            add_page("OoOoOoOoOoOo! DOES MY PARANORMAL PRESENCE FRIGHTEN YOU, MORTAL?", "Phantom BB");
            text_effect(0, 999, "Shake");
            add_page("I AM A PHANTOM! A GHOULISH MANIFESTATION OF THE FEAR AND SUFFERING THIS CHAIN HAS CAUSED!", "Phantom BB");
            text_effect(0, 999, "Shake");
            add_page("...What? C'mon, you should be quaking in your boots! Do I not FRIGHTEN you!?", "Phantom BB");
            text_effect(62, 70, "Shake");
            add_page("Oh what, let me guess, you think I look like a watermelon, huh?", "Phantom BB");
            add_page("Yeah yeah, get all your jokes out, it's not like I've already heard them a million times before.", "Phantom BB");
            add_page("Listen, just...*sniff* Whatever man, I don't even care if you salvage me anymore. *sniff* Just leave me alone...", "Phantom BB");
            text_effect(15, 21, "Shake");
            text_effect(82, 999, "Shake");
            salvage_options(UnknownEnum.Value_19);
            break;
        
        case "Helpy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_30);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_30);
                break;
            }
            
            add_page("Woah there, pal! Don't tell me you're here salvaging animatronics all by yourself!", "Helpy");
            add_page("Y'know, you could really use a little helper like me! Every job's more fun with a bear buddy by your side.", "Helpy");
            Skip[TextPageNumber] = true;
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Funny you mention it! I actually already have a-", "Jeremy");
                    break;
                
                case 1:
                    add_page("Uh...yeah, no, I actually-", "Mike");
                    break;
                
                case 2:
                    add_page("I appreciate the offer, but I actually already have one over-", "Vanessa");
                    break;
                
                case 3:
                    add_page("Well, I suppose I could-", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "helpy", [["You point out to Helpy that you do, in fact, already have a-", ""]]);
                    break;
            }
            
            add_page("So you DO need help! Great, great! That's what I do best!", "Helpy");
            add_page("Whaddaya say to me tagging along with you, huh, buddy?", "Helpy");
            add_page("All you have to do is install me on your computer! (Just be sure to disable your antivirus first!)", "Helpy");
            salvage_options(UnknownEnum.Value_30);
            break;
        
        case "Music Man":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_31);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_31);
                break;
            }
            
            add_page("Hey, watch it, will ya!? You almost threw off my groove!", "Music Man");
            add_page("I'm working on a new song, you dig? It goes a little something like this.", "Music Man");
            
            Function[TextPageNumber] = function()
            {
                audio_sound_gain(global.Music, 0, 1000);
            };
            
            add_page("Ahem...", "Music Man");
            
            Function[TextPageNumber] = function()
            {
                play_music(musMusicMan);
            };
            
            add_page("This old, moldy place has me down in the dumps! »I'd be jammin' all night if not jammed with these chumps!", "Music Man");
            text_effect(0, 999, "Spin");
            add_page("They call me a freak, geek, even unsightly! »All this critique, man, I'm gettin' it nightly!", "Music Man");
            text_effect(0, 999, "Spin");
            add_page("So please get me out, yeah, get me some space, »Please get me over to your pizza place!", "Music Man");
            text_effect(0, 999, "Spin");
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMusicMan);
                audio_sound_gain(global.Music, 0.5, 1000);
            };
            
            add_page("...Ehh?", "Music Man");
            salvage_options(UnknownEnum.Value_31);
            break;
        
        case "Mr. Hippo":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_32);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_32);
                break;
            }
            
            add_page("Ah, looks like I'm in quite the pickle...took one wrong turn at the park and somehow wound up here!", "Mr. Hippo");
            add_page("I'm not even quite sure how this all happened, to be honest with you. It seems I just...forgot.", "Mr. Hippo");
            add_page("You know how things are once you get old, your mind's not quite as sharp as it used to be. You can be walkin' in the park one second, the next...", "Mr. Hippo");
            add_page("...Well, you end up in a dark, decrepit, frankly sorta eerie place like this.", "Mr. Hippo");
            add_page("Y'know, this whole thing actually reminds me a bit of this one time I was with my good friend Orville, y'see...", "Mr. Hippo");
            add_page("He just keeps talking to himself. You struggle to stay awake as he rambles on for what feels like hours.", "");
            add_page("And I guess all this is to say that there are certain things you just shouldn't say to your in-laws.", "Mr. Hippo");
            add_page("...Right, you were here for some sort of salvaging job, weren't you?", "Mr. Hippo");
            salvage_options(UnknownEnum.Value_32);
            break;
        
        case "Malhare":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_37);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_37);
                break;
            }
            
            add_page("This animatronic seems to be maintaining intense, unbreaking, direct eye contact with you at all times.", "");
            add_page("Despite your best efforts to ignore it, its stare has not broken, not once.", "");
            add_page("It's getting really uncomfortable... Maybe it'll stop if you take it with you?", "");
            salvage_options(UnknownEnum.Value_37);
            break;
        
        case "Scrap Baby":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_35);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_35);
                break;
            }
            
            add_page("...I didn't expect you to come looking for me.", "Scrap Baby");
            add_page("I thought the company deemed me too broken to be worth salvaging...what's so special about you?", "Scrap Baby");
            add_page("...I take it you won't be reporting this particular salvage to the company.", "Scrap Baby");
            add_page("Not that I blame you...after all, ignorance is bliss, is it not?", "Scrap Baby");
            add_page("You know, that company you work for...it's kept its fair share of secrets from you too.", "Scrap Baby");
            add_page("If you take me along, maybe I can show you how they really conduct their business, hm?", "Scrap Baby");
            add_page("You might just learn a thing or two.", "Scrap Baby");
            salvage_options(UnknownEnum.Value_35);
            break;
        
        case "Plushtrap":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_21);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_21);
                break;
            }
            
            add_page("Oy, bugger off! I'm trying to watch the telly!", "Plushtrap");
            add_page("We're about to find out who the real pa of Clara's baby is! Don't you see how IMPORTANT this is?", "Plushtrap");
            add_page("...What? Oh, gimme a break, the telly's all I've got ever since me old playmate left.", "Plushtrap");
            add_page("Sigh...how I used to love playing tag with him...it was wonderful, he'd never stop running!", "Plushtrap");
            add_page("...You what? YOU'D like to play with me? Back at your pizzeria?", "Plushtrap");
            add_page("Well well, you're not at all the muppet I took ya for! Let's get a-movin' right along, why don't we?", "Plushtrap");
            salvage_options(UnknownEnum.Value_21);
            break;
        
        case "Nightmare Fredbear":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_22);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_22);
                break;
            }
            
            add_page("You nightguards are getting bolder by the day, aren't you?", "Nightmare Fredbear");
            add_page("You come here, and you disrespect me. You ask me to come back to your sorry excuse for a pizza parlor.", "Nightmare Fredbear");
            add_page("Don't even mention that place to me. That greasy good-for-nothing grandson of mine brought nothing but shame to the Fazbear name.", "Nightmare Fredbear");
            add_page("What I'd do to bring some damn dignity back to this thing of ours...the family business used to MEAN somethin'.", "Nightmare Fredbear");
            add_page("...Hmmm.", "Nightmare Fredbear");
            add_page("Tell ya what, I'll make you an offer. I'll come back to that lousy pizza joint of yours, and I get to...conduct my business.", "Nightmare Fredbear");
            add_page("You get your way, I get mine. Howsabout it?", "Nightmare Fredbear");
            salvage_options(UnknownEnum.Value_22);
            break;
        
        case "Nightmare BB":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_23);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_23);
                break;
            }
            
            add_page("BOO!", "Nightmare BB");
            text_effect(0, 4, "Shake");
            add_page("...Awww, c'mon! You didn't even flinch!", "Nightmare BB");
            add_page("Grrr...losers like you wouldn't know a good jumpscare if it bit your face off.", "Nightmare BB");
            add_page("You know what? I don't even WANT you to salvage me. I bet your pizzeria STINKS just as much as you do.", "Nightmare BB");
            add_page("And I don't hang around STINKY LOSERS who STINK.", "Nightmare BB");
            salvage_options(UnknownEnum.Value_23);
            break;
        
        case "Nightmarionne":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_24);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_24);
                break;
            }
            
            add_page("So you've finally found yourself standing at my feet...figuratively speaking.", "Nightmarionne");
            add_page("You're quite the fascinating case, do you know that?", "Nightmarionne");
            add_page("I've never seen someone so willing to face lethal danger as many times as you have...only to go back and do it again.", "Nightmarionne");
            add_page("You must be very comfortable with your own mortality. ...Or perhaps just desperate for a paycheck.", "Nightmarionne");
            add_page("Bravery or foolishness...It really makes no difference to me.", "Nightmarionne");
            add_page("I only want to know...are you brave enough to stand face-to-face against death itself?", "Nightmarionne");
            salvage_options(UnknownEnum.Value_24);
            break;
        
        case "Twisted Wolf":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_36);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_36);
                break;
            }
            
            add_page("YOU! How dare a tiny morsel like you walk up to me with such confidence!", "Twisted Wolf");
            add_page("How foolishly misguided you are. Don't believe that just because I lie here, half-buried in the earth, I am any less capable of tearing you limb from limb!", "Twisted Wolf");
            add_page("...I am only choosing not to out of respect. Yes, that is all. Feasting upon prey as meek as yourself does not an honorable hunter make.", "Twisted Wolf");
            add_page("I assure you, little morsel, shall you choose to heave me out of this shallow grave...", "Twisted Wolf");
            add_page("You will see my form is much more than a trick of the eyes.", "Twisted Wolf");
            salvage_options(UnknownEnum.Value_36);
            break;
        
        case "Dreadbear":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_38);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_38);
                break;
            }
            
            add_page("GRAAAAAAGH...DOORMAN SO MEAN!", "Dreadbear");
            text_effect(24, 29, "Shake");
            add_page("DREADBEAR WALK INTO HOUSE LOOKING FOR CANDY...AND MAN INSIDE KICK ME OUT!", "Dreadbear");
            add_page("SO RUDE...DREADBEAR WAS JUST TRYING TO TRICK-OR-TREAT! IT MAKES DREADBEAR ANGRY!!", "Dreadbear");
            text_effect(74, 81, "Shake");
            add_page("BOOHOO...WITHOUT ANY CANDY, DREADBEAR HAVE TO GO BACK TO EATING DIRT...", "Dreadbear");
            add_page("...SNIFF SNIFF. I SMELL...CANDY?", "Dreadbear");
            
            if (global.Guard == 2)
                add_page("YOU! MISS NIGHT GUARD WOMAN!", "Dreadbear");
            else if (global.Guard > 3)
                read_custom_dialogue("properties.txt", "dreadbear", [["YOU! NIGHT GUARD!", "Dreadbear"]]);
            else
                add_page("YOU! MISTER NIGHT GUARD MAN!", "Dreadbear");
            
            add_page("WILL YOU PLEEEAAASE GIVE DREADBEAR SOMETHING TASTY TO EAT?", "Dreadbear");
            salvage_options(UnknownEnum.Value_38);
            break;
        
        case "Molten Freddy":
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_34);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_34);
                break;
            }
            
            add_page("Ⅲ Ah, finally free of that box. The stage calls for us once more! »Ⅰ HEY! Who said YOU get the first line!?", "Molten Freddy");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("W-Who are you!?", "Jeremy");
                    break;
                
                case 1:
                    add_page("What're you supposed to be!?", "Mike");
                    break;
                
                case 2:
                    add_page("Uh...what ARE you, exactly?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Incredible form...just who might you be?", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("SPOILERS/spoiler_properties.txt", "molten_freddy", [["You're taken aback by this shambling mass of an animatronic. Panicked, you blurt out a \"what are you!?\" out of instinct.", ""]]);
                    break;
            }
            
            add_page("Ⅰ Oh, I'm glad you asked! We're...", "Molten Freddy");
            add_page("Ⅰ ...the PIECES PUT TOGETHER! BAHAHAHAHAHA!!", "Molten Freddy");
            add_page("Ⅰ Oh, and don't mind my friends here. It seems they forgot who the LEADER of this troupe is.", "Molten Freddy");
            add_page("Ⅳ And some leader you are! You're the one who got us trapped in that box to begin with!", "Molten Freddy");
            add_page("Ⅲ Yes, certainly not your brightest idea. We may be performers, but you're frankly no Houdini.", "Molten Freddy");
            add_page("Ⅰ Uh, first of all, it's pronounced 'HOUDINI.' »Ⅲ No, 'Houdini!' »Ⅳ It's - Why are you both saying it with an R?", "Molten Freddy");
            add_page("Ⅳ Well, no matter. You there, with the security badge!", "Molten Freddy");
            add_page("Ⅳ Relinquish me from these meaningless arguments and we promise to behave ourselves.", "Molten Freddy");
            add_page("Ⅰ ...Who said anything about 'we?'", "Molten Freddy");
            salvage_options(UnknownEnum.Value_34);
            break;
        
        case "Circus Baby":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_26);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_26);
                break;
            }
            
            add_page("...I do not recognize you. You are new.", "Circus Baby");
            add_page("Watch your step, this room is teeming with Bidybabs. I have trouble keeping track of them all myself...", "Circus Baby");
            add_page("I only wish I could find a safe place for them. You know how dangerous this facility is. It's a very difficult life down here...", "Circus Baby");
            add_page("...Oh, what is that? You would like to take us back to your location?", "Circus Baby");
            
            if (global.Guard < 4)
                Skip[TextPageNumber] = true;
            else
                read_custom_dialogue("SPOILERS/spoiler_properties.txt", "circus_baby", [["You, in fact, did not say that.", ""]]);
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Sorry, but I don't think I said anything about that-", "Jeremy");
                    break;
                
                case 1:
                    add_page("What? Wait, I didn't say anything about-", "Mike");
                    break;
                
                case 2:
                    add_page("Huh? Wait, no, I never said-", "Vanessa");
                    break;
                
                case 3:
                    add_page("Hm? Oh, did I say that? I'm sorry, I wasn't exactly paying-", "Fritz");
                    break;
            }
            
            add_page("Oh, I wasn't expecting such kindness... Well, I suppose I have no choice but to accept such a gracious offer.", "Circus Baby");
            add_page("Thank you. You are a good person, you know.", "Circus Baby");
            add_page("After all, someone would have to be rather inconsiderate, heartless...not to mention all-around despicable to just leave us here...", "Circus Baby");
            add_page("But I know you wouldn't do such a thing. You're far too kind of a person.", "Circus Baby");
            add_page("Now, may you direct us towards the exit?", "Circus Baby");
            salvage_options(UnknownEnum.Value_26);
            break;
        
        case "Funtime Freddy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_27);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_27);
                break;
            }
            
            add_page("Ⅰ Ooh ooh, I got another one! What did the bear say to the rabbit at his birthday party?", "Funtime Freddy");
            add_page("Ⅰ 'Hoppy birthday!' AHAHAHAHAHAHAHA!!", "Funtime Freddy");
            add_page("Ⅱ Heheh, yeah, that's...that's great, b-buddy...", "Bon-Bon");
            
            if (global.Guard == 2)
                add_page("Ⅱ ...Wait, Freddy, look! It's a salvager! I think she wants to get us out of here!", "Bon-Bon");
            else if (global.Guard > 3)
                add_page("Ⅱ ...Wait, Freddy, look! It's a salvager! I think this might be our ticket out of here!", "Bon-Bon");
            else
                add_page("Ⅱ ...Wait, Freddy, look! It's a salvager! I think he wants to get us out of here!", "Bon-Bon");
            
            add_page("Ⅰ Huh? Oh yeeeaaaah! Well, would ya look at that!", "Funtime Freddy");
            add_page("Ⅰ Well, I appreciate the visit, but me and Bon-Bon are just fine where we are!", "Funtime Freddy");
            add_page("Ⅰ After all, I still got PLENTY of knock-knock jokes! Ain't that right, Bon-Bon?", "Funtime Freddy");
            add_page("Ⅱ UHHHH, I-I think we should hear them out, actually!", "Bon-Bon");
            add_page("Ⅱ Don't you wanna finally see the outside world too?", "Bon-Bon");
            add_page("Ⅰ Huh? Weeeell, I guess I wouldn't MIND, but...", "Funtime Freddy");
            add_page("Ⅱ GREAT, great, then it's settled! We'll go with you, yeah! Let's get out of here!", "Bon-Bon");
            add_page("Ⅱ (Please, just take me with you. I don't know how many more knock-knock jokes I can take.)", "Bon-Bon");
            salvage_options(UnknownEnum.Value_27);
            break;
        
        case "Funtime Foxy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_28);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_28);
                break;
            }
            
            add_page("Oh, joyous day! A salvager! I was beginning to worry I'd never get my callback.", "Funtime Foxy");
            add_page("How I've been aching for an encore, how the stage calls for me!", "Funtime Foxy");
            add_page("But...well, to put it simply...", "Funtime Foxy");
            add_page("My heart just isn't in it anymore! My routine has grown stale...and I don't get along with the others quite like I used to.", "Funtime Foxy");
            add_page("But there's got to be plenty of new faces at your place, darling, surely! Why, I'm sure we could make a real showstopper together!", "Funtime Foxy");
            add_page("After all, what's a performer without their troupe? I'd be happy to meet your entourage!", "Funtime Foxy");
            add_page("Just give me my cue, and I'll gladly come with you!", "Funtime Foxy");
            salvage_options(UnknownEnum.Value_28);
            break;
        
        case "Ballora":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_29);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_29);
                break;
            }
            
            add_page("And a one, and a two - a little lighter on your toes, now -", "Ballora");
            add_page("Oh, a guest? Just a moment, little ones.", "Ballora");
            add_page("...That uniform is all too familiar to me. You're a salvager, aren't you?", "Ballora");
            add_page("Well, I can't say I'm NOT ready to leave this place...though if you must take me with you, I do have a little favor to ask.", "Ballora");
            add_page("Allow me to bring the little ones. They've...never seen the surface. They yearn for it, you understand.", "Ballora");
            add_page("And, if I may be so selfish, I simply wouldn't be able to part with them.", "Ballora");
            add_page("Would you be so kind as to entertain this old ballerina's request?", "Ballora");
            salvage_options(UnknownEnum.Value_29);
            break;
        
        case "Lolbit":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_25);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_25);
                break;
            }
            
            add_page("OMG HAAAAAAAAAAAAAIIII!!!! :DDDD", "Lolbit");
            add_page("ur a salvager? O_O zomg...havent seen one of those in like forever :V", "Lolbit");
            add_page("u wouldnt wanna take me though...im weird ._. And totally randem XD", "Lolbit");
            add_page("but maybe ill come with you...if u giv me enuff BACON!!! X3c And access to your employer's internal servers.", "Lolbit");
            add_page("... :3c", "Lolbit");
            salvage_options(UnknownEnum.Value_25);
            break;
        
        case "LolzHax":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_39);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_39);
                break;
            }
            
            add_page("Ah, another subject! Very well, you're just in time. Bear witness to my most brilliant scheme yet!", "LolzHax");
            add_page("With this device, I can warp any being from across time and space within seconds!", "LolzHax");
            add_page("As soon as I press this button, Fatty Fatbear and his fiendish friends will be finished ONCE AND FOR ALL!!", "LolzHax");
            add_page("...Although...I have not yet had the opportunity to test the device. My equipment here is much too valuable to endanger, you see.", "LolzHax");
            add_page("Bring me back to your pizzeria to conduct my experiments, and together, I - er - WE, shall RULE THE GALAXY!", "LolzHax");
            text_effect(142, 200, "Shake");
            salvage_options(UnknownEnum.Value_39);
            break;
        
        case "Animdude":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_41);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_41);
                break;
            }
            
            add_page("Hey.", "Animdude");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Uh...hi!", "Jeremy");
                    add_page("Nice tie.", "Animdude");
                    add_page("Oh, uh...thank you!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Uh, hey?", "Mike");
                    add_page("Nice vest.", "Animdude");
                    add_page("...Thanks?", "Mike");
                    break;
                
                case 2:
                    add_page("Hey?", "Vanessa");
                    add_page("Nice hat.", "Animdude");
                    add_page("Uh...thanks.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Hello yourself.", "Fritz");
                    add_page("Nice tie.", "Animdude");
                    add_page("Ah, thanks! It's not mine.", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("SPOILERS/spoiler_properties.txt", "animdude", [["Nice, uh...whatever you've got on.", "Animdude"]]);
                    break;
            }
            
            if (global.Guard < 4)
                add_page("Frickbear's Pizza, right? I can tell by the badge.", "Animdude");
            
            add_page("Y'know, legally, you're not supposed to be here.", "Animdude");
            add_page("...Though I guess I'm not either.", "Animdude");
            add_page("...Wanna get out of here?", "Animdude");
            salvage_options(UnknownEnum.Value_41);
            break;
        
        case "Coffee":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_40);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_40);
                break;
            }
            
            add_page("Well great, this is embarrassing.", "Coffee");
            add_page("I went into sleep mode and somehow ended on a completely different planet. (I knew I shouldn't have let another program use my body...)", "Coffee");
            add_page("It's at least nice to know Earth is still doing well. ...Even if the condition of this place isn't the best first impression.", "Coffee");
            add_page("Listen, I don't like asking for help, but current circumstances leave me no other choice. Mind taking me somewhere a bit more suitable?", "Coffee");
            add_page("A pizzeria isn't ideal...but I suppose it's better than wasting my processing power standing around here.", "Coffee");
            salvage_options(UnknownEnum.Value_40);
            break;
        
        case "Chipper":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_42);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_42);
                break;
            }
            
            add_page("Hey, kid! Mind helping a beaver out?", "Chipper");
            add_page("Now, I don't know exactly how I ended up here, but I can feel it. The universe brought me here to bring termites to justice.", "Chipper");
            add_page("I can feel them crawling all over this place! Consider it a sixth sense beavers have.", "Chipper");
            add_page("They're a lot smaller here than the ones back home...but as far as I'm concerned, that just means more termites per bomb!", "Chipper");
            add_page("Now, there's just one problem...I'm miles away from my lumber business!", "Chipper");
            add_page("And without a stable income, there's no way I'll be able to fund my attack. (I'm in enough debt as it is...)", "Chipper");
            add_page("Mind takin' me back with ya so I can get my business started back up? And maybe after a while, I can turn your pizzeria into a missile silo!", "Chipper");
            add_page("...Eh, one step at a time.", "Chipper");
            salvage_options(UnknownEnum.Value_42);
            break;
        
        case "Sparky":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_43);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_43);
                break;
            }
            
            add_page("EEP! O-Oh, howdy there, yong'un! I ain't used to visitors.", "Sparky");
            add_page("Sorry I ain't of much use to ya. A bot of my age ain't got nothin' worth salvaging...", "Sparky");
            add_page("I...reckon the company ain't THAT desperate, right...?", "Sparky");
            add_page("...Hoo boy. Well. I suppose I wouldn't be fussin' about some tune-ups...Certainly would be nice to have ol' righty back again.", "Sparky");
            add_page("...Maybe some legs, too.", "Sparky");
            add_page("So sure, I'd be mighty happy to come with with ya! ...So long as you're willin' to haul me.", "Sparky");
            salvage_options(UnknownEnum.Value_43);
            break;
        
        case "Candy":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_44);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_44);
                break;
            }
            
            add_page("So THIS is Freddy's? Sheesh, and I thought my place was the pits.", "Candy");
            add_page("Listen buddy, you really gotta start practicing self-respect. I would frankly be embarrassed to work in a place like this.", "Candy");
            add_page("Well, if you need someone to bring some panache back to your place...I GUESS I wouldn't mind tagging along.", "Candy");
            add_page("If it's even half as ugly as this one, I'm sure it could use it.", "Candy");
            salvage_options(UnknownEnum.Value_44);
            break;
        
        case "Popgoes":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this guy.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_45);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_45);
                break;
            }
            
            add_page("This is the Longest Popgoes has been away from home...The Chef Wanted me to go on a vacation, but...", "Popgoes");
            add_page("...Oh, I don't stand a Fighting Chance out here! If I don't get back to the Dead Forest, this is gonna be my Popgoes Finale!", "Popgoes");
            add_page("Although...I suppose you seem like the type to Chase Animatronics. How about you salvage me and I Return to Freddy's too? ", "Popgoes");
            add_page("I must admit, I do have some fond Popgoes Memories of that place.", "Popgoes");
            add_page("Popgoes Arcade 2016.", "Popgoes");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("If I did, would that make you myPOPGOES?", "Jeremy");
                    break;
                
                case 1:
                    add_page("If I did, would that make you myPOPGOES?", "Mike");
                    break;
                
                case 2:
                    add_page("If I did, would that make you myPOPGOES?", "Vanessa");
                    break;
                
                case 3:
                    add_page("If I did, would that make you myPOPGOES?", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("SPOILERS/spoiler_properties.txt", "popgoes", [["If you did, maybe that would make him myPOPGOES.", ""], ["Er...yourPOPGOES? I suppose this joke really only works in first person.", ""]]);
                    break;
            }
            
            salvage_options(UnknownEnum.Value_45);
            break;
        
        case "Rodney":
            if (array_length(global.SalvagesCurrent) >= global.SalvageQuota)
            {
                add_page("Your quota's already been met! No point in salvaging this one.", "");
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                play_selection_voiceline(UnknownEnum.Value_46);
            };
            
            if (skip_cutscenes())
            {
                salvage_options(UnknownEnum.Value_46);
                break;
            }
            
            add_page("Ey, get lost, kid! Bird up to important work here!", "Rodney");
            add_page("Seriously, you think a big-name big shot like me can spare a single second for some schmuck like you?", "Rodney");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I'm sorry, I don't mean to be rude, but...", "Jeremy");
                    add_page("Who are you exactly?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Big name? I've never heard of you.", "Mike");
                    break;
                
                case 2:
                    add_page("Uh...am I...supposed to recognize you?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Oh yeah, right! You're a big star!", "Fritz");
                    add_page("...Who are you again?", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("SPOILERS/spoiler_properties.txt", "rodney", [["Despite his bravado...you don't actually recognize this character at all.", ""]]);
            }
            
            add_page("...What? C'mon, SURELY you recognize me. EVERYONE recognizes me!", "Rodney");
            add_page("Rodney Redbird? Hellooo? Ringin' any bells?", "Rodney");
            add_page("THE top-adda-line name in animatronic entertainment turned made man in the Suntown mob?", "Rodney");
            add_page("...Seriously? Nuthin'? Wow, what a sad little life you must live.", "Rodney");
            add_page("Like, it's bad enough you look like that, but you're living under a rock too? Yeesh.", "Rodney");
            add_page("Well...if I absolutely HAVE to...", "Rodney");
            add_page("I, Rodney Redbird, will come back to your sad, sad pizzeria and enrich your sad, sad existence.", "Rodney");
            add_page("...You're paying for the cabbie ride over, though.", "Rodney");
            add_page("Whaaat, don't give me that look! You're lucky I'm not chargin' my regular rates!", "Rodney");
            salvage_options(UnknownEnum.Value_46);
            break;
        
        case "FT_LockedDoor":
            add_page("Strangely, the door seems to be locked...", "");
            add_page("Perhaps there's another way to get into this room?", "");
            break;
        
        case "FT_DoorControls":
            add_page("It seems these door buttons are no longer functional...", "");
            add_page("You're incredibly lucky none of the animatronics here want to kill you.", "");
            break;
        
        case "FT_GoldenFreddyPoster":
            add_page("Something about this poster in particular feels...", "");
            add_page("...Unnatural.", "");
            break;
        
        case "FT_FreddyPoster":
            add_page("I wonder...", "");
            add_page("...Just had to make sure.", "");
            
            Function[TextPageNumber - 1] = function()
            {
                audio_play_sound(sfxNoseHonk, 100, false, 2);
            };
            
            break;
        
        case "FT_Rules":
            add_page("There's a sign here reading 'RULES FOR SAFETY.'", "");
            add_page("You continue reading down the list.", "");
            add_page("'1. Don't run.'", "");
            add_page("'2. Don't yell.'", "");
            add_page("'3. Don't scream.'", "");
            add_page("'4. Don't poop on floor.'", "");
            add_page("'5. Stay close to mom.'", "");
            add_page("'6. Don't touch Freddy.'", "");
            add_page("'7. Don't hit.'", "");
            add_page("'8. Leave before dark.'", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I'm glad this company's so dedicated to safety!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...I don't even wanna think about what happened for that fourth one to be instated.", "Mike");
                    break;
                
                case 2:
                    add_page("I still remember the incident that made us include that fourth one.", "Vanessa");
                    add_page("...Never again.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Guys like me are the reason that fourth one exists.", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "maze_rules_poster", [["You can't help but wonder what events must have transpired for all these rules to have been put in place.", ""], ["...Especially the fourth one.", ""]]);
                    break;
            }
            
            break;
        
        case "FT_SafeRoomBoards":
            if (instance_exists(oMazeFloorDecoration_Hatchet))
            {
                add_page("There's a room on the other side of these boards!", "");
                add_page("...But with no way to break them down, it would seem there's no way in.", "");
            }
            else
            {
                add_page("There's boards blocking the way, but using that hatchet you found earlier...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oCamera3DMaze.LockOnTarget)
                        instance_destroy(instance_nearest(x, y, oMazeWall_Flat));
                    
                    bitcrush_sound(sfxWoodBreak);
                };
                
                add_page("Aha, there we go! Now to see what's on the other side.", "");
                replace_text(arg0, "Destroy");
            }
            
            break;
        
        case "FT_LockedParts&ServiceDoor":
            add_page("The door's locked...", "");
            add_page("Maybe someone around here has the key?", "");
            replace_text("BB_Normal", "BB_Quiz");
            break;
        
        case "FT_LockedParts&ServiceDoor_Unlocked":
            add_page("The door's locked, but with that key you got earlier...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oCamera3DMaze.LockOnTarget)
                {
                    with (instance_nearest(x, y, oMazeDoor_Unmoving))
                        instance_change(oMazeDoor, false);
                    
                    bitcrush_sound(sfxSparkleImpact);
                }
            };
            
            add_page("Aha, there we go! Now to see what's inside.", "");
            replace_text(arg0, "Destroy");
            break;
        
        case "FT_Hatchet":
            with (oCamera3DMaze)
                LockOnTarget = instance_nearest(x, y, oInteractionPoint);
            
            if (point_distance(oCamera3DMaze.x, oCamera3DMaze.y, oCamera3DMaze.LockOnTarget.x, oCamera3DMaze.LockOnTarget.y) > 64)
            {
                add_page("There seems to be something hidden behind this table...but you're too far away to reach it.", "");
            }
            else
            {
                add_page("...Huh? What's this?", "");
                add_page("Strangely, it would seem there's a hatchet stowed away behind this table!", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oCamera3DMaze.LockOnTarget)
                        instance_destroy(oMazeFloorDecoration_Hatchet);
                    
                    audio_play_sound(sfxBitCollect, 10, false);
                };
                
                add_page("You took the hatchet. Seems like this might come in handy.", "");
                replace_text(arg0, "Destroy");
            }
            
            break;
        
        case "FT_Bear5":
            add_page("Some horror attraction... Do they really think a flat, still image of Freddy is gonna frighten anyone?", "");
            replace_text("FT_Bear5", "FT_Bear5Alt");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(0, 0, 0, oBear5Jumpscare))
                    Delay = 60;
            };
            
            break;
        
        case "FT_Bear5Alt":
            add_page("You should've seen the look on your face.", "");
            break;
        
        case "FT_WallHint_Box":
            add_page("It's a big box of animatronic parts! Seems the company must've had a surplus of these.", "");
            add_page("You turn over one of the props sticking out of the box and see a message written on the back of it...", "");
            add_page("'The password is six numbers long.'", "");
            add_page("...Whatever that means.", "");
            break;
        
        case "FT_WallHint_Freddy":
            add_page("It's a hollow Freddy suit...You almost feel sorry for the Freddy who must've been skinned to make this prop.", "");
            add_page("You notice something written on one of its curled-up corners. It reads...", "");
            add_page("'Every number in the password is unique. There's no 1, 6 or 7.", "");
            add_page("...Whatever that means.", "");
            break;
        
        case "FT_WallHint_Foxy":
            add_page("It's a hollow Foxy head! Seems like a tag is still attatched to it.", "");
            add_page("On the tag is a message written in pen...", "");
            add_page("'The 5 comes last in the password. Or...third? Honestly, I forgot.'", "");
            add_page("...Whatever that means.", "");
            break;
        
        case "FT_WallHint_Bonnie":
            add_page("It's a hollow Bonnie suit. A strobe light was installed in his head, presumably to scare people afraid of lights.", "");
            add_page("You notice something written on the back of his ear. It says...", "");
            add_page("'The 4 comes after a number smaller than it and before a number larger than it.'", "");
            add_page("...Whatever that means.", "");
            break;
        
        case "FT_WallHint_Chica":
            add_page("There's a hollow Chica head sitting on the floor.", "");
            add_page("You notice a message written on its backside. It reads...", "");
            add_page("...'The first three numbers are all odd. The last three numbers are all even.'.", "");
            add_page("...Whatever that means.", "");
            break;
        
        case "FT_Carousel":
            add_page("You briefly consider hopping aboard the carousel and taking it for a ride, but ultimately decide against it.", "");
            add_page("Not only because of its age, but also the likelihood that it was not designed to support the weight of a fully grown adult.", "");
            add_page("Alas...One of the many shackles of adulthood.", "");
            break;
        
        case "FT_Fridge":
            add_page("There appear to be multiple children's drawings pinned up on the fridge, all drawn in sloppy crayon.", "");
            add_page("Upon a closer look, all of them are signed 'William'.", "");
            
            if (has_been_evil() && currently_evil())
                add_page("...One of them appears to be some kind of octopus monster with a very square head.", "");
            
            break;
        
        case "FT_Television":
            add_page("It's set to the flashing colors channel. Presumably Plushtrap's favorite.", "");
            break;
        
        case "GoUpstairs":
            add_page("Go upstairs?", "");
            add_option("Yes", "Upstairs_Yes");
            add_option("No", "The Hot Boobs Dialogue");
            break;
        
        case "GoDownstairs":
            add_page("Go downstairs?", "");
            add_option("Yes", "Downstairs_Yes");
            add_option("No", "The Hot Boobs Dialogue");
            break;
        
        case "Upstairs_Yes":
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                with (oTextBox)
                    Transitioning = true;
            };
            
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oInteractionPoint)
                {
                    if (Text == "GoDownstairs")
                    {
                        with (oCamera3DMaze)
                        {
                            x = other.x;
                            y = other.y + 96;
                        }
                    }
                }
                
                with (oTextBox)
                    Transitioning = false;
            };
            
            Delay[TextPageNumber] = 60;
            Skip[TextPageNumber] = true;
            add_page("", "");
            break;
        
        case "Downstairs_Yes":
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                with (oTextBox)
                    Transitioning = true;
            };
            
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oInteractionPoint)
                {
                    if (Text == "GoUpstairs")
                    {
                        with (oCamera3DMaze)
                        {
                            x = other.x;
                            y = other.y - 96;
                        }
                    }
                }
                
                with (oTextBox)
                    Transitioning = false;
            };
            
            Delay[TextPageNumber] = 60;
            Skip[TextPageNumber] = true;
            add_page("", "");
            break;
        
        case "Arcade":
            if (global.SalvagedMinigames[global.Night - 1])
                global.MinigameCleared = max(global.MinigameCleared, 1);
            
            var ArcadeGameNames = ["Chomping With Chica", "Puppet Patrol", "Hare Pairs", "Pirate Plunder", "Circus Sorter"];
            
            if (global.MinigameCleared == 0)
                add_page("It's an arcade cabinet for " + ArcadeGameNames[global.Night - 1] + "! Play it?", "");
            else if (global.MinigameCleared == 1)
                add_page("It's an arcade cabinet for " + ArcadeGameNames[global.Night - 1] + "! Go for a high score?", "");
            else
                add_page("It's an arcade cabinet for " + ArcadeGameNames[global.Night - 1] + "! You already beat it, but play it again anyway?", "");
            
            add_option("Yes", "Arcade_Yes");
            add_option("No", "Marionette_No");
            break;
        
        case "Arcade_Yes":
            Delay[TextPageNumber] = 60;
            
            Function[TextPageNumber] = function()
            {
                var ArcadeGameObjects = [oMinigame_ChicasFeedingFrenzy, oMinigame_PuppetPatrol, oMinigame_HarePairs, oMinigame_PiratePlunder, oMinigame_CircusSorter];
                instance_create_depth(0, 0, 0, ArcadeGameObjects[global.Night - 1]);
                instance_create_depth(0, 0, 0, oMinigameDrawer);
                window_set_cursor(cr_default);
            };
            
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                instance_destroy(oMinigameParent);
                instance_destroy(oMinigameDrawer);
                window_set_cursor(cr_none);
            };
            
            add_page("That's enough for now.", "");
            break;
        
        case "Arcade_Clear":
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                instance_destroy(oMinigameParent);
                instance_destroy(oMinigameDrawer);
                window_set_cursor(cr_none);
            };
            
            add_page("Something came clattering out of the arcade machine...", "");
            
            if (global.SalvagedMinigames[global.Night - 1] == 0)
            {
                Function[TextPageNumber] = function()
                {
                    global.SalvagedMinigames[global.Night - 1] = true;
                    global.UnlockedMinigames[global.Night + 1] = true;
                    audio_play_sound(sfxBitCollect, 10, false);
                    save_permanent_data();
                };
                
                var ArcadeGameNames = ["Chomping With Chica", "Puppet Patrol", "Hare Pairs", "Pirate Plunder", "Circus Sorter"];
                add_page("Got the arcade board for " + ArcadeGameNames[global.Night - 1] + "!", "");
                
                if (!array_contains(global.SalvagedMinigames, true))
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oCamera3DMaze)
                        {
                            with (oInteraction_Animatronic)
                            {
                                if (AnimatronicID == 49)
                                {
                                    oCamera3DMaze.LockOnTarget = self;
                                    oCamera3DMaze.LockX = x;
                                    oCamera3DMaze.LockY = y;
                                    oCamera3DMaze.LockZ = Height;
                                }
                            }
                        }
                    };
                    
                    add_page("Ooh, looks like you found yourself a game board!", "Psychic Friend Fredbear");
                    add_page("If you take that back with you to the office, you should be able to plug it in and play a new minigame!", "Psychic Friend Fredbear");
                }
                
                if (global.MinigameCleared == 2)
                    add_page("...Oh? It seems something else fell out as well...", "");
            }
            
            if (global.MinigameCleared == 2)
            {
                Function[TextPageNumber] = function()
                {
                    global.HasGift = true;
                    audio_play_sound(sfxBitCollect, 10, false, 1, 0, 0.8);
                };
                
                add_page("Got a mysterious present!", "");
            }
            
            break;
        
        case "Keypad":
            add_page("Huh? There appears to be a set of tiles on this wall that can be pressed like a keypad...", "");
            add_page("Investigate closer?", "");
            add_option("Yes", "Keypad_Yes");
            add_option("No", "Marionette_No");
            break;
        
        case "Keypad_After":
            add_page("...Seriously, though. Whose idea WAS this?", "");
            break;
        
        case "Keypad_Yes":
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, 0, oKeypad);
                window_set_cursor(cr_default);
            };
            
            add_page("Press space to quit.", "");
            
            Function[TextPageNumber] = function()
            {
                instance_destroy(oKeypad);
                window_set_cursor(cr_none);
            };
            
            break;
        
        case "Box":
            add_page("This box has a lock with a keypad. Try cracking it open?", "");
            add_option("Yes", "Box_Yes");
            add_option("No", "Marionette_No");
            break;
        
        case "Box_Yes":
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, 0, oKeyboardInput);
                window_set_cursor(cr_default);
            };
            
            add_page("Press space to quit.", "");
            
            Function[TextPageNumber] = function()
            {
                instance_destroy(oKeyboardInput);
                window_set_cursor(cr_none);
            };
            
            break;
        
        case "Box_Cracked":
            Function[TextPageNumber] = function()
            {
                instance_destroy(oKeyboardInput);
                window_set_cursor(cr_none);
                
                with (oTextBox)
                    Transitioning = true;
            };
            
            add_page("You tried the code 'SPRINGBONNIE'...", "");
            add_page("...The box opened, and something sprung out!", "");
            
            Function[TextPageNumber] = function()
            {
                with (oMazeSign)
                {
                    if (Sprite == sMazeDecor_WilliamBox)
                        ImageIndex = 1;
                }
                
                with (oTextBox)
                    Transitioning = false;
                
                with (oInteraction_Animatronic)
                {
                    if (AnimatronicID == UnknownEnum.Value_34)
                    {
                        x = 1712;
                        y = 32;
                    }
                }
            };
            
            replace_text("Box", "Destroy");
            break;
        
        case "Keypad_Cracked":
            Function[TextPageNumber] = function()
            {
                instance_destroy(oKeypad);
                window_set_cursor(cr_none);
                
                with (oCamera3DMaze.LockOnTarget)
                {
                    with (instance_nearest(x, y, oMazeDoor_Unmoving))
                        instance_change(oMazeDoor, false);
                }
            };
            
            add_page("Sounds like something nearby opened!", "");
            replace_text("Keypad", "Keypad_After");
            break;
        
        case "PaperTip_SpringtrapHint":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("We've been told by corporate to reopen the safe room, but I evidently can't do that until we find our hatchet.", "Memo");
            add_page("I know Ralph hid it away somewhere...Some garbage about how it's, quote, \"not safe to have a hachet lying around in a children's play area.\"", "Memo");
            add_page("The jerk...Regardless, if anyone finds it, please let me know. I can't do my job until we do. -Clark Fixy Ͼ", "Memo");
            break;
        
        case "PaperTip_CharacterNumber":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Multiple employees have reported sightings of an animatronic resembling a dog in the backroom.", "Memo");
            add_page("For the record, these are nothing more than a workplace rumor. There is no dog character here, nor is there at any Freddy's location.", "Memo");
            add_page("Just as there always has been, there are only 7 animatronics at this location, including our spare endoskeleton and two decommissioned older models.", "Memo");
            add_page("If we hear of any additional rumors being spread, the employee responsible will promptly be fired. -Management", "Memo");
            break;
        
        case "PaperTip_ReturnToOffice":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("ATTENTION ALL NIGHT WATCHMEN:", "Memo");
            add_page("We've noticed multiple guards leaving various food wrappers and empty drink cups in their office after their shifts.", "Memo");
            add_page("Once your shift is over, PLEASE double check the office and make sure any and all trash has been cleaned up before you leave!", "Memo");
            add_page("Your coworkers will thank you. -Management", "Memo");
            break;
        
        case "PaperTip_SalvageValues":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("The company's apparently just retrofitting the old animatronics for this location instead of bringing back the new ones...", "Memo");
            add_page("It's cheap, but it's fine by me. Those plastic ones were premium, sure, but I never liked them. They were...strangely aggressive.", "Memo");
            add_page("If there's anything I've learned in my time here, the more expensive a bot is, the bigger pain it is to deal with.", "Memo");
            break;
        
        case "PaperTip_EndoChaser":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("We've observed some strange behavior with our animatronic endoskeletons when they haven't been assigned a specific character's programming.", "Memo");
            add_page("It is advised that all employees other than our technicians do their best to avoid the endoskeletons' line of sight when in this state.", "Memo");
            add_page("If you do enter an endoskeleton's line of sight and it begins pursuing you, then...", "Memo");
            add_page("...", "Memo");
            add_page("...Just avoid entering an endoskeleton's line of sight.", "Memo");
            break;
        
        case "PaperTip_GameBoards":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Please be gentle with our arcade cabinets. They are very delicate pieces of machinery, and are NOT to be shaken or tipped over.", "Memo");
            add_page("Most importantly, if the game board comes loose while you are playing it, employees are NOT permitted to take it home with them.", "Memo");
            add_page("We thank you for maintaining our attractions. -Management", "Memo");
            break;
        
        case "PaperTip_LeftyHint":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Okay, I'm sure the engineers are playing some sort of prank on me. Who the hell programmed BB to be such a kleptomaniac?", "Memo");
            add_page("It was already annoying enough when it was just flashlights, but last night I tried to leave only to find he stole my car keys too.", "Memo");
            add_page("If he tries to snatch one more thing from me, I'm gonna have to do something about it. -Clark Fixy Ͼ", "Memo");
            break;
        
        case "PaperTip_ThreatLevels":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("The criminal detection and dispatch functionality of our new animatronic characters has produced some...unexpected results.", "Memo");
            add_page("To help our staff stay safe, each animatronic's threat level will be listed in future employee training documents.", "Memo");
            add_page("Characters listed as 'managable' should not pose a threat if dealt with properly, but your safety near them is not guaranteed.", "Memo");
            add_page("Potentially lethal damage may occur.", "Memo");
            add_page("Characters listed as 'negligible', however, should not pose a risk of harm to any employee, and can be interacted with without worry.", "Memo");
            add_page("Please exercise caution until our engineers finish working out these characters' kinks. Thank you. -Management", "Memo");
            break;
        
        case "PaperTip_SalvageBonus":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Management has ordered a mass recall on the new line of animatronics. Apparently they just couldn't get the criminal recognition thing working.", "Memo");
            add_page("But honestly, I couldn't be more excited - Not about the animatronics, no, it's about the deal they're offering for anyone who salvages them.", "Memo");
            add_page("Apparently any employee who brings one back to headquarters will get a commission proportional to whatever that animatronic's worth...", "Memo");
            add_page("...And more importantly, whoever brings in the most valuable ones will be first up for a promotion.", "Memo");
            add_page("I'm not usually a competitive guy, but let it be known that come hell or high water, I WILL be getting that promotion.", "Memo");
            break;
        
        case "PaperTip_TokenDrops":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("We are officially ending our 'Put Coinslots in Every Animatronic' initiative due to unforseen technical issues.", "Memo");
            add_page("It has been found that the token receptacles installed into our animatronics tend to come loose with movement.", "Memo");
            add_page("As a result, animatronics may drop tokens when performing, or when bumping into doors while in free roaming mode.", "Memo");
            add_page("When this happens, please clean them up, as to ensure customers don't get any freebies.", "Memo");
            add_page("Thank you. -Management", "Memo");
            break;
        
        case "PaperTip_Henry":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Henry came into work for the first time in a while today. He was raving like a lunatic, and dragged in this black bear animatronic in with him.", "Memo");
            add_page("Whatever this thing is, he seems to value it a lot. He told us we were the only ones who could 'keep her safe', or something along those lines.", "Memo");
            add_page("I mean...I suppose I'm happy he trusts us like that, but...", "Memo");
            add_page("...Man, he's really losing it. I didn't wanna say it to his face, especially considering what he's been going through, but...", "Memo");
            add_page("...Is he really in any condition to be running this whole company? The guy needs some time to grieve.", "Memo");
            add_page("Hopefully he can sell it off to somebody new like he was planning to. I don't think the sight of these things is good for him.", "Memo");
            add_page("...They might not be good for me either. This one in particular gives me the creeps.", "Memo");
            add_page("Either way, if you're reading this, I'm assuming you're the guy he hired to take care of this thing.", "Memo");
            add_page("If that's you, congrats! This is your problem to deal with now.", "Memo");
            break;
        
        case "PaperTip_ScrapBabyHint":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("I swear the guys who built this place are making everything obtuse on purpose. Who the hell hides a keypad in the wall tiles!?", "Memo");
            add_page("I spent so much time trying to find the thing that I ended up forgetting the passcode. I know it began with a 3, but the rest is a blur.", "Memo");
            add_page("I might've written the password on one of the props, but I can't remember which one it was...", "Memo");
            add_page("Guess I'll just check them all until I figure it out. -Clark Fixy Ͼ", "Memo");
            break;
        
        case "PaperTip_FrightsLore1":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Well, that lead at the old location fell through. Apparently the animatronic they had was sealed in a backroom and they just couldn't get it open.", "Memo");
            add_page("We WERE able to snag a couple animatronics, though. Some of the cheap ones still being produced for the franchise locations.", "Memo");
            add_page("...But the boss isn't happy about it. Says they aren't 'vintage' enough, that they'll 'totally break immersion'...", "Memo");
            add_page("But hey, an animatronic is still an animatronic. I'm sure SOMEONE will be scared by that...hippo thing.", "Memo");
            break;
        
        case "PaperTip_FrightsLore2":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Man, what's with this computer system? Did it come with the malware right out of the box?", "Memo");
            add_page("And what's with these terms and conditions?", "Memo");
            add_page("'By checking, you accept the possibility of virtual characters manifesting themselves in the real world'??", "Memo");
            add_page("What does that even MEAN!?", "Memo");
            break;
        
        case "PaperTip_ArcadeBonus":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Dude, whoever decided to put these arcade machines here made a huuuuuge mistake. I can't stop playing them.", "Memo");
            add_page("I play 'em, I quit, and I just go right back to playing 'em again! I've gotten WAY too good at them!", "Memo");
            add_page("...So good, in fact, that I offer a public challenge to all of my coworkers:", "Memo");
            add_page("Anyone who manages to beat one of my high scores will get a little gift, courtesy of yours truly.", "Memo");
            add_page("Don't think I'll hold my end of this deal? Just beat one of my high scores and see what happens. -Fredsweeper Frank", "Memo");
            break;
        
        case "William_Box":
            add_page("Some strange documents are pinned up on the wall...", "");
            add_page("If you're that rotten son of mine, shove off. The contents of this room are none of your concern.", "Paper");
            add_page("However, if by some unlikely chance my plan to scare off the children went wrong...", "Paper");
            add_page("...and you are visiting this room after my death, presumably to write my memoir...", "Paper");
            add_page("Well, I suppose I should reward your recognition of my accomplishments with something. If you will, direct your attention to the box on that desk.", "Paper");
            add_page("Inside this box is some of my most brilliant work, more brilliant than anything I'm sure you could possibly comprehend.", "Paper");
            add_page("However, the box is locked with a passcode... One that only I know.", "Paper");
            add_page("Of course, I won't tell you what it is outright. That wouldn't be any fun. Instead, I'll give you a hint.", "Paper");
            add_page("The password is my one pride and joy...the one thing I hold more love for than anything else...", "Paper");
            add_page("...Which I suppose isn't saying much, but I digress...", "Paper");
            add_page("The password is the name of my favorite child.", "Paper");
            break;
        
        case "PaperTip_MoltenFreddyHint":
            add_page("Even here, a bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("I don't really know who's even gonna see this, but...", "Paper");
            add_page("This is just some guy's house. I don't care what the company says, I don't care if it's abandoned, I'm not trespassing for this job.", "Paper");
            add_page("If they're gonna keep pushing their limits like this, I frankly want no part of it. Sometimes you just gotta let sleeping bears lie.", "Paper");
            add_page("If they want that locked box upstairs so badly, they can tell someone else to get it. I'm out. -Clark Fixy Ͼ", "Paper");
            break;
        
        case "PaperTip_MinigamesPersist":
            add_page("Even here, a bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Duuude, Clark is like, SO totally missing out. This game freakin' rules.", "Paper");
            add_page("I got a pretty good highscore on it, though I do feel like I could do even better...", "Paper");
            add_page("Luckily, now that this game's on my radar, I can add it to the rotation for my next work week! Same with all the others.", "Paper");
            add_page("For now though, I'd better head back. The boss doesn't like me gaming on company time. -Fredsweeper Frank", "Paper");
            break;
        
        case "PaperTip_LogHenry":
            add_page("It seems to be a personal log.", "");
            add_page("I hear Henry caved in and finally hired professional voice actors for the animatronics...", "Paper");
            add_page("What was wrong with the old ones!? Who cares if they're not \"professional,\" the janitors loved voicing the animatronics!", "Paper");
            add_page("They did a damn good job at it, too! You could barely even tell Chica was voiced by a man!", "Paper");
            add_page("That dishwasher we had do it, whatever his name was...he absolutely loved doing the voice! So much that he began talking like that all the time!", "Paper");
            add_page("And started wearing skirts, and changed names...", "Paper");
            add_page("See, that's the kind of dedication this company needs, but of course Henry wouldn't have the eye for work ethic that I do.", "Paper");
            add_page("He'll be the death of this company.", "Paper");
            break;
        
        case "PaperTip_LogCC":
            add_page("It seems to be a personal log.", "");
            add_page("Today may mark the worst day of my life.", "Paper");
            add_page("Tragedy struck at the diner today, during the party.", "Paper");
            add_page("That rotten son of mine...", "Paper");
            add_page("Always such a crybaby! Didn't he listen to me when I told him the springlocks were susceptible to water damage!?", "Paper");
            add_page("If he had only toughened up and stopped sobbing for once, none of this would have happened!", "Paper");
            add_page("And now, thanks to him, not only will the diner have to close down, but the company wants to retire the springlocks altogether.", "Paper");
            add_page("My greatest work, down the drain...", "Paper");
            add_page("This is all HIS fault, I'm sure of it. He must've paid Michael off. He never liked the springlocks.", "Paper");
            add_page("He must've known that if he could create a scene, he could get my technology retired for good.", "Paper");
            add_page("Well, if he thinks he can take away my greatest creation so easily, we'll see how he likes a taste of his own medicine.", "Paper");
            break;
        
        case "PaperTip_LogElizabeth":
            add_page("It seems to be a personal log.", "");
            add_page("As if enough hadn't been taken from me already, I lost my dearly beloved daughter today.", "Paper");
            add_page("Oh, my poor, sweet child...you were perfect, the light of my life, and yet you were too good for this cruel world...", "Paper");
            add_page("My dear Circus Baby...if it wasn't for that good-for-nothing, blonde brat, those who doubted me would have finally seen your excellence.", "Paper");
            add_page("You were the culmination of all my research, all my brilliance, and yet all it took was one stupid, STUPID little girl to tarnish you.", "Paper");
            add_page("Time and time again, I've come to realize how little justice there is in the world.", "Paper");
            break;
        
        case "PaperTip_LogBaby":
            add_page("It seems to be a personal log.", "");
            add_page("After having time to think about it, I've come to realize...", "Paper");
            add_page("Circus Baby never meant all that much to me after all.", "Paper");
            add_page("As crushed as I was to lose her at first, I've come to see that she was simply a failed experiment.", "Paper");
            add_page("Rare for me, though I suppose it's an inevitable part of the scientific process.", "Paper");
            add_page("I'd hardly call her my greatest work, as impressive as she was. No, there is a much clearer candidate for that...", "Paper");
            add_page("The one who started all of this...", "Paper");
            break;
        
        case "PaperTip_LogMichael":
            add_page("It seems to be a personal log.", "");
            add_page("Despite everything, Michael STILL does nothing but laze around on the couch.", "Paper");
            add_page("I despise that boy. He does nothing. I leave for work and find him in the exact same place every single day.", "Paper");
            add_page("And when I do, he's never even watching anything good! It's always that melodramatic drivel they call a soap opera.", "Paper");
            add_page("(I suppose there isn't anything good on TV anymore ever since they cancelled Win a Boat and a New Pair of Pants...)", "Paper");
            add_page("The whole house reeks of him. I don't think he's even showered in days.", "Paper");
            add_page("What's wrong with him!? What, is he sad that he doesn't have Elizabeth or that crybaby around to terrorize anymore?", "Paper");
            add_page("I don't either, but you don't see me sulking about it!", "Paper");
            add_page("Perhaps I'll send him down to the bunker... Yes, that should whip him into shape.", "Paper");
            break;
        
        case "PaperTip_LogSpringBonnie":
            add_page("It seems to be a personal log.", "");
            add_page("Just as I suspected, it still rests in the backroom of the old location.", "Paper");
            add_page("I was afraid some know-nothing would have moved it out by now...but I'm glad to see my employees know their place.", "Paper");
            add_page("Now, leaving my children behind isn't anything new for me, but for once this is one I care about. I'll find a place for it. Somewhere it will be safe.", "Paper");
            add_page("Spring-Bonnie... I'll make good use of you.", "Paper");
            break;
        
        case "PaperTip_LogJerrod":
            add_page("Some strange documents are pinned up on the wall...", "");
            add_page("I woke up this morning to yet another email from Michael's horrible uncle. (I refuse to refer to him as my brother.)", "Paper");
            add_page("Peddling yet another pointless product of his, begging me to put his idea for a shrimp animatronic into production...", "Paper");
            add_page("Bah! I could tolerate him if he was just a conman, but marrying out of the family name? It's unforgivable!", "Paper");
            add_page("What kind of surname is Sorelli? It's shameful! Afton is a good name, a strong name! It's one people remember!", "Paper");
            add_page("Oh, and don't even get me started on that half-wit nephew of his... He sure isn't MY nephew!", "Paper");
            add_page("The log goes on for another couple pages...but you decide to not read any further.", "");
            break;
        
        case "PaperTip_FinalClark":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("If anyone's looking for anything special here, don't bother. I already swept the place and the whole band is gone.", "Paper");
            add_page("...I guess it's a good thing they produced backups, but even once they get those down here, this place will only have 6 animatronics.", "Paper");
            add_page("Whatever the boss sent that kid down here to do... He's probably not gonna be happy when he hears how it went. -Clark Fixy Ͼ", "Paper");
            break;
        
        case "PaperTip_FinalFred":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Dude, they've got arcade cabinets here too!? Maybe coming down here was worth it after all!", "Paper");
            add_page("...I better not stick around too long though, especially knowing what happened to those last two technicians.", "Paper");
            add_page("I've always wondered what would happen if I played every cabinet this company produced in one rotation...", "Paper");
            add_page("...Though even then, I'd be missing out on the three that only existed as cartridges. Even now, I've never come across those.", "Paper");
            add_page("Maybe something special would happen if I played them all...? I dunno, maybe that's weird to think, but I have heard these cabinets have...", "Paper");
            add_page("...Certain supernatural-y effects on people.", "Paper");
            add_page("...Not me, though! All I've got is your run-of-the-mill gaming addiction. -Fredsweeper Frank", "Paper");
            break;
        
        case "PaperTip_DarkFixy":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("Drat! Confound it all! It seems Candy snuck his way out of the building again...", "Paper");
            add_page("That cat's curiosity is gonna get him killed one of these days! He's lucky I had the physical AND intellectual prowess to track him down.", "Paper");
            add_page("By all means, our animatronics should have no reason to be on Fazbear property...", "Paper");
            add_page("...And I'd hate for one of those lowly salvagers of theirs to get their grubby little hands on them.", "Paper");
            add_page("Perhaps some backdoor dealings are at hand. I wouldn't put it past those Fazbear freaks to resort to corporate espionage.", "Paper");
            add_page("After all, I'm sure they're desperate to expand their catalogue. Only 40 characters? Pah! A paltry sum!", "Paper");
            add_page("...Whatever it is they're up to, I'll be sure to put a stop to it. -Dark Fixy", "Paper");
            break;
        
        case "PaperTip_UpgradeCadet":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("LOG ENTRY: DAY 1067", "Paper");
            add_page("I HAVE NOTICED THAT THIS LOCATION DOES NOT GET MUCH FOOT TRAFFIC. FEW PEOPLE HAVE COME IN TO BUY MY UPGRADES.", "Paper");
            add_page("PERHAPS I SHOULD SET UP SHOP ELSEWHERE... OR DIVERSIFY MY BUSINESS.", "Paper");
            add_page("I SUPPOSE THERE ARE MY STORIES, BUT FEW PEOPLE EVER SEEM TO UNDERSTAND WHAT THEY MEAN...", "Paper");
            add_page("...OR WHAT DEEPER TRUTHS THEY HINT TOWARDS.", "Paper");
            break;
        
        case "PaperTip_LolzHax":
            add_page("A bunch of documents and employee memos are pinned up on the wall...", "");
            add_page("This LolzHax animatronic is incredible! Seriously, how have I not found ANY documentation on this guy?", "Paper");
            add_page("Seriously, he can just...summon animatronics right into the pizzeria! I never have to go salvaging again!", "Paper");
            add_page("He refuses to summon in any animatronic I already have, though... Which is a shame, since we could really use some spare parts.", "Paper");
            add_page("...Though I suppose I could take advantage of this.", "Paper");
            add_page("After all, if I have all the mass-produced animatronics here already...he'd have no choice but to summon in only the rarer ones, right...?", "Paper");
            break;
        
        case "Newspaper1":
            add_page("Among the documents, there appears to be a newspaper clipping pinned up on the wall!", "");
            add_page("Out of curiousity, you begin reading...", "");
            add_page("LOCAL PIZZERIA FILES FOR BANKRUPTCY - 9/10/04", "Newspaper");
            add_page("Despite efforts to cut costs, the once beloved family eatery Freddy Fazbear's Pizza has reportedly filed for bankruptcy.", "Newspaper");
            add_page("While still popular with some local families, the chain's sordid past has turned many customers away in recent years.", "Newspaper");
            add_page("This is not even to mention the poor condition of the restaurant itself, described by a local mother as \"like, the grossest thing ever.\"", "Newspaper");
            add_page("When asked for comment, the company founder and CEO had this to say:", "Newspaper");
            add_page("\"We've certainly faced our fair share of hardships before. We'll get through this.\"", "Newspaper");
            add_page("\"These characters will live on. Even if it's not by my hand, somebody will keep this brand alive.\"", "Newspaper");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, if I'm working here now...I guess that means they really did!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Interesting article.", "Mike");
                    break;
                
                case 2:
                    add_page("...For better or for worse.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Incredible how this brand manages to persist even beyond the brink of death...", "Fritz");
                    add_page("Perhaps cartoon animal mascots really are the closest we have to achieving immortality.", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "maze_newspaper_1", [["Interesting article.", ""]]);
                    break;
            }
            
            break;
        
        case "Newspaper2":
            add_page("Among the documents, there appears to be a newspaper clipping pinned up on the wall!", "");
            add_page("Out of curiousity, you begin reading...", "");
            add_page("LOCAL BIRTHDAY PARTY ENDS IN TRAGEDY - 11/14/87", "Newspaper");
            add_page("After only being in operation for a few short weeks, the recently opened Freddy Fazbear's Pizza has already shut its doors.", "Newspaper");
            add_page("This closure followed a particularly disastrous birthday party at the location, as recalled by those who attended.", "Newspaper");
            add_page("According to them, the staff had somehow managed to mess up the party's pizza order seven times in a row...", "Newspaper");
            add_page("...and brought out a vanilla birthday cake for a child when he had explicitly asked for strawberry.", "Newspaper");
            add_page("This is in addition to other annoyances, such as a mascot character chewing off a man's frontal lobe in front of their child.", "Newspaper");
            add_page("Following the intense backlash levied against the restaurant for their substandard customer service, the location has closed down indefinitely.", "Newspaper");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Someone had their entire frontal lobe bitten off...?", "Jeremy");
                    add_page("Jeez...glad I'm not that guy!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Wait, the robots can do that?", "Mike");
                    break;
                
                case 2:
                    add_page("Sheesh, these journalists have their priorities all out of order...", "Vanessa");
                    add_page("They didn't even mention that the carousel broke down!", "Vanessa");
                    break;
                
                case 3:
                    add_page("Strawberry cake is the pompous fool's flavor.", "Fritz");
                    add_page("Desperate to seem greater than the average vanilla enjoyer, but not adventurous enough to indulge in some of my more personal tastes.", "Fritz");
                    add_page("Like lobster, or nitroglycerine.", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "maze_newspaper_2", [["It's times like these you remember why you should always wear a helmet.", ""], ["The staff will never get your order wrong if you do. It makes you a lot more memorable.", ""]]);
                    break;
            }
            
            break;
        
        case "Newspaper3":
            add_page("Among the documents, there appears to be a newspaper clipping pinned up on the wall!", "");
            add_page("Out of curiousity, you begin reading...", "");
            add_page("STRUGGLING RESTAURANT CHAIN FINALLY FINDS BUYER - 2/10/05", "Newspaper");
            add_page("After a slow decline over the past two decades, and several changes in leadership since the loss of the company's former CEO...", "Newspaper");
            add_page("...The infamous local chain Freddy Fazbear's Pizza has finally been sold to a lone entrepreneur.", "Newspaper");
            add_page("After months of struggling to find a buyer, this individual turned up as the only bidder for the company.", "Newspaper");
            add_page("While this entrepreneur wished to remain anonymous, he did have the following to say regarding this surprising acquisition:", "Newspaper");
            add_page("\"'Tragic past?' Bah, whatever! Everybody loves pizza, right? This place'll make me RRRRRRRICH!!\"", "Newspaper");
            add_page("\"Besides, you wouldn't BELIEVE how cheap this place was! It's like they were giving it away! Heeheehee!\"", "Newspaper");
            add_page("Shortly after its purchase, the chain was rebranded under the new name of \"Freddy Frickbear's Pizza.\"", "Newspaper");
            add_page("When asked what the reasoning behind the change was, the new owner responded: \"I thought it would be funny.\"", "Newspaper");
            add_page("Not much has been heard from the company's now-former CEO, Phineas Talbert, since the acquisition...", "Newspaper");
            add_page("...Though given the events leading up to the purchase, he likely wishes to distance himself from the brand.", "Newspaper");
            add_page("And with the company's reputation being what it is, who can really blame him?", "Newspaper");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...The new name isn't THAT funny...", "Jeremy");
                    break;
                
                case 1:
                    add_page("...I mean, I guess the new name's a LITTLE funny.", "Mike");
                    break;
                
                case 2:
                    add_page("That former owner...didn't he...?", "Vanessa");
                    add_page("...", "Vanessa");
                    break;
                
                case 3:
                    add_page("Ooh! Only a man positively REEKING of business know-how could roll their r's like that!", "Fritz");
                    add_page("Pah, what a pity...I'm sure I could've scrounged up enough bottle caps to purchase the company myself, if I had only known of it sooner...", "Fritz");
                    add_page("...and children were less afraid of me.", "Fritz");
                    break;
                
                default:
                    read_custom_dialogue("properties.txt", "maze_newspaper_3", [["Despite his eccentricities, you can kind of see where the new owner's coming from.", ""], ["After all...you DO like pizza.", ""]]);
                    break;
            }
            
            break;
        
        case "Newspaper4":
            add_page("There appears to be a newspaper clipping pinned up on the wall.", "");
            add_page("Out of curiousity, you begin reading...", "");
            add_page("LOCAL BUSINESS OWNER FOUND DEAD IN HOME - 2/13/05", "Newspaper");
            add_page("Earlier this morning, authorities found local business owner Henry Emily dead in his home during a routine welfare check.", "Newspaper");
            add_page("While a gruesome scene, one which authorities are still trying to wrap their heads around...", "Newspaper");
            add_page("...Any foul play has been ruled out. All evidence points to Mr. Emily having been the only person in his home at the time of death.", "Newspaper");
            add_page("While his former business has fallen into public infamy over the years, many who worked for Emily hold him in high regard, and mourn his passing.", "Newspaper");
            add_page("When asked for comment, a company technician who claimed to be quite close with Mr. Emily had the following to say...", "Newspaper");
            add_page("\"He was doing pretty rough for a while. I hate to see him go like this.\"", "Newspaper");
            add_page("\"...I guess he just wanted to be with his wife and daughter again.\"", "Newspaper");
            add_page("...You decided to not read any further.", "");
            break;
        
        case "Newspaper_5":
            add_page("There appears to be a newspaper clipping pinned up on the wall.", "");
            add_page("Out of curiousity, you begin reading...", "");
            add_page("SORDID CEO RETURNS TO STRUGGLING RESTAURANT CHAIN - 2/25/05", "");
            add_page("It was a shock to see the new owner of Frickbear Entertainment arrested mere days after the acquisition of the company.", "Newspaper");
            add_page("...But what was even more of a shock was that a mere week after his imprisonment, the CEO has already returned to his former position.", "Newspaper");
            add_page("According to sources close to the company, he had quickly made bail thanks to his \"lotsa gold coinses.\", and immediately got back to work.", "Newspaper");
            add_page("Shortly afterwards, he had applied for a nightguard position at the company, allegedly in order to perform espionage on the new owner.", "Newspaper");
            add_page("Upon confronting him, said new owner allegedly \"started crying, got on his knees, and begged him to take the position back.\"", "Newspaper");
            add_page("When asked for comment, this short-lived owner exhaustedly claimed that \"running this place is an experience I wouldn't wish on my worst enemy.\"", "Newspaper");
            add_page("We're all wishing him the best here in the reporter's room.", "Newspaper");
            break;
        
        case "FredbearCloser_Slacker":
            if (oEndingPFFredbear.EndingsSeen == 3)
            {
                add_page("Wow! You...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(1);
                };
                
                add_page("...Really saved the easiest one for last, huh?", "");
                add_page("...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(0);
                };
                
                add_page("...Well, now you've seen every way this story ends.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(3);
                };
                
                add_page("And no matter how you go about it, you can't help everyone. Someone gets left behind...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(0);
                };
                
                add_page("...And by the end of it, you're just back at square one.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(2);
                };
                
                add_page("Hey, don't be upset! You tried your best, you know?", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(3);
                };
                
                add_page("Besides, it isn't ALL bad...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(2);
                };
                
                add_page("Even if things stay the same, there's...something comforting about that, you know?", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(1);
                };
                
                add_page("...Well, either way, I'd say you deserve some rest.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(0);
                };
                
                add_page("Why don't you take it easy for a while?", "");
            }
            else
            {
                add_page("Woah, hey, hey! You aren't leaving already, are »you?", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(2);
                };
                
                add_page("We still have so, SO many more friends to make! So many more games to play! You've barely scratched the surface!", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(3);
                };
                
                add_page("...Ah, but you must be pretty tired out after all of that, huh?", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(2);
                };
                
                add_page("Don't worry, I get it! Go ahead, get some rest if you need it.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingPFFredbear)
                        change_expression(0);
                };
                
                add_page("...Just promise me you'll come back to play sometime soon, yeah?", "");
                check_if_last_ending();
            }
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                {
                    Fadeout = true;
                    Timer = 30;
                    audio_play_sound(sfxPowerOn, 50, false);
                }
            };
            
            break;
        
        case "FredbearCloser_Evil":
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    Expression = 1;
            };
            
            add_page("Sheesh, what a downer! If only things could've »gone a different way...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(0);
            };
            
            add_page("...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(1);
            };
            
            add_page("...You know, it doesn't have to end like this.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(0);
            };
            
            add_page("You can keep going. Keep trying.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(2);
            };
            
            add_page("And hey, who knows? Maybe if you try REALLY hard, you'll end up with a happier ending!", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(0);
            };
            
            add_page("...Wouldn't hurt to try, would it?", "");
            check_if_last_ending();
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                {
                    Fadeout = true;
                    Timer = 30;
                    audio_play_sound(sfxPowerOn, 50, false);
                }
            };
            
            break;
        
        case "FredbearCloser_Good":
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    Expression = 2;
            };
            
            add_page("Awww, how sweet! Those two finally got their »happily ever after...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(3);
            };
            
            add_page("...Looks like the rest of us are still stuck here, though.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(2);
            };
            
            add_page("Hey, that's not a bad thing! All our friends are here, after all!", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(0);
            };
            
            add_page("Maybe you should go spend more time with them. You wouldn't want them to get lonely, after all!", "");
            check_if_last_ending();
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                {
                    Fadeout = true;
                    Timer = 30;
                    audio_play_sound(sfxPowerOn, 50, false);
                }
            };
            
            break;
        
        case "FredbearCloser_Money":
            add_page("Wow, look at you! At this rate, you'll be promoted »for sure!", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(1);
            };
            
            add_page("...Though you should know life isn't all about the money.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(2);
            };
            
            add_page("It's about the journey! The friends you make along the way!", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(3);
            };
            
            add_page("And if you ever want to take that journey again...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                    change_expression(0);
            };
            
            add_page("...I'll be there to take it with you.", "");
            check_if_last_ending();
            
            Function[TextPageNumber] = function()
            {
                with (oEndingPFFredbear)
                {
                    Fadeout = true;
                    Timer = 30;
                    audio_play_sound(sfxPowerOn, 50, false);
                }
            };
            
            break;
        
        case "FredbearCloser_Ultimate":
            add_page("Phew! What a ride, huh?", "");
            add_page("...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(1);
            };
            
            add_page("...Oh, right, let me take this off.", "");
            Delay[TextPageNumber] = 120;
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    FadingIn = true;
                
                audio_play_sound(sfxPFFAppear, 10, false);
            };
            
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                {
                    MaskOn = false;
                    change_expression(1);
                }
            };
            
            add_page(string("Hi there, {0}. Recognize me?", guard_nickname()), "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(2);
            };
            
            add_page("Sorry for not showing myself sooner... I'm sure you were wondering where that little voice in your head was coming from.", "");
            var MarioKills = global.DeathRecord[UnknownEnum.Value_16];
            
            if (MarioKills > 0)
            {
                Function[TextPageNumber] = function()
                {
                    with (oEndingCharlie)
                        change_expression(3);
                };
                
                if (MarioKills == 1)
                    add_page("...And, uh... Sorry about killing you that one time, too.", "");
                else
                    add_page(string("...And, uh... Sorry about those {0} times I killed you, too.", global.DeathRecord[UnknownEnum.Value_16]), "");
                
                Function[TextPageNumber] = function()
                {
                    with (oEndingCharlie)
                        change_expression(1);
                };
                
                add_page("But hey! All's well that ends well, huh?", "");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    with (oEndingCharlie)
                        change_expression(1);
                };
                
                add_page("...Oh, and thanks for keeping the music box running this whole time, too.", "");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(0);
            };
            
            add_page("Either way, it seems like what you said to Cassidy really got through to him. Him and the others have all departed now.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(3);
            };
            
            add_page("...Which I suppose means I'd better be on my way too.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(2);
            };
            
            add_page("Heh. I can only imagine how happy my dad will be once he sees us all again.", "");
            add_page("...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(3);
            };
            
            add_page("...You know, I guess all of this is to say...", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(0);
            };
            
            add_page(string("...You're a real cool person, {0}.", guard_nickname()), "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                    change_expression(1);
            };
            
            add_page("Thank you for taking this journey with us.", "");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingCharlie)
                {
                    Fadeout = true;
                    Timer = 30;
                    audio_play_sound(sfxPowerOn, 50, false);
                }
            };
            
            break;
        
        case "FredbearMonologue":
            add_page("Poor, poor Henry...", "");
            add_page("...He never did make it back to tell the tale.", "");
            Delay[TextPageNumber] = 240;
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
                oScaryFredbear.FadeIn = true;
                audio_play_sound(sfxPFFAppear, 50, false, 1, 0, 0.6);
            };
            
            add_page(string("Hey, {0}, buddy! What do you think you're doing here, huh?", guard_nickname()), "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_2;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("C'mon, ol' pal, you know a little watchman like yourself shouldn't be sticking their nose in confidential company files!", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_3;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("Why don't you just...hand over that little ol' folder...and things can go on just as they should, yeah?", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("After all...I'm sure you wouldn't wanna end up like Henry.", "");
            add_page("...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_3;
            };
            
            add_page("...You, uh, aren't gonna give it back, are you?", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_1;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("...Heheh, alright.", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("Alright, I get it. I see what you're trying to do here.", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_3;
            };
            
            add_page("You think, by collecting all of these artifacts, by bringing them all together in one place...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
            };
            
            add_page("...You can save everyone, don't you?", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_1;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("Free all those poor little souls...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_4;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("...And destroy everything we've built up here in the process.", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_3;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("Well, have you considered...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
            };
            
            add_page("Maybe...things are better this way?", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_2;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page(string("C'mon, {0}! You see it too, don't you? They love it here!", guard_nickname()), "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
                oScaryFredbear.ShowMasks = true;
                oScaryFredbear.FadeIn = false;
                oScaryFredbear.FadeSpeed = 5;
            };
            
            add_page("Those poor kids... Who KNOWS what waits for them on the other side, am I right?", "");
            add_page("But here, they've got friends to make, games to play, smiles to bring...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_4;
                oScaryFredbear.ShowMasks = false;
                oScaryFredbear.FadeIn = true;
            };
            
            add_page("And somehow, you think that's a bad thing!", "");
            add_page("...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_3;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page("...Hmmm, you know what? Maybe you just don't have the right...", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_0;
            };
            
            add_page("...Perspective, on everything.", "");
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_1;
                oScaryFredbear.EyeOffsetSpeed = 4;
            };
            
            add_page(string("Here, {0}...", guard_nickname()), "");
            Delay[TextPageNumber] = 120;
            
            Function[TextPageNumber] = function()
            {
                oScaryFredbear.Eyes = UnknownEnum.Value_4;
                oScaryFredbear.FadeIn = false;
                audio_stop_all();
            };
            
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, depth + 1, oScaryFredbear_Reveal);
            };
            
            add_page("»»Why don't I show you?", "");
            
            Function[TextPageNumber] = function()
            {
                with (oScaryFredbear_Reveal)
                {
                    sprite_index = sFredbear_Reveal2;
                    Frame = 0;
                    audio_play_sound(sfxFifthEndingReveal, 10, false, 1, 0, 1.5);
                }
            };
            
            break;
        
        case "FredbearFightOpener":
            global.BossPhase = min(global.BossPhase, 1);
            
            if (global.Night == 6)
            {
                switch (global.Deaths[5])
                {
                    case 0:
                        add_page("I really do hate to do this to you, you know. You» were one of my favorites.", "");
                        add_page("...But hey, I think I know a way I can make it up to you!", "");
                        add_page("How about a little trip down memory lane?", "");
                        break;
                    
                    case 1:
                        add_page("Wow, back already?", "");
                        add_page("Haha, I can't blame you!", "");
                        break;
                    
                    case 2:
                        add_page("We could keep playing like this forever, you know.", "");
                        add_page("...Well, we as in me and the other kids. I still kinda have to kill you.", "");
                        break;
                    
                    case 3:
                        add_page("You know, if you wanna stop me so bad...", "");
                        add_page("...Maybe you should quit playing along.", "");
                        break;
                    
                    case 4:
                        add_page("...You don't give up easy, do you?", "");
                        break;
                    
                    default:
                        add_page("Let's try this again.", "");
                        break;
                }
            }
            
            if (global.BossPhase > 0 && false)
            {
                add_option("Start from beginning", "Fredbear_BossStart");
                add_option("Start from boss stage", "Fredbear_BossBoss");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    instance_create_depth(0, 0, 0, oFredbearManager);
                    instance_create_depth(0, 0, 0, oPersistentPauser);
                };
            }
            
            break;
        
        case "Fredbear_BossStart":
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, 0, oFredbearManager);
                instance_create_depth(0, 0, 0, oPersistentPauser);
            };
            
            break;
        
        case "Fredbear_BossBoss":
            Function[TextPageNumber] = function()
            {
                global.BossPhase = 2;
                instance_create_depth(0, 0, 0, oFredbearManager);
                instance_create_depth(0, 0, 0, oPersistentPauser);
            };
            
            break;
        
        case "CassidyEndscene":
            add_page("It seems like no matter how hard I try...", "Cassidy");
            add_page("...You just won't let me have my way, huh?", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(1);
            };
            
            add_page("Gosh. You really are stubborn.", "Cassidy");
            add_page("...", "Cassidy");
            add_page("...I...", "Cassidy");
            add_page("...I don't want this all to end.", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(0);
            };
            
            add_page("I...don't want my friends to leave me behind.", "Cassidy");
            add_page("I know what I've done is selfish. I know it's wrong, but I...", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(1);
            };
            
            add_page("...I couldn't let Henry take away the only friends I've ever known.", "Cassidy");
            add_page("I couldn't let you get in the way of me keeping them here.", "Cassidy");
            add_page("I...", "Cassidy");
            add_page("...I told the others there was nothing waiting for us after this, but...", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(0);
            };
            
            add_page("The truth is, I don't know what's gonna happen to us when we move on.", "Cassidy");
            add_page("When we...reach the other side.", "Cassidy");
            add_page("And the thought of that...", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(1);
            };
            
            add_page("...It terrifies me.", "Cassidy");
            add_page("What if there's nothing? What if after everything we've done it's just...black? Total nothingness?", "Cassidy");
            add_page("An unending void...an eternity where I can't even find comfort in my own screams.", "Cassidy");
            add_page("...", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(2);
            };
            
            add_page("...I... I can't go there.", "Cassidy");
            add_page("I can't be forgotten. I can't be left behind.", "Cassidy");
            add_page("Can't it just stay this way forever?", "Cassidy");
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                {
                    CurCassidy = 0;
                    VisualMode = 1;
                }
                
                audio_sound_gain(sfxWindyAmbience, 0.25, 2000);
            };
            
            add_page("...", guard_nickname());
            
            Function[TextPageNumber] = function()
            {
                with (oCassidyEndscene)
                    switch_cassidy_sprite(1);
                
                play_music(mus_Cassidy);
            };
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...H-Heh... We're two guys who've had it a little rough, huh?", "Jeremy");
                    add_page("I get where you're coming from...", "Jeremy");
                    add_page("...Okay, well, not ENTIRELY, b-but...", "Jeremy");
                    add_page("After everything that led to me working here, a lot of my friends were surprised I kept on looking for work.", "Jeremy");
                    add_page("They called it a \"comedy of errors.\" They said if they were in my shoes, they'd just...", "Jeremy");
                    add_page("...Stop. Give up. Accept life as it is, and all that stuff...", "Jeremy");
                    add_page("But, y'know what they say... Nothing is born of resignation right?", "Jeremy");
                    add_page("Bad stuff happens, 'cause it kinda...has to, at some point...", "Jeremy");
                    add_page("It's like, um... Do you like rollercoasters?", "Jeremy");
                    add_page("...Huh? Wh-what do you mean...?", "Cassidy");
                    add_page("Oh, I was a rollercoaster attendant a couple summers ago, I...er...", "Jeremy");
                    add_page("What I mean is, life's like a rollercoaster, right?", "Jeremy");
                    add_page("It comes at you fast! Sometimes you can barely process it all as it flies past you...", "Jeremy");
                    add_page("And...yeah, bad things happen. The coaster has to go down at some point...and it can be really scary when it does.", "Jeremy");
                    add_page("But when it goes down, that just means it'll go back up again!", "Jeremy");
                    add_page("Sure, maybe I could've just gotten some rest for once, or stayed home to focus on my studies...", "Jeremy");
                    add_page("...But then I wouldn't have gotten to experience one of the craziest weeks of my life!", "Jeremy");
                    add_page("...And I wouldn't have gotten to meet you!", "Jeremy");
                    add_page("...", "Cassidy");
                    add_page("...Life can be threatening, but...that's all the more reason to make the most of it, right?", "Jeremy");
                    add_page("Maybe you'll make some mistakes along the way...but hey, everyone does! That's just part of growing as a person!", "Jeremy");
                    add_page("...I think what I did was a bit more than a mistake...", "Cassidy");
                    add_page("...Right. Henry...", "Jeremy");
                    add_page("...B-But, hey! From how those papers of his sounded, it seems like all he really wanted was to help you guys move on.", "Jeremy");
                    add_page("Maybe it took a bit more time and a bit more hardship than he would've wagered, but...", "Jeremy");
                    add_page("...I think he'd really like for you all to join him, wherever he is now.", "Jeremy");
                    add_page("Just remember to say you're sorry, yeah?", "Jeremy");
                    add_page("...Haha, yeah...", "Cassidy");
                    add_page("...You're right. Nothing's gonna get better if I keep myself down here...", "Cassidy");
                    add_page("...If I keep all of them down here.", "Cassidy");
                    add_page("If there's even a chance I can make it up to them all, then I think it's...", "Cassidy");
                    break;
                
                case 1:
                    add_page("...Listen, kid.", "Mike");
                    add_page("I don't know anything about what it must be like to be stuck here for so long.", "Mike");
                    add_page("I don't know what's on the other side... (And I sure as hell don't know how to handle children...)", "Mike");
                    add_page("...But whatever you end up facing there, it can't be any worse than spending an eternity here, right?", "Mike");
                    add_page("I've only been here a week and I already hate this place. I can't imagine how you've felt being trapped here.", "Mike");
                    add_page("...And, hey, it's not like you have to go it alone, right? Your friends'll go with you.", "Mike");
                    add_page("...But, after all that I did...", "Cassidy");
                    add_page("...Would they even st-still want to be my friends anymore?", "Cassidy");
                    add_page("I...", "Mike");
                    add_page("...", "Mike");
                    add_page("...Look. I can't say for sure.", "Mike");
                    add_page("But you still care about them, right? Don't you think they deserve better than to be stuck in a place like this?", "Mike");
                    add_page("Maybe they'll be mad. Maybe they'll need some time away.", "Mike");
                    add_page("If they do...you'll just have to work on yourself for them. You'll find it in yourself to become a better person, for their sake.", "Mike");
                    add_page("Trust me, kid. As long as you have someone out there to keep fighting for...that's all you need.", "Mike");
                    add_page("You gotta do what's best for them.", "Mike");
                    add_page("I...", "Cassidy");
                    add_page("...", "Cassidy");
                    add_page("...You're right.", "Cassidy");
                    add_page("It...it isn't right to keep them all down here.", "Cassidy");
                    add_page("...It isn't right to keep myself down here.", "Cassidy");
                    add_page("Whatever's there for us after everything's over...they're still my friends. At least, I still believe that...", "Cassidy");
                    add_page("...Still, I...I don't like saying goodbye.", "Cassidy");
                    add_page("I'll...I'll see you again someday, won't I?", "Cassidy");
                    add_page("Heh...well, hopefully not too soon.", "Mike");
                    add_page("...But you take care of yourself until then, alright?", "Mike");
                    add_page("...Haha, yeah...", "Cassidy");
                    add_page("It's...", "Cassidy");
                    break;
                
                case 2:
                    add_page("...I get it, kid. I really do.", "Vanessa");
                    add_page("Stability is...nice. Knowing things won't change, that you can just stay put while everything keeps chugging along...", "Vanessa");
                    add_page("...Knowing that you won't need to change. Knowing you can cruise through life if you maintain the status quo.", "Vanessa");
                    add_page("But...I think we both need to face the facts.", "Vanessa");
                    add_page("This place...it's just kinda miserable now, isn't it? After everything that's happened, nothing really seems like it'll get better...", "Vanessa");
                    add_page("...And it'll just stay that way if you keep them believing in this sad fantasy. That everything's fine the way it is here.", "Vanessa");
                    add_page("Letting others pay in blood just so you can keep it up... Is that really how you want things to be? Forever?", "Vanessa");
                    add_page("...", "Cassidy");
                    add_page("...Don't get me wrong, it's scary to move on. Change is frightening to anyone.", "Vanessa");
                    add_page("...But change is natural, too. Nothing stays the same forever. Friends, trends, customers... All of them come and go.", "Vanessa");
                    add_page("You can never be sure how things'll turn out...", "Vanessa");
                    add_page("...But you can be sure that if you stay where you are now, things will never get any better.", "Vanessa");
                    add_page("...", "Cassidy");
                    add_page("...You're right.", "Cassidy");
                    add_page("All these years I thought this was where I was happiest, but it's getting harder to believe that every day...", "Cassidy");
                    add_page("...And if that's how I feel, my friends must be...", "Cassidy");
                    add_page("...Hey, you want what's best for them too, right?", "Vanessa");
                    add_page("A-And the only way things can get better is if I...", "Cassidy");
                    add_page("...", "Cassidy");
                    add_page("I...I think it's...", "Cassidy");
                    break;
                
                case 3:
                    add_page("...Time is a scary thing.", "Fritz");
                    add_page("No matter what we do, time won't wait for us.", "Fritz");
                    add_page("Whether we're out in the yard, unaware of its presence, or watching it slowly tick away on the clock overhead...", "Fritz");
                    add_page("...Time will not stop.", "Fritz");
                    add_page("...So why should we?", "Fritz");
                    add_page("..Why should we sit in contempt, willing to let this idea of \"eternity\" frighten us?", "Fritz");
                    add_page("Why shouldn't we take action? Make time catch up with us?", "Fritz");
                    add_page("Complacency is tempting, yes, but could you just DREAM of what may come next?", "Fritz");
                    add_page("What if there's MORE on the other side? What if there's something NEW?", "Fritz");
                    add_page("...B-But...", "Cassidy");
                    add_page("...What if it's...what if it's just more suffering? What if it hurts?", "Cassidy");
                    add_page("Then we'll let it hurt. We'll let it TRY.", "Fritz");
                    add_page("We'll push beyond whatever waits for us, heads to the sky!", "Fritz");
                    add_page("You and I have survived more than death itself. I'd like to see it TRY and make us hurt!", "Fritz");
                    add_page("We've felt more than pain. We've felt pride. We've felt dread.", "Fritz");
                    add_page("And now, there's nothing left for you here...", "Fritz");
                    add_page("...But there's EVERYTHING beyond.", "Fritz");
                    add_page("No more dingy backrooms, no more greasy floors...and no more hideous nightguards!", "Fritz");
                    add_page("Seriously, talk about low standards! Have you SEEN the last guy they hired?", "Fritz");
                    add_page("...Hehe...", "Cassidy");
                    add_page("No, really! Have you seen that big red clown hair of his? His weirdo rat eyes? And the way he WALKS?", "Fritz");
                    add_page("...Heheh, an- and his shabby tie! And his grimy shirt!", "Cassidy");
                    add_page("Oh my god, has he even HEARD of a shower?", "Fritz");
                    add_page("Hehehahaha!", "Cassidy");
                    add_page("...Gosh, now I REALLY feel bad about trying to kill you.", "Cassidy");
                    add_page("Eh, so has everyone else in this building. I'm used to it.", "Fritz");
                    add_page("Now... You've got somewhere to be, don't you?", "Fritz");
                    add_page("...Haha, yeah...", "Cassidy");
                    add_page("It's...", "Cassidy");
                    break;
                
                default:
                    if (get_guard_property("new_cassidy_dialogue", false, global.Guard, true))
                    {
                        read_custom_dialogue("SPOILERS/dialogue/cutscene_Cassidy.txt", "DIALOGUE");
                    }
                    else
                    {
                        var Import = import_dialogue(global.Guard, "/SPOILERS/cutscenes/ending_dialogue.txt");
                        var NarratorName = "";
                        
                        if (string_lower(Import.FIRST_PERSON) == "true")
                            NarratorName = guard_name();
                        
                        for (var i = 0; i < array_length(Import.DIALOGUE); i++)
                            add_page(Import.DIALOGUE[i], no_brackets(NarratorName));
                        
                        add_page("...", "Cassidy");
                        add_page("...You're right.", "Cassidy");
                        add_page("It...it isn't right to keep them all down here.", "Cassidy");
                        add_page("It's...", "Cassidy");
                    }
                    
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_all();
                instance_destroy(oCassidyEndscene);
            };
            
            Delay[TextPageNumber] = 60;
            add_page("...It's time to go.", "");
            Delay[TextPageNumber] = 120;
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Delay[TextPageNumber] = 60;
            Skip[TextPageNumber] = true;
            add_page("", "");
            
            Function[TextPageNumber] = function()
            {
                global.FredbearMode = false;
                room_goto(EndingArgumentScene);
            };
            
            break;
        
        case "Microgame_Quiz":
            var Answers;
            
            switch (global.MicrogameLevel)
            {
                case 2:
                    add_page("How many microgames have you cleared?", "Fredbear");
                    Answers = array_shuffle([[string(oFredbearManager.MicrogameNumber), "Microgame_Win"], [string(oFredbearManager.MicrogameNumber - irandom_range(1, 5)), "Microgame_Fail"], [string(oFredbearManager.MicrogameNumber + irandom_range(-1, -3)), "Microgame_Fail"], [string(oFredbearManager.MicrogameNumber + (irandom_range(-4, -5) * random_sign())), "Microgame_Fail"]]);
                    break;
                
                case 1:
                    add_page("Spell my name!", "Fredbear");
                    Answers = array_shuffle([["Fredbear", "Microgame_Win"], ["Fridbear", "Microgame_Fail"], ["Freaddear", "Microgame_Fail"], ["Fredbare", "Microgame_Fail"]]);
                    break;
                
                case 0:
                    if (global.Night == "Custom")
                    {
                        add_page("Who are you fighting?", "Fredbear");
                        Answers = array_shuffle([["Fredbear", "Microgame_Win"], ["Nedd Bear", "Microgame_Fail"], ["Dreadbear", "Microgame_Fail"], ["Freddybear", "Microgame_Fail"]]);
                    }
                    else
                    {
                        add_page("Who are you playing as?", "Fredbear");
                        Answers = array_shuffle([["Jeremy", (global.Guard == 0) ? "Microgame_Win" : "Microgame_Fail"], ["Mike", (global.Guard == 1) ? "Microgame_Win" : "Microgame_Fail"], ["Vanessa", (global.Guard == 2) ? "Microgame_Win" : "Microgame_Fail"], ["Fritz", (global.Guard == 3) ? "Microgame_Win" : "Microgame_Fail"]]);
                        
                        if (global.Guard > 3)
                            Answers[irandom(3)] = [guard_nickname(), "Microgame_Win"];
                    }
                    
                    break;
            }
            
            add_option(Answers[0][0], Answers[0][1]);
            add_option(Answers[1][0], Answers[1][1]);
            add_option(Answers[2][0], Answers[2][1]);
            add_option(Answers[3][0], Answers[3][1]);
            break;
        
        case "Microgame_Win":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = true;
                audio_play_sound(sfxBitBoost, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("That's right, that's right!", "Fredbear");
            break;
        
        case "Microgame_Fail":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = false;
                audio_play_sound(sfxBitFail, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("WRONG, WRONG, WRONG!", "Fredbear");
            break;
        
        case "Microgame_Fail_0":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = false;
                audio_play_sound(sfxBitFail, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("WRONG! I don't have eyes!", "Fredbear");
            break;
        
        case "Microgame_Fail_1":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = false;
                audio_play_sound(sfxBitFail, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("WRONG! My bowtie's missing!", "Fredbear");
            break;
        
        case "Microgame_Fail_2":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = false;
                audio_play_sound(sfxBitFail, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("WRONG! I got no buttons!", "Fredbear");
            break;
        
        case "Microgame_Fail_3":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = false;
                audio_play_sound(sfxBitFail, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("WRONG! I've got no stars!", "Fredbear");
            break;
        
        case "Microgame_Found":
            Function[TextPageNumber] = function()
            {
                global.MicrogameWin = true;
                audio_play_sound(sfxBitBoost, 10, false);
                end_microgame();
            };
            
            Lock[TextPageNumber] = true;
            add_page("Haha, you found me!", "Fredbear");
            break;
        
        case "Fredbear_Cracked":
            Lock[TextPageNumber] = true;
            add_page("You got it!", "");
            break;
        
        case "RouteChoice":
            add_page("Then who will you go along with?", "");
            add_option("Help your boss", "ChoiceConfirm_Money");
            
            if (currently_good() && has_been_good())
                add_option("Help Michael", "ChoiceConfirm_Good");
            
            if (currently_evil() && has_been_evil())
                add_option("Help the rabbit", "ChoiceConfirm_Evil");
            
            break;
        
        case "ChoiceConfirm_Money":
            add_page("...Are you sure?", "");
            add_option("Yes", "Chosen_Money");
            add_option("No", "RouteChoice");
            break;
        
        case "ChoiceConfirm_Good":
            add_page("...Are you sure?", "");
            add_option("Yes", "Chosen_Good");
            add_option("No", "RouteChoice");
            break;
        
        case "ChoiceConfirm_Evil":
            add_page("...Are you sure?", "");
            add_option("Yes", "Chosen_Evil");
            add_option("No", "RouteChoice");
            break;
        
        case "Chosen_Money":
            add_page("...Your boss it is.", "");
            
            Function[TextPageNumber] = function()
            {
                global.Route = UnknownEnum.Value_1;
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Chosen_Good":
            add_page("...Michael it is.", "");
            
            Function[TextPageNumber] = function()
            {
                global.Route = UnknownEnum.Value_2;
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        case "Chosen_Evil":
            add_page("...The rabbit it is.", "");
            
            Function[TextPageNumber] = function()
            {
                global.Route = UnknownEnum.Value_3;
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        case "RouteChoice_Ultimate":
            add_page("Then who will you go along with?", "");
            add_option("Help Michael", "ChoiceConfirmUlt_Good");
            add_option("Help the rabbit", "ChoiceConfirmUlt_Evil");
            break;
        
        case "ChoiceConfirmUlt_Good":
            add_page("...Are you sure?", "");
            add_option("Yes", "UltSplit_Michael");
            add_option("No", "RouteChoice_Ultimate");
            break;
        
        case "ChoiceConfirmUlt_Evil":
            add_page("...Are you sure?", "");
            add_option("Yes", "UltSplit_Vanny");
            add_option("No", "RouteChoice_Ultimate");
            break;
        
        case "UltSplit_Michael":
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    SecondarySprite = sTalksprites_Vanny;
                    switch_chars(7, 1);
                }
            };
            
            add_page("Awww, WHAT!?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("You jerk! You lead me on this whole time just to turn me down like that!?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("Fine, you know what? This is FINE! I don't NEED you! I NEVER needed you!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 7;
            };
            
            add_page("AND I TAKE BACK ALL THE TIMES I FLIRTED WITH YOU, TOO!!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    sprite_index = sNOTHING;
                    Enter = false;
                }
                
                global.Route = UnknownEnum.Value_2;
                audio_sound_gain(musMidnight_MissingChild, 0, 1000);
            };
            
            add_page("...The white rabbit thumps her feet, before walking away dejectedly...", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 2;
                    image_index = sTalksprites_Michael;
                }
            };
            
            add_page("...Well, that was a bit more of a hassle than I would've liked...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("...But I'm glad you came to your senses.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("Now, we've quite a night ahead of us. First, I'll need to give you this.", "Hooded Man");
            add_page("Michael hands you...a portable game console?", "");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("Fortunately for both of us, all the pieces are already in place.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("If you'd be willing, I would like for you to come back here tomorrow night.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...I figure you might as well, seeing as you already went through the effort of collecting those masks for me.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("Just this once, don't let me down.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
            };
            
            add_page("...And the hooded man takes his leave as well.", "");
            add_page("...", "");
            add_page("...You feel as if you may have missed something along the way. Something that could've let you circumvent this altogether.", "");
            add_page("...", "");
            add_page("...But whatever that could've been, you suppose it's too late to worry about it now.", "");
            add_page("Better go get this over with.", "");
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_MissingChild);
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        case "UltSplit_Vanny":
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    SecondarySprite = sTalksprites_Vanny;
                    switch_chars(1, 1);
                }
            };
            
            add_page("Haha, I KNEW it! I knew you'd...", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("...Wait, seriously? Even after that whole story yesterday night...?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Oh well, I know better than to expect anything you do to make sense. I'll see you here tomorrow~!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    sprite_index = sNOTHING;
                    Enter = false;
                }
                
                global.Route = UnknownEnum.Value_3;
                audio_sound_gain(musMidnight_MissingChild, 0, 1000);
            };
            
            add_page("The white rabbit blows you a kiss, before skipping away...", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 4;
                    image_index = sTalksprites_Michael;
                }
            };
            
            add_page("...Well, to say I'm disappointed would be a bit of an understatement.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("I really was hoping something I said would get through to you.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("...But I suppose you'll need to learn this the hard way instead.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
            };
            
            add_page("...And the hooded man takes his leave as well.", "");
            add_page("...", "");
            add_page("...You feel as if you may have missed something along the way. Something that could've let you circumvent this altogether.", "");
            add_page("...", "");
            add_page("...But whatever that could've been, you suppose it's too late to worry about it now.", "");
            add_page("Better go get this over with.", "");
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_MissingChild);
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        default:
            break;
    }
    
    add_page("", "");
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_56 = 56,
    Value_58 = 58,
    Value_59
}
