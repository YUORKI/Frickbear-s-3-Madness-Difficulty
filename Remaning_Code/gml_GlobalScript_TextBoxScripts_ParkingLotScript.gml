function money_route_split(arg0, arg1)
{
    var MoneyOnly = !(arg0 || arg1);
    Delay[TextPageNumber] = 120;
    
    Function[TextPageNumber] = function()
    {
        audio_play_sound(sfxPhoneRing, 10, true);
    };
    
    switch (global.Guard)
    {
        case 0:
            add_page("...Oh?", "Jeremy");
            break;
        
        case 1:
            add_page("...You're kidding me.", "Mike");
            break;
        
        case 2:
            add_page("...It's the boss...again.", "Vanessa");
            break;
        
        case 3:
            add_page("...Ah.", "Fritz");
            break;
        
        default:
            add_page("...Seems like something else has come up.", "");
            break;
    }
    
    Function[TextPageNumber] = function()
    {
        audio_stop_sound(sfxPhoneRing);
        audio_play_sound(sfxPhonePickup, 10, false);
    };
    
    Delay[TextPageNumber] = 120;
    add_page("WAAAAAAAAAAHH!!", "The Boss");
    text_effect(0, 99, "Shake");
    
    Function[TextPageNumber] = function()
    {
        play_music(musMidnight_TheBoss, 0.25);
    };
    
    switch (global.Guard)
    {
        case 0:
            add_page("O-Oh, is everything alright?", "Jeremy");
            break;
        
        case 1:
            add_page("...Is, uh, is everything alright? (I'm not getting fired, am I?)", "Mike");
            break;
        
        case 2:
            add_page("Woah, hey, is everything alright?", "Vanessa");
            break;
        
        case 3:
            add_page("Such visceral rage! What's the occasion?", "Fritz");
            break;
    }
    
    if (global.Guard < 3)
    {
        add_page("NO! EVERYTHING IS NOT ALRIGHT!", "The Boss");
        text_effect(0, 2, "Shake");
        text_effect(18, 20, "Shake");
    }
    
    add_page("I've been SCAMMED! SWINDLED! HOODWINKED!", "The Boss");
    text_effect(10, 99, "Shake");
    add_page("When were you gonna tell me about these files, huh!?", "The Boss");
    
    switch (global.Guard)
    {
        case 0:
            add_page("F-Files?", "Jeremy");
            break;
        
        case 1:
            add_page("Files? Wait, what files?", "Mike");
            break;
        
        case 2:
            add_page("Wait...what files?", "Vanessa");
            break;
        
        case 3:
            add_page("I've got a lot of files. Which ones are you talking about?", "Fritz");
            break;
        
        default:
            add_page("...What!? Don't tell me you don't know what I'm talking about!", "The Boss");
    }
    
    add_page("The ones I found in your office, you stooge! I took a look through them, and as it turns out...", "The Boss");
    add_page("Those jerks who sold me the company were hiding MILLIONS in property RIGHT UNDER MY NOSE!", "The Boss");
    add_page("Look, you're the only chump I can trust with this, so shut your trap and listen up!", "The Boss");
    add_page("According to these files, there's a secret bunker out there in the middle of the woods.", "The Boss");
    add_page("And, more importantly...the place is stuffed to the brim with animatronics that could make me RRRRRRRICH!!", "The Boss");
    text_effect(94, 128, "Shake");
    
    if (MoneyOnly)
    {
        if (global.Guard == 3)
        {
            Skip[TextPageNumber] = true;
            add_page("I need you to crawl down there and", "The Boss");
            add_page("I'll do it.", "Fritz");
            add_page("Wow, that easy? I didn't even say what the job was yet!", "The Boss");
            add_page("...But hey, if you say so. Now MOVE IT! Time is money!", "The Boss");
        }
        else
        {
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, I suppose I could...though I also really just wanted to go home...", "Jeremy");
                    break;
                
                case 1:
                    add_page("I already worked my full week here. Can't you get someone else to do it?", "Mike");
                    break;
                
                case 2:
                    add_page("I don't know, I'm not super enthusiastic about going salvaging again...Is there anything in it for me?", "Vanessa");
                    break;
                
                default:
                    add_page("...What? You just wanna go home?.", "The Boss");
            }
            
            add_page("Grrr...FINE! I'll sweeten the deal.", "The Boss");
            add_page("If you do this for me, I'll take you out to a steakhouse I like. My treat!", "The Boss");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, that's a deal I can't turn down! I'll do it!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Alright, you know what, sure.", "Mike");
                    break;
                
                case 2:
                    add_page("Y'know what, it's a deal.", "Vanessa");
                    break;
                
                default:
                    add_page("...Huh? It's a deal?", "The Boss");
            }
            
            add_page("Wahaha, excellent! I knew I could count on you.", "The Boss");
            add_page("Now MOVE IT!! Time is money!", "The Boss");
            text_effect(4, 13, "Shake");
        }
    }
    else
    {
        add_page("...Oh, and if you do, I'll, uh...take you out to dinner or something. My treat!", "The Boss");
        add_page("I BETTER see you there!", "The Boss");
    }
    
    Delay[TextPageNumber] = 120;
    
    Function[TextPageNumber] = function()
    {
        audio_play_sound(sfxPhonePickup, 10, false);
        audio_stop_sound(musMidnight_TheBoss);
    };
    
    if (!MoneyOnly)
    {
        add_page("...Well, you can't do two things at once. You've got a choice to make here.", "");
        add_page("Who will you go along with?", "");
        add_option("Help the Boss", "ChoiceConfirm_Money");
        
        if (arg0)
            add_option("Help Michael", "ChoiceConfirm_Good");
        
        if (arg1)
            add_option("Help the Rabbit", "ChoiceConfirm_Evil");
        
        exit;
    }
    else
    {
        switch (global.Guard)
        {
            case 0:
                add_page("Ah well, what's another night when I've already worked five?", "Jeremy");
                add_page("I'm sure this'll be a piece of cake!", "Jeremy");
                break;
            
            case 1:
                add_page("...This had better be worth it.", "Mike");
                break;
            
            case 2:
                add_page("I've come this far, I guess I might as well see it through to the end...", "Vanessa");
                add_page("Time to investigate this bunker.", "Vanessa");
                break;
            
            case 3:
                add_page("...This is where I'm meant to be.", "Fritz");
                break;
            
            default:
                add_page("...Seems your work isn't over quite yet.", "");
                add_page("Time to see what awaits you in the Faz-bunker.", "");
                break;
        }
        
        Function[TextPageNumber] = function()
        {
            global.Route = UnknownEnum.Value_1;
            instance_create_depth(0, 0, 0, oTransitionMinigame);
        };
        
        exit;
    }
}

function game_text_midnight(arg0, arg1 = true)
{
    initialize();
    add_page("", "");
    
    if (arg1)
    {
        var SpoilerScenes = ["Midnight_Failed", "Midnight_Night2_Vanny", "Midnight_Night3_Vanny", "Midnight_Night4_Vanny", "Midnight_Night5_Vanny", "Midnight_Night2_Michael", "Midnight_Night3_Michael", "Midnight_Night4_Michael", "Midnight_Night5_Michael", "Midnight_Night5_Money", "Midnight_Night2_Ultimate", "Midnight_Night3_Ultimate", "Midnight_Night4_Ultimate", "Midnight_Night5_Ultimate"];
        var file = (array_contains(SpoilerScenes, arg0) ? "/SPOILERS" : "") + "/dialogue/cutscene_" + arg0 + ".txt";
        
        if (can_play_dialogue(file))
        {
            var Data = 
            {
                IsGood: currently_good(),
                IsEvil: currently_evil(),
                IsGoodOrEvil: currently_good() || currently_evil(),
                IsUltimate: currently_ultimate(),
                WasGood: has_been_good() && !currently_good(),
                WasEvil: has_been_evil() && !currently_evil(),
                WasUltimate: has_been_ultimate() && !(currently_good() || currently_evil()),
                HasTalbert: array_contains(global.Upgrades, UnknownEnum.Value_41)
            };
            read_custom_dialogue(file, "DIALOGUE", [], Data);
        }
        else
        {
            game_text_midnight(arg0, false);
            exit;
        }
        
        add_page("", "");
        exit;
    }
    
    switch (arg0)
    {
        case "Midnight_Night1":
            switch (global.Guard)
            {
                case 0:
                    add_page("Phew, what a night!", "Jeremy");
                    add_page("Those robots are definitely a lot scarier up close, heheh...", "Jeremy");
                    Skip[TextPageNumber] = true;
                    add_page("But all that's behind me now, and I can finally go back to-.", "Jeremy");
                    break;
                
                case 1:
                    add_page("Well, that's one shift down...", "Mike");
                    Skip[TextPageNumber] = true;
                    add_page("Now I can finally go home, kick back and-.", "Mike");
                    break;
                
                case 2:
                    add_page("Well, that wasn't so bad...", "Vanessa");
                    Skip[TextPageNumber] = true;
                    add_page("This place is a bit more claustrophobic than what I'm used to, but-.", "Vanessa");
                    break;
                
                case 3:
                    add_page("What...a....RUSH!", "Fritz");
                    add_page("Those animatronics, they're like something I've never seen! The movements, the intelligence, it's...simply fascinating!", "Fritz");
                    add_page("And the chance to see them face-to-face...oh, could this night get any better?", "Fritz");
                    break;
                
                default:
                    add_page("What a thrilling first night!", "");
                    Skip[TextPageNumber] = true;
                    add_page("Relieved that it's finally over, you decide to finally go home and enjoy some-.", "");
                    break;
            }
            
            Delay[TextPageNumber] = 120;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxPhoneRing, 10, true);
            };
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...Oh?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Great.", "Mike");
                    break;
                
                case 2:
                    add_page("...It's the boss.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Oh?", "Fritz");
                    break;
                
                default:
                    add_page("...Or maybe not.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(sfxPhoneRing);
                audio_play_sound(sfxPhonePickup, 10, false);
            };
            
            Delay[TextPageNumber] = 120;
            add_page("Ring ring! Hey, is this stupid thing on?", "The Boss");
            
            Function[TextPageNumber] = function()
            {
                play_music(musMidnight_TheBoss, 0.25);
            };
            
            add_page("Hey, stooge! Great work tonight or whatever.", "The Boss");
            add_page("Big news! Your good-for-nothing coworker isn't picking up his calls, so it looks like you get to work overtime!", "The Boss");
            
            if (global.Guard == 3)
            {
                add_page("Over....overtime?", "Fritz");
                Skip[TextPageNumber] = true;
                add_page("That's right, OVERTIME! Now move your butt before I-", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    audio_play_sound(sfxPhonePickup, 10, false);
                    audio_stop_sound(musMidnight_TheBoss);
                };
                
                add_page("The phone drops from your hand, and clatters as it hits the pavement.", "");
                add_page("Your hands are trembling.", "");
                add_page("Hey! Stooge! Can you hear me? Hellooooo?", "The Boss");
                add_page("...I'm the luckiest man alive.", "Fritz");
            }
            else
            {
                switch (global.Guard)
                {
                    case 0:
                        add_page("Overtime? Uh...sure, I guess I could do that! What do you need?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Overtime!? But I wasn't-", "Mike");
                        add_page("Bah, quit your whining! You're still getting paid for this, you know.", "The Boss");
                        break;
                    
                    case 2:
                        add_page("...That 'coworker' wouldn't happen to be the one I heard get crushed over the phone, would it?", "Vanessa");
                        add_page("Bah, that's none of your business! Just listen up and do what I say.", "The Boss");
                        break;
                    
                    case 3:
                        add_page("Ah, wonderful! I was hoping I'd get a chance to go back in and-", "Fritz");
                        add_page("NOT HERE, YOU IDIOT! I need you somewhere else!", "The Boss");
                        break;
                }
                
                add_page("Go to the address I sent you! Some chump will explain the rest when you get there.", "The Boss");
                add_page("Good luck or whatever!", "The Boss");
                
                switch (global.Guard)
                {
                    case 0:
                        Skip[TextPageNumber] = true;
                        add_page("You got it, boss! I'll let you know when I-", "Jeremy");
                        break;
                    
                    case 1:
                        Skip[TextPageNumber] = true;
                        add_page("Hey hey, wait, what about-", "Mike");
                        break;
                    
                    default:
                        break;
                }
                
                Delay[TextPageNumber] = 120;
                
                Function[TextPageNumber] = function()
                {
                    audio_play_sound(sfxPhonePickup, 10, false);
                    audio_stop_sound(musMidnight_TheBoss);
                };
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("...get there.", "Jeremy");
                        add_page("I wonder what he could need over there...", "Jeremy");
                        break;
                        add_page("Guess I'd better get a move on and find out!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...Guess I'm working overtime.", "Mike");
                        break;
                    
                    case 2:
                        add_page("This address seems to be another Freddy's location...", "Vanessa");
                        add_page("...Here's hoping it isn't any more dangerous than this one.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Somewhere else...", "Fritz");
                        add_page("...Wherever this leads me, I'm sure it will at least be interesting.", "Fritz");
                        break;
                    
                    default:
                        add_page("...Seems like your work isn't quite done yet.", "");
                        break;
                }
            }
            
            Function[TextPageNumber] = function()
            {
                if (global.Difficulty < 3)
                    array_push(global.AllTimeSalvages, UnknownEnum.Value_14);
                
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night2_Vanny":
            switch (global.Guard)
            {
                case 0:
                    add_page("And that's yet another shift down!", "Jeremy");
                    add_page("This place is a bit scary, but I think I'm finally getting the hang of things.", "Jeremy");
                    Skip[TextPageNumber] = true;
                    add_page("I just hope that's the last of the frights for tonight-.", "Jeremy");
                    break;
                
                case 1:
                    add_page("Shift two down...", "Mike");
                    add_page("Finally feels like I'm getting the hang of this.", "Mike");
                    Skip[TextPageNumber] = true;
                    add_page("Hopefully there won't be anymore surprises from here on-.", "Mike");
                    break;
                
                case 2:
                    add_page("Phew, another shift down...", "Vanessa");
                    add_page("An old place like this can only have so many new tricks. I should get used to things in no time.", "Vanessa");
                    Skip[TextPageNumber] = true;
                    add_page("In fact, now that I've seen all this location's animatronics, there shouldn't be any surprises from here on-.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Another shift down...", "");
                    add_page("You find yourself humming a tune as you walk out into the parking lot.", "");
                    Skip[TextPageNumber] = true;
                    add_page("Ships were made for sinking, whiskey made for drinking, if we were made of-.", "Fritz");
                    break;
                
                default:
                    add_page("Well, that's another night under your belt!", "");
                    add_page("Now that that's over, you'll finally able to-.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 1;
                    sprite_index = sTalksprites_Vanny;
                }
                
                play_music(musMidnight_Vanny, 1);
                audio_sound_gain(musMidnight_Vanny, 1, 0);
            };
            
            add_page("Ah, THERE you are~!", "White Rabbit");
            
            if (global.Guard == 3)
            {
                add_page("BAH!", "Fritz");
                text_effect(0, 4, "Shake");
                add_page("...Wait, no, that's not how the song goes.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Uh, AHEM.", "White Rabbit");
                add_page("Ah, yes, hello! Didn't see you there. Did you...need something?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Fuhuhu, oh, DO I! See, I've been keeping an eye on you for some time...but I was hoping I'd get to chat with you one-on-one.", "White Rabbit");
                add_page("...Keeping an eye on me? For how long?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("About 23 hours and 17 minutes.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 6;
                };
                
                add_page("And in that time, you've put on a SHOW! Seriously, watching you deal with that mechanized menagerie so effortlessly...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("It's frankly psychotic, which tells me you've got what it takes.", "White Rabbit");
                add_page("Oh, you're too kind!", "Fritz");
                add_page("Far too kind. She wants something from you.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("The way you were somehow able to tame Springtrap of all animatronics, too...I've never seen anything quite like it!", "White Rabbit");
                add_page("...Springtrap?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Uh, yeah. Surely someone as skilled at this as you are knows who that is, right...?", "White Rabbit");
                add_page("Ah, no! I'm actually rather new here, you see.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Seriously? But, wait...if you just started working here, how are you able to...y'know, do all that?", "White Rabbit");
                add_page("Oh, it's a cerebral condition, I'm pretty sure.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Ah. I see.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Well, WHATEVER it is...you getting your hands on Springtrap tells me you've got the eye of a collector!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("And while you found gold...you haven't yet struck oil.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Although, if you'd like to listen...I can change that. I can help you find the rest.", "White Rabbit");
                add_page("\"There's...more? More like him?\", you think to yourself.", "");
                add_page("This could be...revolutionary. A breakthrough. Quite possibly everything you ever could have wanted.", "");
                add_page("Where are they?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Woah, really? Just like that?", "White Rabbit");
                add_page("Do you really think I could turn down such an opportunity? Just point me to them, and I'll get them.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...Uh, okay, wow, alright! I guess I was right about you after all!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Just keep an eye out at the next couple abandoned locations your boss sends you to. If anything looks particularly valuable, bring it to me.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("I look forward to seeing what you drag back with you tomorrow! Mweeheehee...", "White Rabbit");
            }
            else
            {
                switch (global.Guard)
                {
                    case 0:
                        add_page("EEK!", "Jeremy");
                        add_page("Ha...phew...", "Jeremy");
                        add_page("Sorry about that ma'am, you sure surprised me! How can I help you?", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("Mweeheehee! How can you help me? What a silly question!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...I think you and I both know EXACTLY what I'm here for.", "White Rabbit");
                        add_page("Uh...are...costumed performer auditions today? That's not really my...", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("AUGH!", "Mike");
                        text_effect(0, 5, "Shake");
                        add_page("W-What the hell is your problem!?", "Mike");
                        text_effect(0, 33, "Shake");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Awww, is that really any way to greet a fellow fan?", "White Rabbit");
                        add_page("Fellow...fan?", "Mike");
                        break;
                    
                    case 2:
                        add_page("...", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("...Sheesh, really giving me the silent treatment, huh? Some way to treat a fellow fan...", "White Rabbit");
                        add_page("...Leave. Now.", "Vanessa");
                        add_page("I know who you are. You're not welcome here.", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Aww, what a buzzkill! I had a whole spiel prepared and everything...", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("...But somethin' tells me you don't need persuading anyway. Mweeheehee...", "White Rabbit");
                        add_page("What are you implying?", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("What do you THINK I'm implying?", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("You and I both know exactly who you went out of your way to salvage last night, after all~...", "White Rabbit");
                        add_page("...", "Vanessa");
                        add_page("...I said leave.", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Alright, alright, I'll get out of your hair...", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("I'm sure we'll be crossing paths again soon anyway. Teehee...", "White Rabbit");
                        break;
                    
                    default:
                        add_page("Oh, I was looking ALL OVER for you! I never thought I'd find a fellow fan!", "White Rabbit");
                        add_page("...Huh? What's that look for?", "White Rabbit");
                }
                
                if (global.Guard != 2)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("C'mon, you aren't fooling me, Mr. Just-So-Happened-To-Salvage-The-One-And-Only-Springtrap-Last-Night!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("Nobody takes someone like HIM home with them unless they know exactly who he is.", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("...Springtrap? Uh, is that...the red one?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("...Springtrap? What the hell are you talking about?", "Mike");
                            
                            Function[TextPageNumber] = function()
                            {
                                with (oTalksprite)
                                    Image = 3;
                            };
                            
                            add_page("You knooooow...the yellow rabbit? The spring bunny?", "White Rabbit");
                            add_page("That...raggedy old green thing?", "Mike");
                            add_page("I just thought I could sell it off for parts, it didn't strike me as...valuable.", "Mike");
                            break;
                        
                        default:
                            add_page("...Not ringing a bell, huh?", "White Rabbit");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page("...Wooow. You really DON'T know what you've got on your hands here, huh?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("...Teehee.", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Uh...ARE you a performer here? Because if you need to get in for your shift, I could...", "Jeremy");
                            
                            Function[TextPageNumber] = function()
                            {
                                with (oTalksprite)
                                    Image = 0;
                            };
                            
                            add_page("Haha, nope! Not one bit!", "White Rabbit");
                            add_page("...Then, uh...what are you, exactly?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("Who the hell are you, anyway? ...WHAT the hell are you?", "Mike");
                            break;
                        
                        default:
                            add_page("Well, then allow me to introduce myself! You see, I'm a...uh...", "White Rabbit");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page((global.Guard > 3) ? "...A collector!" : "Oh, I dunno...I guess you could call me a collector!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("Yeah...a collector. I'm a big fan of Freddy's memoribilia, and as for the animatronics...", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Heehee...well...I'm a PARTICULARLY big fan of them~!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("That grungy old rabbit you salvaged from the backroom last night? He's actually quite the collector's item! Real one-of-a-kind stuff.", "White Rabbit");
                            add_page("Ah, I see!", "Jeremy");
                            add_page("(Sheesh, talk about one man's trash being another man's treasure! Er...another rabbit's treasure?)", "Jeremy");
                            add_page("Were you interested in buying it? The company doesn't seem to want it all that much anyway...", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("That 'raggedy old green thing' you salvaged is actually quite the collector's item! Real one-of-a-kind stuff right there.", "White Rabbit");
                            add_page("So you want to...what, buy it off me?", "Mike");
                            break;
                        
                        default:
                            add_page("That 'raggedy old green thing' you salvaged is actually quite the collector's item! Real one-of-a-kind stuff right there.", "White Rabbit");
                            add_page("...Huh? Do I want to buy him off you?", "White Rabbit");
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("Yes! ...But not yet.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("See, as a...collector...just one animatronic isn't enough for me. I need the whole set.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Ol' Springy's just the first...there's four in total!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("The rest are gonna be just as well-hidden, but you should find 'em all at the other Freddy's locations.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page("...If you plan on visiting them like you did last night, at least.", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Right, sounds like a solid deal to me! Uh...", "Jeremy");
                            add_page("...How much would you be paying, anyway?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("...", "Mike");
                            add_page("...How much are you paying?", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page((global.Guard > 3) ? "Oh, and the reward? We can discuss that AFTER you have all four of them." : "Oh, we can discuss your reward AFTER you have all four of them!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("I just wanna make sure you're as dedicated to this as I am.", "White Rabbit");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Until then, I'll see ya around, cutie~!", "White Rabbit");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Vanny, 0, 1000);
            };
            
            add_page("...And, just as suddenly as she appeared, the mysterious white rabbit disappeared into the darkness.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, she seemed nice!", "Jeremy");
                    add_page("An extra chunk of change definitely would be nice too...", "Jeremy");
                    add_page("...But my paycheck comes first! Looks like it's time to go salvaging.", "Jeremy");
                    break;
                
                case 1:
                    add_page("...'Cutie'?", "Mike");
                    add_page("What a weirdo...although if she's willing to pay...", "Mike");
                    add_page("...I guess I'll have plenty of time to think about it.", "Mike");
                    add_page("For now, though...I have a job to do.", "Mike");
                    break;
                
                case 2:
                    add_page("...", "Vanessa");
                    add_page("...I can't let it get to me. I have a job to do.", "Vanessa");
                    break;
                
                case 3:
                    add_page("With her gone, you're left to ruminate on your decision.", "");
                    add_page("Surely she wants something out of this transaction...", "");
                    add_page("...And you know nobody would want such articulate machines just for the sake of collecting them.", "");
                    add_page("What could it be that she wants? What could these animatronics truly entail? Does she know how dumb she looks in that costume?", "");
                    add_page("And, most importantly...", "");
                    add_page("...How could you resist such an offer?", "");
                
                default:
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night3_Vanny":
            switch (global.Guard)
            {
                case 0:
                    add_page("...Oh! Looks like I have company again!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Great. Her.", "Mike");
                    break;
                
                case 2:
                    add_page("(...You gotta be kidding me.)", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Ah! Her again.", "Fritz");
                    break;
                
                default:
                    add_page("Looks like you've got company again.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 1;
                    sprite_index = sTalksprites_Vanny;
                }
                
                play_music(musMidnight_Vanny, 1);
                audio_sound_gain(musMidnight_Vanny, 1, 0);
            };
            
            add_page("Well, well, well! Look at you, you little lunatic! You actually pulled through!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("Mweeheehee, I was honestly expecting you to flake on me... I guess you must be some sorta masochist, huh?", "White Rabbit");
            
            if (global.Guard == 3)
            {
                add_page("Hm? Oh! OH! No, no. Not a masochist. It's a cerebral thing.", "Fritz");
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Ah, of course! Anyway, now that", "White Rabbit");
                add_page("Blunt force trauma. I tried starting an animatronic fighting ring right after my shift yesterday.", "Fritz");
                add_page("Didn't work out. Did NOT work out.", "Fritz");
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...You did", "White Rabbit");
                add_page("So much oil. Not motor oil, mind you - OLIVE oil.", "Fritz");
                add_page("See, we would lather the animatronics to prevent any foul play. Head to toe, mech to suit. ...Sorry, endoskeleton.", "Fritz");
                add_page("I don't know why they use that term. Techncially it's incorrect.", "Fritz");
                add_page("But when BB's on the top rope and Foxy's seconds from that Pirate's Cove in the sky, you don't really worry about stuff like that, y'know?", "Fritz");
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("How did you even", "White Rabbit");
                add_page("Anyways, we - I keep saying we, but it was actually just myself. See, I needed a referee, but nobody responded to my recruitment posters.", "Fritz");
                add_page("Decided to just do the job myself, seeing as I was the only one who knew the rules...and how to resuscitate a mechanized mammal.", "Fritz");
                Skip[TextPageNumber] = true;
                add_page("It was a grudge match between Chica and a cupcake plush I taped onto my cousin's fancy vacuum. She went for the piledriver. but she-", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Okay, okay, hang on.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...You found Lefty, right? The black bear one?", "White Rabbit");
                add_page("Oh? Oh, yep. It's up in the vents somewhere.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Ah, alright! That's all I needed to hear.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Well, I hate to leave so soon, but I have, uh...stuff! Stuff I need to attend to!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...So I'll see you around.", "White Rabbit");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Don't worry, don't worry... I like that about you.", "White Rabbit");
                
                if (global.Guard == 2)
                {
                    add_page("...", "Vanessa");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("What's with that look? We're on the same page here, aren't we?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("If you really hated me that much, I doubt you'd be going along with my plan.", "White Rabbit");
                    add_page("...Just go away.", "Vanessa");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("Jeez, you're such a sourpuss, you know that?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("Oh well, you can be that way now...but I know you'll come around.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("...So I guess I'll see you then, sweetheart~!", "White Rabbit");
                }
                else
                {
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Heheh, well, that's certainly a funny way to describe it! My parents like to call me tenacious.", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("I mean... The robots aren't THAT hard to deal with. It's not like I've gotten hurt here.", "Mike");
                            add_page("(Well, unless that papercut I got two nights ago counts...)", "Mike");
                            break;
                    }
                    
                    if (global.Guard < 3)
                    {
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Oh, it's not just that, no. I'm more referring to everything else that's gone on here!", "White Rabbit");
                    }
                    else
                    {
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("What's with that look? Surely you know what you're getting yourself into here, right?", "White Rabbit");
                    }
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Like... During the day time?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("Everything else? Wait, like what?", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("...Oh. Right. I forgot you were new here.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("Y'know, you REALLY should do more research before working with someone...I know I have!", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Well...YOU could teach me, right?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("Well, if you know so much about this place...why don't YOU tell me?", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page((global.Guard < 3) ? "Oh, I'd LOVE to!" : "And as much as I'd love to teach you about it myself...", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page((global.Guard < 3) ? "...It'll have to wait for tomorrow, though." : "...It'll have to wait for tomorrow.", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 3;
                    };
                    
                    add_page("After all, we both have work to do, don't we?", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Oh, I have time! You don't need to keep it a secret!", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("You love keeping me in the dark, huh?", "Mike");
                            break;
                    }
                    
                    if (global.Guard < 3)
                    {
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Oh, I wouldn't call it that...I like to think of it more like a surprise!", "White Rabbit");
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Carrot-and-stick, my friend! What fun is a task if you don't have a prize waiting for you at the end?", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("(Carrots, huh? Well, she IS a rabbit...)", "Jeremy");
                            add_page("...Though, wait, doesn't that saying imply some sort of punishment if I fail...?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("If that's the carrot...what's the stick?", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page((global.Guard > 3) ? "...Huh? What's the stick?" : "...Huh?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page(string("...Oh, {0}! I think I just used the wrong saying there, mweehee...", (global.Guard == 1) ? "nothing, nothing" : "no, no"), "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Either way, I'll see you tomorrow. Don't let me down~!", "White Rabbit");
                }
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Vanny, 0, 1000);
            };
            
            add_page("And so, the white rabbit disappeared into the darkness yet again.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...", "Jeremy");
                    add_page("...What DID she mean by that?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...", "Mike");
                    add_page("...Whatever, man.", "Mike");
                    break;
                
                case 2:
                    add_page("...", "Vanessa");
                    add_page("...Right. I have a job to do.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Not everyone's prepared for Freddy's Tuesday Afternoon Beatdown.", "Fritz");
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night4_Vanny":
            add_page("Can you guess who it is?", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 1;
                    sprite_index = sTalksprites_Vanny;
                }
                
                play_music(musMidnight_Vanny, 1);
                audio_sound_gain(musMidnight_Vanny, 1, 0);
            };
            
            add_page("Third verse, same as the first! I'm so happy, I could burst!", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...Uh, yeah! I, uh, brought you another one of those robots you wanted!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Right. Uhh, here's that...clown thing you wanted.", "Mike");
                    break;
                
                case 3:
                    add_page("After all, things could have gone worse. I could be leaving here in a hearse!", "Fritz");
                    break;
            }
            
            if (global.Guard == 3)
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Yeah, no, don't rhyme. That's MY thing, sweetie.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Anywhooo~, GREAT work so far! You've been hauling these little delights into my plush mittens like it's nothing!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...You didn't need to bring it back outside with you, though.", "White Rabbit");
                add_page("Indeed, Scrap Baby is stood right behind you as you have this conversation.", "");
                add_page("Ah! My apologies. I figured I'd need to show proof of my efforts.", "Fritz");
                add_page("Either way, it's...quite interesting, isn't it?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Interesting? Interesting how?", "White Rabbit");
                add_page("Well, I'd generally consider myself well-versed in this company's design choices, but...", "Fritz");
                add_page("...This clown. This clown is something I've NEVER seen.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Oh, believe me, barely ANYONE has. You can consider yourself lucky in that regard!", "White Rabbit");
                add_page("You fiddle with the animatronic's exterior, careful not to prick your fingers on any of its many stray wires.", "");
                add_page("Unmistakably Fazbear crafted, or at least a subsidiary...these design choices were something only they would be bold enough to make.", "Fritz");
                add_page("The decision to ditch the rubber masks was a risky one. Could've lead to much higher repair costs if things happened to go south...", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Gosh, you really did your homework, huh?", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    instance_create_depth(x, y, oTextBox.depth + 2, oFadeMachine);
                    FadeSeconds = 4;
                };
                
                add_page("...But you're not listening.", "");
                add_page("You give the animatronic's wheels a quick flick, but they do not spin...", "");
                add_page("You run the design through your head a thousand times, trying to decipher what it was intended to be, before realizing...", "");
                add_page("...Nothing fits.", "");
                add_page("The wiring isn't just frayed - it's out of place entirely. Desperately holding together an endoskeleton to which it does not belong.", "");
                add_page("Who put this thing together? Why was it where you found it? ...How does SHE know about it?", "");
                add_page("But before you can speak up to ask...", "");
                Delay[TextPageNumber] = 120;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        instance_destroy();
                    
                    audio_sound_gain(musMidnight_Vanny, 0, 1000);
                    
                    with (oFadeMachine)
                    {
                        Alpha = 2;
                        FadeSeconds = -1;
                    }
                };
                
                add_page("...She's already gone.", "");
                add_page("...And you cannot wait for tomorrow.", "");
            }
            else if (global.Guard == 2)
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...You know, I gotta say, for as much as you act like you hate me, you sure seem to like going along with my plan...", "White Rabbit");
                add_page("I just know these things are safer in my hands than they would be in yours.", "Vanessa");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Oh, sure, suuuuure...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("...If you even have half an idea of what these things are.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("But hey, you're the expert right? Working here as long as you have...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("...Having the connections you do.", "White Rabbit");
                add_page("...", "Vanessa");
                add_page("...You know what?", "Vanessa");
                add_page("Fine. I'll give you what you want.", "Vanessa");
                add_page("I'll find the fourth one, and I'll bring it right here.", "Vanessa");
                add_page("And once you finally get what you want, only for it to all blow up in your face...you'd better not show your face here ever again.", "Vanessa");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Ohh, so it's a bet, huh?", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Heehee, now that's MY kind of fun!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("You know, maybe you aren't so bad after all, Vanessa! Suppose we'll be seeing each other tomorrow then, huh?", "White Rabbit");
            }
            else
            {
                if (global.Guard > 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("So you finally found the clown, huh? I was wondering where she could've wandered off to...", "White Rabbit");
                }
                else
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("Ohh, so THAT'S where she was hiding!", "White Rabbit");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Heehee, well, I'm sure she'll be happy to be back with family now!", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Huh, yeah! I guess being part of a collection is like being part of a family, isn't it?", "Jeremy");
                        add_page("...Oh, right! So, did you wanna tell me about these guys?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...Right.", "Mike");
                        add_page("So, about what you said last night...", "Mike");
                        break;
                }
                
                if (global.Guard > 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("...Eh? What was that?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("...Ooh, RIGHT, right! I did say I'd tell you about these things, didn't I?", "White Rabbit");
                }
                else
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("Eh?", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("These robots you're collecting, remember? You seemed pretty eager to tell me about them last night!", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("The animatronics, you...said you wanted to talk about them.", "Mike");
                            add_page("And, y'know, what made these ones in particular so special.", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("Ooh, THAT! Of course, of course! I did promise you, didn't I?", "White Rabbit");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("And, haha...someone would have to be a real JERK to break a promise, wouldn't they?", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...So, uh...which one did you wanna learn about?", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Well, that black bear one came with some notes, and the clown said she'd tell me herself, so...", "Jeremy");
                        add_page("How about the first one? Spring...uh...the green one? You seem to be enthusiastic about him!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Well, I guess I wanna know what's up with the rabbit one.", "Mike");
                        add_page("The thing stinks to high heaven, and the way it looks at me is...different from the others. Creepier.", "Mike");
                        add_page("...And yet, he seems to be your favorite.", "Mike");
                        break;
                }
                
                if (global.Guard > 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page("...", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...Well, if you aren't gonna speak up, I guess I'll just talk about Springtrap.", "White Rabbit");
                }
                else
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Well, well, don't you know me well? You couldn't have picked a better one to ask about!", "White Rabbit");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 6;
                };
                
                add_page("The other two have been through a lot, but Springtrap? Hoo BOY, Springtrap, he's seen it ALL!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("He's half the duo that started this whole company! Always a sideshow...but boy, what a sideshow it was!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("He might not have been the face of the place, but real Fazbear aficionados like me know the truth...he was the REAL backbone of all of this.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 6;
                };
                
                add_page("Nobody put things into action like he did! Knew things like he did! Reshaped the world to his very own like he did!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Ahhh, he's so dreamy...", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Gosh, for such an old robot, you sure seem to like him!", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...Oh, of course, of course! A robot, yeah...", "White Rabbit");
                        break;
                    
                    case 1:
                        add_page("...Uh, this is an animatronic we're talking about here, right?", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...Oh, of course, of course! An animatronic, yeah...", "White Rabbit");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 5;
                        };
                        
                        add_page("...Oh, don't worry, I know that's kind of a weird thing to say. After all, he's just an animatronic...", "White Rabbit");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Though, personally...I like to think of him as a LOT more than that.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("It's really a shame though, isn't it? He spent so long in the big guy's shadow, he never got a chance to shine...", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("...Oh, of course! He was part of a duo, wasn't he?", "Jeremy");
                        add_page("The \"big guy\"...Is that the last robot I'm looking for?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("The big guy, huh?", "Mike");
                        add_page("You said he was part of a duo...is that the last one you wanted for your collection?", "Mike");
                        break;
                }
                
                if (global.Guard <= 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("Oh, pfft, nah. Nobody knows what happened to that one. Not even me!", "White Rabbit");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("HE'S not the important one here, though...mweeheehee...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Anyway, have I talked your ear off enough now? Don't forget, you still have one more to find!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Just one more, and it'll alllll come together...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...So I hope you're looking forward to tomorrow as much as I am! Mwwwwwah!", "White Rabbit");
            }
            
            if (global.Guard != 3)
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Enter = false;
                    
                    audio_sound_gain(musMidnight_Vanny, 0, 1000);
                };
                
                add_page("And so, the white rabbit disappeared into the darkness yet again.", "");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Wow, she really knows her stuff...", "Jeremy");
                        add_page("It seems these poor robots have had it rough for a while! I can see why she'd want them to all be together again.", "Jeremy");
                        add_page("Well, what am I waiting for? It's time to bring this family back together!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("A chance to shine...", "Mike");
                        add_page("...Is THAT why she wants me to collect these guys? To give them another chance in the spotlight?", "Mike");
                        add_page("I guess that's...more reasonable than what I had in mind.", "Mike");
                        add_page("...Maybe she isn't so bad after all...?", "Mike");
                        break;
                    
                    case 2:
                        add_page("...", "Vanessa");
                        add_page("...Only one more night.", "Vanessa");
                        break;
                    
                    default:
                        add_page("Only one left...and yet you still don't feel any closer to finding out what she's really planning here.", "");
                        add_page("...Though you suppose there's only one way to find out.", "");
                        break;
                }
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night5_Vanny":
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 0;
                    sprite_index = sTalksprites_Vanny;
                }
                
                play_music(musMidnight_Vanny, 1);
                audio_sound_gain(musMidnight_Vanny, 1, 0);
                global.Route = UnknownEnum.Value_3;
            };
            
            add_page("...Oh, you beautiful, BEAUTIFUL little thing, you!", "White Rabbit");
            
            if (global.Guard == 3)
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("You're...still not dead, huh?", "White Rabbit");
                add_page("Of course not! I make it my life's purpose to not die.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Riiiiight.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Anywho~, lemme hear the good news! I hear you dragged something REAL nice back with you last night!", "White Rabbit");
                add_page("Oh, that I did! Four of a kind, and what a suit...", "Fritz");
                add_page("...This one was a bit more talkative than the others, you know.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Haha, well, I suppose that's to be expected out of THAT one...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Just don't listen to too much of what he says, alright? After all, you SHOULD be saving that energy for ME!", "White Rabbit");
                add_page("I couldn't have even if I wanted to! Its three voices kept talking over one another!", "Fritz");
                add_page("Though I'm still curious about the choice of locale...", "Fritz");
                add_page("These things were made for entertainment, and yet so much about their design continues to baffle me...", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Hey, don't get TOO interested. Remember, you're handing these things over to me!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...What's with your interest, anyway? I thought you only learned about these things once you started working here.", "White Rabbit");
                add_page("...Hm? Oh, well, that IS true, but these machines, they're...", "Fritz");
                add_page("...Erm, incredibly weird-looking! Yes, the engineers must've been on quite the bender to design these things.", "Fritz");
                add_page("Oh, what I wouldn't give to meet just one of the minds behind these machines!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Heh. Right.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Say, I can't let you leave here empty-handed! You still need your reward!", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Meet me right here, same time, same place tomorrow. Something tells me you're gonna love it!", "White Rabbit");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("You really got them...ALL of them...", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Oh, I'm so happy, I could KISS you!", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("O-Oh, that won't be necessary! I do appreciate the thought, though!", "Jeremy");
                        add_page("Well, now that the gang's all back together...how about that reward?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Please don't.", "Mike");
                        add_page("...Anyway, I held up my end. Now about that reward...", "Mike");
                        break;
                }
                
                if (global.Guard == 2)
                {
                    add_page("Let me make one thing clear: We are NOT working together.", "Vanessa");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("Oh, give it up already! You do exactly what I want you to, and you still act like we're not on the same page here...?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...But hey, what does it really matter, huh? I got what I need, so what am I complaining about?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("...You wouldn't happen to be available tomorrow night, would you? I did have a bit of a reward for you.", "White Rabbit");
                    add_page("Oh, I'm available.", "Vanessa");
                    add_page("You and me are gonna end this right here, tomorrow night, 12 AM.", "Vanessa");
                    add_page("I know exactly what you're going to do...and I know exactly how it's gonna go.", "Vanessa");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Oh, perfect, perfect! It's a date, then!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...And something tells me it'll be a date to die for.", "White Rabbit");
                }
                else
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page((global.Guard > 3) ? "...Huh? Your reward?" : "...Reward?", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("OH, right! Teehee, I nearly forgot!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 6;
                    };
                    
                    add_page("Yes, yes...I've got all the pieces I need now...I should be able to get it together for you in no time!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...If you can give me a day.", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Huh? Oh, yeah, I suppose you wouldn't wanna bring cash until you knew I'd seal the deal, huh?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("Is it...not just cash?", "Mike");
                            add_page("(Damn, I knew going through with this was a bad idea...)", "Mike");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page((global.Guard > 3) ? "Aww, don't give me that look! I promise, the wait'll be MORE than worth it!" : "Cash? Fahaha, don't make me laugh! It's something WAY better than that!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 6;
                    };
                    
                    add_page("Once you get it, you'll feel like your whole life has been leading up to it! It's...it's priceless!", "White Rabbit");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("I'd even go as far to say it's to DIE for!", "White Rabbit");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("To...d-die for?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("...I'm not gonna show up tomorrow if you word it like that.", "Mike");
                            break;
                    }
                    
                    if (global.Guard <= 3)
                    {
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Oh, calm down, it's only a joke...", "White Rabbit");
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("Really though, come back here tomorrow, 12 AM. You will NOT wanna miss what I have for you.", "White Rabbit");
                }
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Vanny, 0, 1000);
            };
            
            add_page("And so, the white rabbit disappeared into the darkness...for what may be the final time.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("She really could've clarified what the reward was before I went through with all of this...", "Jeremy");
                    add_page("...But at the end of the day, I suppose a reward IS still a reward. I wonder what it could be...?", "Jeremy");
                    add_page("Well, what am I waiting for? It's time to bring this family back together!", "Jeremy");
                    break;
                
                case 1:
                    add_page("The restaurant isn't even open tomorrow...", "Mike");
                    add_page("...But I guess I didn't get this far just to give up at the last minute.", "Mike");
                    add_page("...Let's see how this goes.", "Mike");
                    break;
                
                case 2:
                    add_page("...It'll be to die for, alright.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Well, I'd be a fool to stop now.", "Fritz");
                    break;
                
                default:
                    add_page("...Well, you've already got this far.", "");
                    add_page("Time to see this thing through to the end.", "");
                    break;
            }
            
            if (array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                money_route_split(false, true);
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        case "Midnight_Night2_Michael":
            switch (global.Guard)
            {
                case 0:
                    add_page("...Oh! Looks like somebody's outside.", "Jeremy");
                    break;
                
                case 1:
                    add_page("...It seems someone's outside.", "Mike");
                    break;
                
                case 2:
                    add_page("...Someone's been waiting for me, it seems.", "Vanessa");
                    break;
                
                case 3:
                    add_page("The thrill of survival is indescribable.", "");
                    add_page("And as you joyfully prance towards the exit, bidding a fond farewell to your robotic friends...", "");
                    add_page("...You notice that someone has been waiting for you.", "");
                
                default:
                    add_page("...You notice that someone has been waiting for you.", "");
            }
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 1;
                
                play_music(musMidnight_Michael, 1);
                audio_sound_gain(musMidnight_Michael, 1, 0);
            };
            
            if (global.Guard == 3)
            {
                add_page("Pardon me, but you wouldn't happen to...", "Hooded Man");
                add_page("He looks you up and down. He seems...surprised by your appearance.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...Are you the night watchman here?", "Hooded Man");
                add_page("That I am! If you're looking to rob us, they keep the safe back in-", "Fritz");
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Oh, no no, nothing of that sort.", "Hooded Man");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("My name is Michael, and if you'll pardon my forwardness...", "Michael");
                add_page("He reaches under the rim of his jacket, and out comes a Freddy mask.", "");
                add_page("...The same Freddy mask you had pried from the puppet's hands the night prior.", "");
                add_page("And here I was thinking you weren't interested in burglary.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Well...I wouldn't call it burglary. I simply wish to return these masks to their rightful place.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...Which is why I wanted to enlist your help. To collect the rest of them.", "Michael");
                add_page("Right... Well, I've got a few questions first, if you'll indulge me.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Fire away.", "Michael");
                add_page("First, how'd you get in?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("The doors are locked. The vents are not.", "Michael");
                add_page("Don't make it a habit, the animatronics are starting to crawl amongst the rats.", "Fritz");
                add_page("Second, why can't you just pickpocket the rest of the masks yourself?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Good question, though it's one with a...complicated answer.", "Michael");
                add_page("Fair enough, it's more of a filler question. Third, do you think I look good in gray?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...I'm sorry?", "Michael");
                add_page("A man of your purple-ish pigment must know a thing or two about color theory, hm?", "Fritz");
                add_page("I think I pull it off quite well. The black accents are nothing to scoff at!", "Fritz");
                add_page("You do a little twirl to show off your uniform.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Uh, yes, it's...distinguished.", "Michael");
                add_page("Perfect! Now then, where can I find the rest of those masks?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Wait, you're agreeing to help me? Just like that?", "Michael");
                add_page("Michael, my friend! You've approached me with a cryptic offer after breaking into my place of work.", "Fritz");
                add_page("Following this, you entertained my on-a-whim questions without a second thought.", "Fritz");
                add_page("I, frankly, would be a fool to ignore this call to action.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...I do feel I should be grateful, and yet...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...Nevermind. Now, about the mask.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("There are three more. You should find them in a similar manner to this one.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("If you follow these steps, and bring the masks back to me, then...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Well, I've only my thanks to offer, unfortunately...but something tells me you're not interested in material rewards.", "Michael");
                add_page("You spin on your heel, giggling to yourself a little bit.", "");
                add_page("Sounds like a plan. Let's rendezvous again tomorrow!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Yes...tomorrow.", "Michael");
            }
            else
            {
                add_page("Pardon me, but...you ARE the night watchman at this location, yes?", "Hooded Man");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("(Sheesh, this guy looks like he's been roughed up real bad! ...Though I suppose I'm not one to judge.)", "Jeremy");
                        add_page("Yep, that's me! And you are?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("(What's with this guy? He...doesn't look right.)", "Mike");
                        add_page("...And you are?", "Mike");
                        break;
                    
                    case 2:
                        add_page("(...Normally I'd be more disturbed by meeting an apparent zombie outside my place of work, but...)", "Vanessa");
                        add_page("(...Well, this seems pretty par for the course for Freddy's.)", "Vanessa");
                        add_page("...Uh, yeah, that's me. Do I...know you?", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Ah, where are my manners?", "Hooded Man");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("My name is Michael. Nice to meet you.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Jeremy! It's a pleasure!", "Jeremy");
                        add_page("(For as scary-looking as he is, he's at least got good manners!)", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("(Heh, another Mike.)", "Mike");
                        add_page("Uh...likewise.", "Mike");
                        break;
                    
                    case 2:
                        add_page("(Michael...Something about that name rings a bell.)", "Vanessa");
                        add_page("Right, of course. Vanessa Shelley.", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Pardon my sudden appearance, it's just that...there was something I wished to ask of you.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Well, whatever you need, I'd be happy to help! What's up?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Listen man, if you're looking for money, you're asking the wrong guy. My wage isn't exactly competitive.", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("Oh no, no no, nothing like that! It's, well...", "Michael");
                        break;
                    
                    case 2:
                        add_page("...I'm listening.", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Do you recognize this?", "Michael");
                add_page("Out from his dingy sweater, Michael presents something familiar...", "");
                add_page("...It's that Freddy mask you pried from the puppet's hands last night!", "");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Oh! I didn't know you had one of those too!", "Jeremy");
                        add_page("Pretty cool, huh? I found one myself last night!", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...Yes, I know. This IS the one you found last night.", "Michael");
                        add_page("...Oh! Neat!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Oh hey, yeah! That's...", "Mike");
                        add_page("...Wait, how the hell did you get that? I could've sworn it was in the...", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I would've thought even you newer hires would at least remember to keep the entrances locked...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("Or did your training go with the rest of the budget cuts?", "Michael");
                        add_page("...", "Mike");
                        break;
                    
                    case 2:
                        add_page("...How, exactly, did you get that?", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I would've thought you of all people would remember to keep the entrances locked...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("Or have you been working here so long that you're starting to become careless?", "Michael");
                        add_page("But, I thought for sure I...", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...Haha, just kidding. I actually snuck in through one of the vents.", "Michael");
                        add_page("...", "Vanessa");
                        break;
                }
                
                if (global.Guard <= 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("...Regardless.", "Michael");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("I just couldn't help but wonder what use you would have for something like this, knowing the hoops you must've jumped through to get it.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("I just thought it looked important! If you really need it, I wouldn't mind letting you have it.", "Jeremy");
                        add_page("...Though, why DO you need it, anyway?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("I could wonder just the same about you.", "Mike");
                        break;
                    
                    case 2:
                        add_page("And what's so important about it to you, exactly?", "Vanessa");
                        add_page("Trespassing and burglarly are some heavy freakin' felonies to commit just for some crappy old mask.", "Vanessa");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("...Huh? Why do I need it?", "Michael");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...Ah, right then, I suppose I never did explain myself, did I?", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("You see, as for myself...I suppose you could say I have a...loose end or two to tie up. A bit of a personal score to settle.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("And in order to do so...I need these masks. All four of them.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Ooh, are you hosting some sort of Halloween party?", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...Sure. I suppose you could call it that.", "Michael");
                        break;
                    
                    case 1:
                        add_page("So you want me to...", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...Bring the rest to me, yes.", "Michael");
                        break;
                    
                    case 2:
                        add_page("...Let me guess, these masks are...cursed or haunted in some way?", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Heheh...I suppose this isn't particularly new for you, is it?", "Michael");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("If you intend to continue visiting the other abandoned Freddy's locations as you have been already, you should quickly find the rest.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("I simply ask that you continue to collect them all and bring them to me.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Well, I suppose I could, especially if they'd help you out!", "Jeremy");
                        add_page("Though, if I do...will I have to deal with those scary robots again?", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...Yes, unfortunately so. The endoskeletons are...very protective.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Though, if you do choose to collect them regardless...", "Michael");
                        break;
                    
                    case 1:
                        add_page("...I'll be honest with you, buddy, breaking into my place of work to ask me to do your errands doesn't exactly set a good first impression.", "Mike");
                        add_page("Why, exactly, should I do this for you and not just call the cops?", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I suppose nothing about this really does benefit you, does it?", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Though, if you do choose to do so regardless...", "Michael");
                        break;
                    
                    case 2:
                        add_page("Are you gonna break in to steal the rest too?", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Not so long as you're willing to cooperate, heheheh...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Though, if you are...", "Michael");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I understand that this request may be sudden, especially coming from a total stranger...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Though, if you do choose to help me regardless...", "Michael");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...Know that you'd be making an old friend of mine very, very happy.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("I trust you to make the right decision.", "Michael");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("...And, just as suddenly as he appeared, the mysterious hooded man disappeared into the darkness.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Strange guy...", "Jeremy");
                    add_page("Those robots WERE scary, but if it would mean helping someone in need...", "Jeremy");
                    add_page("...Oop, right! I gotta get going! There's salvages to be made!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...What a weirdo.", "Mike");
                    add_page("What the hell did he even mean by that? By ANY of that?", "Mike");
                    add_page("...Bah, whatever. I've got a job to do, might as well get back to doing it.", "Mike");
                    break;
                
                case 2:
                    add_page("It'd probably be wise to avoid this paranormal stuff altogether, but...", "Vanessa");
                    add_page("...Oh, who am I kidding, I was already in too deep when I signed up.", "Vanessa");
                    add_page("That Michael's definitely a weird guy...but maybe it wouldn't hurt to hear him out.", "Vanessa");
                    add_page("For now, though...I've got a job to do.", "Vanessa");
                    break;
                
                case 3:
                    add_page("You feel as though you've been imbued newfound purpose...", "");
                    add_page("...Time to get this show on the road.", "");
                    break;
                
                default:
                    add_page("What a strange guy...you're naturally a bit hesitant to help out someone who appeared so suddenly.", "");
                    add_page("...But it might not hurt to hear him out, would it?", "");
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Michael);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night3_Michael":
            switch (global.Guard)
            {
                case 0:
                    add_page("(...Ah, he's back!)", "Jeremy");
                    break;
                
                case 1:
                    add_page("(...It's that guy again.)", "Mike");
                    break;
                
                case 2:
                    add_page("(...Well, look who it is.)", "Vanessa");
                    break;
                
                case 3:
                    add_page("...And would you look who it is?", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 0;
                
                play_music(musMidnight_Michael, 1);
                audio_sound_gain(musMidnight_Michael, 1, 0);
            };
            
            add_page("Ah, hello again. I was hoping I'd see you.", "Michael");
            
            if (global.Guard == 3)
            {
                add_page("Ah, well! I must say, that's...a feeling rather foreign to me.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...Is that so?", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Well, nonetheless...I see you've another mask to your name.", "Michael");
                add_page("YES, yes! And one of remarkable quality, I must say...the craftmanship is immaculate!", "Fritz");
                add_page("The felt feels as pristine as the day it was crafted...you can barely smell the decades-old grease stains lathering the plastic!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Your comment garners a brief chuckle from Michael...", "");
                add_page("...Before his laughter turns to a coughing fit.", "");
                add_page("You give him time to recover...and he extends his hand towards you.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...Your assistance is much appreciated, Fritz.", "Michael");
                add_page("WHO TOLD YOU MY...Oh, right, the nametag, yes.", "Fritz");
                add_page("Briefly, you raise a brow, staring at him in curiosity...", "");
                add_page("He does the same, though his is prompted by confusion.", "");
                add_page("...AHA! Summer of '91. Lucky you!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("W-What are you on about!?", "Michael");
                add_page("The hoodie! The print is a dead giveaway. There was only a brief period of time wherein Freddy lacked the red band around his hat.", "Fritz");
                add_page("That, of course, induced the \"Rebrand\" paranoia that Freddy's knew all too well. Ended with a dour statement from a shareholder and no more than...", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...37 Injured, 12 lawsuits, and a total recall.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...Have you a history with this establishment?", "Michael");
                add_page("That depends. Are you a cop?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("That got a rise out of him. He covers his face as you hear what can be best described as a smoker's impression of a throttled hyena.", "");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...I see you have yourself another one of the masks.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Sure do! Here you go! ", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Uh...yeah. Here, you wanted this, right?", "Mike");
                        break;
                    
                    case 2:
                        add_page("I see you didn't trespass this time. Well, fair's fair...here you go.", "Vanessa");
                        break;
                    
                    default:
                        add_page("You give Michael a nod, before handing him the mask.", "");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Yes, excellent...I had a feeling I could count on you.", "Michael");
                
                if (global.Guard > 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("You have my thanks. I have to imagine it wasn't easy getting your hands on this.", "Michael");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("...Huh? The Marionette gave it to you?", "Michael");
                }
                else
                {
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Ha, it's really no problem. You know, I wouldn't have found it if not for that puppet!", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("...So, uh...what's the deal with these things, anyway?", "Mike");
                            add_page("It was a hell of a process to get this thing in the first place...there was this arcade cabinet, then another one of those puppet things, then...", "Mike");
                            break;
                        
                        case 2:
                            add_page("So...were you the one who left these things with the puppet?", "Vanessa");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("...Puppet?", "Michael");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Yeah! Real friendly one, too. It was what gave me that mask!", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("Yeah, like one of the ones we have here. ...Though this one seemed a lot less like it wanted to kill me. It gave me that mask.", "Mike");
                            break;
                        
                        case 2:
                            add_page("Sorry, Marionette, whatever you wanna call it. I found that mask in its hands.", "Vanessa");
                            break;
                    }
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("That's...hmm.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("(...Well, there's certainly some purpose behind it...but still, it seems...unlike her. Why would she be so willing to give them up...?)", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("...Er, do you need something?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...Something wrong?", "Mike");
                        break;
                    
                    case 2:
                        add_page("...Something up?", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page((global.Guard > 3) ? "...Ah, pardon me." : "...Oh, it's nothing.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("It's just...not often the puppets are so trusting, you know. If they're so willing to work with you...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Well, I suppose you were the right choice for this job after all.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Believe it or not, I've actually tried to gather the masks myself on a fair few occasions. Though the Marionette...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Well, she doesn't like me very much.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Oh, I'm sure it's not like that! The robots have been nothing but friendly to me!", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("That's...hard for me to believe, to be honest with you.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("But I suppose I envy your outlook...most can't help but feel like the animatronics have sinister intentions.", "Michael");
                        break;
                    
                    case 1:
                        add_page("You're saying the robots can hold grudges?", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("The robots are...well, spirited, let's just call them that.", "Michael");
                        break;
                    
                    case 2:
                        add_page("I think the animatronics are just kinda like that, I doubt it's personal.", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("I wouldn't be so sure...I feel there's more to how they behave than most give them credit for.", "Michael");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("I'm sure that seems strange to say about an inanimate object...but you'll come to learn that the animatronics here are rather, well, unique.", "Michael");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Hell, I suppose that goes for all the technology around here. Surely you've noticed yourself with those arcade cabinets.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("The arcade cabinets? Are you kidding? Those have been friendly to me too! The last one gave me a present!", "Jeremy");
                        add_page("...Oh, wait. That's the weird part, isn't it?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Yeah. Uhh...one gave me a present.", "Mike");
                        add_page("...What's up with that, anyway?", "Mike");
                        break;
                    
                    case 2:
                        add_page("Well...I got a present from the last one. I guess I was a little curious about that.", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("The electronics here are especially susceptible to...well, interference, you could call it.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Easily influenced by outside forces, to a point that they almost act like a medium.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("So who knows? Maybe that arcade cabinet was trying to tell you something.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("And given that you found this mask...I suppose the message got through.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("...", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...", "Mike");
                        break;
                    
                    case 2:
                        add_page("...", "Vanessa");
                        break;
                        add_page("...You give Michael a look. He can tell you're not entirely picking up what he's putting down.", "");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...Ah, I apologize. I imagine all of this seems a bit...out there.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Regardless, you've done well, but we've still work to do. I hope to see you again tomorrow.", "Michael");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("...And so, Michael vanished once more.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...You know, I suppose there IS something a little strange about these things, now that I think about it...", "Jeremy");
                    add_page("...Hey, maybe I can ask him about them tomorrow! I'm sure he knows all about these.", "Jeremy");
                    add_page("For now, though...", "Jeremy");
                    break;
                
                case 1:
                    add_page("...He still hasn't told me what the deal with these masks is.", "Mike");
                    add_page("...Ah well, I guess I'll ask tomorrow.", "Mike");
                    add_page("For now...I'd better get back to work.", "Mike");
                    break;
                
                case 2:
                    add_page("That thing about the arcade cabinets...I wonder if that's what made her...", "Vanessa");
                    add_page("...No, it couldn't be. There's no way they have that kind of influence.", "Vanessa");
                    add_page("...I should really get back to work before I think about it too much.", "Vanessa");
                    break;
                
                default:
                    add_page("As strange as it seems...what he said does make some sense to you.", "");
                    add_page("Given your experiences so far, the idea of there being more to these machines than they let on is one you've already considered.", "");
                    add_page("...But you still have a job to do. You'd best save that thinking for when you're off the clock.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Michael);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night4_Michael":
            switch (global.Guard)
            {
                case 0:
                    add_page("(...Ah, it's Michael again!)", "Jeremy");
                    break;
                
                case 1:
                    add_page("(...The other Mike's back.)", "Mike");
                    break;
                
                case 2:
                    add_page("(...Michael's here.)", "Vanessa");
                    break;
                
                case 3:
                    add_page("(It's Michael again!)", "Fritz");
                    break;
                
                default:
                    add_page("...It's Michael again.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 1;
                
                play_music(musMidnight_Michael, 1);
                audio_sound_gain(musMidnight_Michael, 1, 0);
            };
            
            if (global.Guard == 3)
            {
                add_page("Ah, good to see you again. That makes three now.", "Michael");
                add_page("A veritable hat trick!", "Fritz");
                add_page("What are you...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                Skip[TextPageNumber] = true;
                add_page("Without another word, you procure the mask once more...", "");
                add_page("...As well as a matching one.", "");
                add_page("I've a theory, if you'll indulge me.", "Fritz");
                add_page("One of these is the mask you're looking for. The other is simply a spare Chica head from backstage. Can you tell me which is the former?", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("He gives a knowing glance, then confidently taps the one in your right hand.", "");
                add_page("You forgo the mask, and toss the spare head into the nearby street gutter.", "");
                add_page("Fascinating! I'd been wondering for some time what may make these so special.", "Fritz");
                add_page("Any layman surely wouldn't tell the difference. Having guessed so assuredly, you must have some connection with them!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...How much do you know, Fritz?", "Michael");
                add_page("More than others, less than you. I've done my fair share of research, but I've still only theories to my name.", "Fritz");
                add_page("I've shied away from questions for some time now, but, if you may, I would like you to enlighten me on your relationship with these masks!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Oh, Fritz...you have to understand I've kept such information from you for a reason.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("...But, perhaps I could indulge you, just a little.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("Through a web of deceit and treachery, these masks have seen it all. Each is fueled by the suffering brought on by Fazbear's.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Since its conception, this restaurant has been a place of pure dread and delirium.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...All shrouded by the facade of an overweight cartoon bear.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("If I were to explain any further, I fear even YOU wouldn't believe me. ...No offense, of course.", "Michael");
                add_page("None taken! I wear the \"freak of nature\" title with pride.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("I know it's unfair to leave you in the dark...but the only true way to understand all of this is to see it through to the end.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("Follow my word to the letter. Bring me the last mask, and trust that this all will not be for nothing.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...Please.", "Michael");
                add_page("...I'll see you tomorrow, Michael.", "Fritz");
            }
            else
            {
                add_page("Ah, good to see you again. You found the third one.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Which should mean only one remains. As much as I would like to say it's smooth sailing from here, you know how things are with this company by now.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("The robots might act a little funny...but it's nothing I can't handle!", "Jeremy");
                        add_page("...You know, speaking of the robots, I noticed each of these masks matches up with one of them. Funny, huh?", "Jeremy");
                        add_page("...Could you tell me more about these? They seem pretty interesting!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Eh, I got through four shifts of this, what's a fifth?", "Mike");
                        add_page("...So, uh...what's up with these masks, exactly? You still haven't really told me what's so important about them.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Oh, do I.", "Vanessa");
                        add_page("Though, there's something I know a whole lot less about...", "Vanessa");
                        add_page("These masks. What's their deal?", "Vanessa");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...You know, I realize now that I haven't actually told you anything about what these masks are.", "Michael");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page((global.Guard > 3) ? "...And I suppose I owe you that much for helping me." : "...Yes, I suppose I owe you that much for getting this far.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("I imagine you're quite familiar with the...reputation this company has garnered by now, yes?", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("I haven't heard much myself! Though that would explain why my mom didn't want me taking the job here...", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("I've heard rumblings about it, not much more than that.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Heh, who do you think you're talking to?", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                if (global.Guard == 2)
                    add_page("Yes, a fair few unfortunate events have happened across these locations...as I'm sure you are well aware.", "Michael");
                else
                    add_page("A fair few unfortunate events have happened across these locations...I'd be the first to tell you as much.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Disaster after disaster, tragedy after tragedy...it wouldn't be an exaggeration to say this company has been damned since its inception.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("...And every time a tragedy occurs, those there to witness it become...tainted. As do the objects and places surrounding them.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("In fact, I've no doubt you've experienced this phenomenon already. All those props at the last location you visited...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...Surely you noticed how heavy the atmosphere around them felt, yes?", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("And one particular tragedy...one which I myself was there to witness...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Nowhere was it seen closer than through the eyeholes of those masks.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Well...that doesn't sound like much of a party...", "Jeremy");
                        add_page("Are these masks...g-gulp...h-haunted?", "Jeremy");
                        text_effect(27, 37, "Shake");
                        break;
                    
                    case 1:
                        add_page("...I see.", "Mike");
                        add_page("So...what, did a kid die and possess one of these masks, or something?", "Mike");
                        break;
                    
                    case 2:
                        add_page("...I see what you're getting at here.", "Vanessa");
                        add_page("A tragedy...I'm not holding crime scene evidence here, am I?", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page((global.Guard > 3) ? "As a result, these masks just seem to be imbued with some sort of strong, emotional energy." : "Well, no, not quite. These masks just seem to be imbued with some sort of strong, emotional energy.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("One's potent despair, their fear, their...agony, some might call it.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Agony? Is that...um...the official word for it?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Some? What, do you know people who have terminology for this stuff?", "Mike");
                        break;
                    
                    case 2:
                        add_page("Agony, huh? Did you learn that term from someone?", "Vanessa");
                        break;
                }
                
                if (global.Guard > 3)
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("...As you may know, there's only one mask left.", "Michael");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 4;
                    };
                    
                    add_page("That mask is...a bit special, compared to the others.", "Michael");
                }
                else
                {
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 0;
                    };
                    
                    add_page("Yes, I've...had people in my life who studied the phenomenon very closely.", "Michael");
                    
                    switch (global.Guard)
                    {
                        case 0:
                            add_page("Oh, I see! Maybe you can tell me more about it sometime!", "Jeremy");
                            add_page("Though, for now...I'd better get back to work! There's only one mask to go, yeah?", "Jeremy");
                            break;
                        
                        case 1:
                            add_page("...Uh huh.", "Mike");
                            add_page("All of this is a little beyond me...but I guess I'm glad you're the one handling these things.", "Mike");
                            add_page("So, just one more after this, huh?", "Mike");
                            break;
                        
                        case 2:
                            add_page("...Mmmhmmm.", "Vanessa");
                            add_page("So, just one more to go, huh?", "Vanessa");
                            break;
                    }
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("Yes, that's right. And this last one is the most important one of all.", "Michael");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...So don't mess this up.", "Michael");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("...And so, Michael vanished once more.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Jeez, I wasn't expecting there to be so much to these masks...", "Jeremy");
                    add_page("But hey, Michael sure knows his stuff! I'm glad these masks are in good hands with him.", "Jeremy");
                    add_page("Well, what am I waiting for? Only one more to go!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Somehow, I feel like I have even more questions than I did two nights ago.", "Mike");
                    add_page("...Ah, whatever. I'll never have to think about this again after tomorrow.", "Mike");
                    add_page("One mask left...let's just get this over with.", "Mike");
                    break;
                
                case 2:
                    add_page("...Seems I ran from one paranormal mystery just to end up in another.", "Vanessa");
                    add_page("I guess it's on me for continuing to work at this chain...", "Vanessa");
                    add_page("...But hey, maybe this is one I'll finally be able to solve.", "Vanessa");
                    add_page("...If I can only find that last mask.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...You'd best get going. You have work to do.", "");
                    break;
                
                default:
                    add_page("The last mask...", "");
                    add_page("...You're a bit worried to find out what he meant by it being special, but you've gotten too far to chicken out now.", "");
                    add_page("You'd best get going. You have work to do.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Michael);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night5_Michael":
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 0;
                
                audio_play_sound(musMidnight_Michael, 5, true, 1, 0, 0.5);
                audio_sound_gain(musMidnight_Michael, 1, 0);
                global.Route = UnknownEnum.Value_2;
            };
            
            if (global.Guard == 3)
            {
                add_page("Wordlessly, you hand the final mask to Michael.", "");
                add_page("You watch as he stares into its eyes...shuddering.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...Right. It's time.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("I've asked a lot of you, Fritz...but as we reach the final hurdle, I must tell you this here and now:", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("There's no turning back past this point.", "Michael");
                add_page("OhoHO! Implying I would give up at the pinnacle of our success? I thought you'd know me better by now, Michael!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("...Heh. Fair enough.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("Our stubbornness should prove fruitful, as we'll see with this.", "Michael");
                add_page("Michael procures a portable game console from his pocket and hands it to you.", "");
                add_page("You grasp it, testing its weight in your hands. Nothing special about it speaks to you.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("You've no doubt noticed by now, but the animatronics you've encountered are...spirited, in the literal sense.", "Michael");
                add_page("Paranormal activity IS the simplest explanation for everything that's transpired so far, yes.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("Indeed...", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("And I've reason to believe that electronics like that handheld can act as a sort of medium for these spirits to communicate with us.", "Michael");
                add_page("Right! Well, what do you say we head back inside and get this started?", "Fritz");
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("No! No, not yet. Tomorrow. It has to be tomorrow.", "Michael");
                add_page("...Right! Tomorrow, then.", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("We'll reconvene here then. Get some good rest, Fritz.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 5;
                };
                
                add_page("And...thank you for everything.", "Michael");
            }
            else
            {
                add_page("...And so you came through.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("...Thank you. I knew you were the one for this job.", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Not a problem! Just happy to help.", "Jeremy");
                        add_page("...So, uh...did you need anything else?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Yeah yeah, don't mention it.", "Mike");
                        add_page("...So, uh, that's it, yeah? You got everything you needed now?", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...", "Michael");
                        add_page("...There's more to this, isn't there.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Hey, I'm just glad to know these masks aren't getting in the wrong hands.", "Vanessa");
                        add_page("So, what's next? What, uh...what are you gonna be using these masks for?", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...", "Michael");
                        add_page("...It's something you're gonna need me for, isn't it?", "Vanessa");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page((global.Guard > 3) ? "...Although...I'm afraid our work here is not quite done." : "...Yes. I'm afraid our work here is not quite done.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("First and foremost, you're going to need this.", "Michael");
                add_page("Michael shuffles around in his pockets before pulling something out, leaning forward and placing it in your hands.", "");
                add_page("It's...a portable game console?", "");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Ooh, a gift? Well I certainly appreciate it, but you don't need to pay me back!", "Jeremy");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("Oh, it's not quite a gift. This device...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("We'll need it to contact that...old friend I told you about.", "Michael");
                        add_page("Ah, I see, I see! ...So, uh, what about the masks?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...I don't think I follow.", "Mike");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Remember what I told you about the arcade cabinets a few nights ago?", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I have cause to believe the same properties apply even to a device like this.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("We'll need it to contact that...old friend I told you about.", "Michael");
                        add_page("...And the masks?", "Mike");
                        break;
                    
                    case 2:
                        add_page("...You did say electronics can act as a medium.", "Vanessa");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("...Yes, you're quite right. This device, well...", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("We'll need it to contact that...old friend I told you about.", "Michael");
                        add_page("Tch, of course.", "Vanessa");
                        add_page("...And the masks are...?", "Vanessa");
                        break;
                    
                    default:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Remember what I told you about the arcade cabinets a few nights ago?", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I have cause to believe the same properties apply even to a device like this.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("We'll need it to contact that...old friend I told you about.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("As for the masks...", "Michael");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Those are to draw him out.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("I understand that you do not have a shift tomorrow, but I must ask that you humor me and come in anyway. Same time as your regular shift.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("And it MUST be tomorrow, to be clear. There won't be another chance to do this for a long, long time. Understand?", "Michael");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Uh, yep, yep! Got it! (I just hope I don't get in trouble...)", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("I, uh...", "Mike");
                        add_page("...Yeah. I understand.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Wouldn't have gotten this far if I didn't. I'll be there.", "Vanessa");
                        break;
                    
                    default:
                        add_page("...You give Michael a firm nod.", "");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 0;
                };
                
                add_page("Wonderful. Now, go home and rest...the last thing you'll want to do tomorrow is doze off.", "Michael");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("And do not. Forget. The handheld.", "Michael");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("And so, Michael returns to the darkness. For a moment, he stops, looks you in the eye, and nods, before continuing on his way.", "");
            add_page("There's a lot that could go wrong tomorrow, but in spite your natural reservations...", "");
            add_page("...You steel yourself, and prepare for what's to come.", "");
            
            if (array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                money_route_split(true, false);
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Michael);
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = SalvageResults;
            };
            
            break;
        
        case "Midnight_Night5_MichaelFailed":
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 0;
                
                audio_play_sound(musMidnight_Michael, 5, true, 1, 0, 0.5);
                audio_sound_gain(musMidnight_Michael, 1, 0);
            };
            
            add_page("...", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("...It seems you're missing something.", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("And after three flawless nights...what a disappointment.", "Michael");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I-I'm sorry, it just completely slipped my mind!", "Jeremy");
                    add_page("But hey, I-I can just go get it right now, yeah? We've still got time!", "Jeremy");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...No, I'm afraid we very much do not.", "Michael");
                    break;
                
                case 1:
                    add_page("Listen, man, I wanted to help you, I really did, but...", "Mike");
                    add_page("...It's been four nights and I still feel like I haven't gotten a single straight answer from you.", "Mike");
                    break;
                
                case 2:
                    add_page("...Listen, I quit at the old location for a reason. I can't get involved in stuff like this again.", "Vanessa");
                    add_page("I'm...sorry, I really am, but I'm not the right person for this job.", "Vanessa");
                    
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 5;
                    };
                    
                    add_page("...Well.", "Michael");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("I suppose I can't blame you if what we discussed last night seemed a bit too much for you...", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("...Or maybe you just think this is your way out.", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Well, in either case, you should know something.", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Now that you're this deep in...", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("...There's no changing what happens next.", "Michael");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("And so, for one final time...Michael disappeared into the darkness.", "");
            add_page("...How disappointing.", "");
            
            if (array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                money_route_split(false, false);
                break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Michael);
                
                with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                    Destination = Credits;
            };
            
            break;
        
        case "Midnight_Failed":
            var Good = has_been_good() && !currently_good();
            var Ultimate = has_been_ultimate() && !(currently_evil() || currently_good());
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Sheesh...", "Jeremy");
                    add_page("Is it just me, or are those robots getting scarier each night?", "Jeremy");
                    Skip[TextPageNumber] = true;
                    add_page("Now, I wonder where...", "Jeremy");
                    break;
                
                case 1:
                    add_page("Phew, got that over with...", "Mike");
                    Skip[TextPageNumber] = true;
                    add_page("...Hey, where's...?", "Mike");
                    break;
                
                case 2:
                    add_page("...Huh. I thought for sure " + (Good ? (Ultimate ? "at least one of those two" : "Michael") : "she") + " would be back...", "Vanessa");
                    Skip[TextPageNumber] = true;
                    add_page("Where's...?", "Vanessa");
                    break;
                
                case 3:
                    add_page("...It's quiet.", "Fritz");
                    add_page("...", "Fritz");
                    add_page("...", "Fritz");
                    add_page("...Oh, right! I'm not talking.", "Fritz");
                    Skip[TextPageNumber] = true;
                    add_page("Oh well. I suppose I ought to", "Fritz");
                    break;
            }
            
            Delay[TextPageNumber] = 120;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxPhoneRing, 10, true);
            };
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...Oh?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...It's the boss.", "Mike");
                    break;
                
                case 2:
                    add_page("...Oh, it's the boss again.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Hm?", "Fritz");
                    break;
                
                default:
                    add_page("...It's the boss again.", "");
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(sfxPhoneRing);
                audio_play_sound(sfxPhonePickup, 10, false);
            };
            
            Delay[TextPageNumber] = 120;
            add_page("Ring ring, ring ring! Guess who, stooge!", "The Boss");
            
            Function[TextPageNumber] = function()
            {
                play_music(musMidnight_TheBoss, 0.25);
            };
            
            add_page((global.Night == 5) ? "...What are you still doing there!? The longer you stick around, the more I have to pay you, so GO HOME ALREADY!" : "You've got more salvages to make, so MOVE IT!", "The Boss");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Oh, right, of course! On my way!", "Jeremy");
                    add_page("...Though...", "Jeremy");
                    break;
                
                case 1:
                    add_page("Yeah yeah, I'm on my way.", "Mike");
                    add_page("...", "Mike");
                    break;
                
                case 2:
                    add_page("Right, I was just getting to it.", "Vanessa");
                    add_page("...Though, I wanted to ask...", "Vanessa");
                    break;
                
                case 3:
                    add_page("Ah, of course! Just taking the scenic route, that's all.", "Fritz");
                    add_page("...Though, wait a tick.", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            add_page("...What? Spit it out!", "The Boss");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, I was wondering...", "Jeremy");
                    add_page("...You haven't happened to see a " + (Good ? "man in a hoodie" : "white rabbit") + " around the restaurant, have you?", "Jeremy");
                    break;
                
                case 1:
                    add_page("It's just, uh...", "Mike");
                    add_page("...Have you seen a " + (Good ? "guy in a hoodie" : "weirdo in a rabbit costume") + " hanging around the restaurant recently?", "Mike");
                    break;
                
                case 2:
                    add_page("It's just...", "Vanessa");
                    add_page("...Has a " + (Good ? "man in a Freddy hoodie" : "creepy girl in a rabbit costume") + " stopped by the restaurant recently?", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Have you any information on a " + (Good ? "fetid homeless man? (Aside from myself, of course.)" : "particularly cocksure rabbit lady?"), "Fritz");
                    break;
                
                default:
                    break;
            }
            
            if (global.Guard > 3)
                add_page("...Eh? A " + (Good ? "man in a Freddy hoodie" : "creepy girl in a rabbit costume") + "? Oh, oh yeah!", "The Boss");
            else
                add_page("Eh...? Oh, oh yeah!", "The Boss");
            
            add_page("Yeah, the one who was loitering outside my restaurant! I called the cops and sent that jerk to the slammer.", "The Boss");
            
            if (Ultimate)
                add_page("Some rabbit lady too...bah, some weirdos in this town!", "The Boss");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("H-Huh!?", "Jeremy");
                    break;
                
                case 1:
                    add_page("What? Wait, seriously?", "Mike");
                    break;
                
                case 2:
                    add_page("You...huh?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Wow...really? ...And they didn't ask about me?", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            add_page("C'mon! I got a business to run here, and the parking lot ain't free real estate!", "The Boss");
            add_page("Besides, without " + (Ultimate ? "those two" : "that chump") + " around, you can focus on what REALLY matters: COLD HARD CASH!!", "The Boss");
            add_page("Now move your butt! Time is money!", "The Boss");
            Delay[TextPageNumber] = 120;
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxPhonePickup, 10, false);
                audio_stop_sound(musMidnight_TheBoss);
            };
            
            if (has_been_evil() && currently_evil())
            {
                add_page("...It looks like someone else is here.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (instance_create_depth(800, 0, 50, oTalksprite))
                    {
                        Image = 1;
                        sprite_index = sTalksprites_Vanny;
                    }
                };
                
                add_page("Well, well, WELL! Looks like you came around after all~!", "White Rabbit");
                
                switch (global.Night)
                {
                    case 3:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("What did I say? I knew you'd make the right choice!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...We've got a lot of catching up to do, though. Don't worry, I'll tell you what these things are tomorrow!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("So I'll be seeing you around, my brand new bestie! Mwwwwah!", "White Rabbit");
                        break;
                    
                    case 4:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("That other guy is just SUCH a jerk, right? I couldn't BELIEVE he was talking to you like that!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 5;
                        };
                        
                        add_page("...Oh yeah, I was watching your conversation with him from the bushes last night, hope you didn't mind.", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("Well, whatever! Now that HE'S out of the picture, you can get back to what REALLY matters here!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("There's only one more of these things left for you to collect. Be a doll and pick it up for me, will you?", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 5;
                        };
                        
                        add_page("I'll be sure to reward you HANDSOMELY if you do~!", "White Rabbit");
                        break;
                    
                    case 5:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...I'm honestly a little surprised by that, considering what I told you about last night...but hey, I'm not one to complain!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 5;
                        };
                        
                        add_page("You know...I think you deserve a reward! Why don't you come back here tomorrow? I promise it'll be worth it!", "White Rabbit");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("See you then! Mwwwwah!", "White Rabbit");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Enter = false;
                };
                
                add_page("...And off she goes.", "");
            }
            else if (has_been_good() && currently_good())
            {
                add_page("...It looks like someone else is here.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (instance_create_depth(800, 0, 50, oTalksprite))
                    {
                        Image = 0;
                        sprite_index = sTalksprites_Michael;
                    }
                };
                
                add_page("...Thank you for making the right decision.", "Hooded Man");
                
                switch (global.Night)
                {
                    case 3:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("That girl can be...a bit much, can't she?", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Regardless, I suppose I ought to properly introduce myself. My name is Michael.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("If it isn't too much trouble, I ask that you continue to collect those masks.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...You ARE already halfway there, so I imagine it won't be too difficult.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("I understand last night may have not been the best introduction...but if you do choose to help me with this, I would be immensely grateful.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("...I hope to see you make the right choice.", "Michael");
                        break;
                    
                    case 4:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("I must apologize if I came off as rude last night...I just felt I needed to be a bit firm if I were to fully convince you.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("...And, well...it worked in the end, didn't it?", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...There IS only one le so I imagine it won't be too difficult.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("I understand the last few nights may have not been the best introduction...but if you do choose to help me with this, I would be immensely grateful.", "Michael");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("...I hope to see you make the right choice.", "Michael");
                        break;
                    
                    case 5:
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...I would've certainly liked if you had made it about three nights sooner, but I suppose I can't complain.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 0;
                        };
                        
                        add_page("Regardless, I suppose I ought to properly introduce myself. My name is Michael.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 2;
                        };
                        
                        add_page("...And if it's not too much trouble, I have a small request.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 3;
                        };
                        
                        add_page("Meet me here again, tomorrow night. I have a bit of work left to do, and I would like you to help me do it.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 5;
                        };
                        
                        add_page("You went through the work of gathering all four of those masks, after all...so I figure we ought to put them to good use.", "Hooded Man");
                        
                        Function[TextPageNumber] = function()
                        {
                            with (oTalksprite)
                                Image = 1;
                        };
                        
                        add_page("I'll be sure to supply you with all the necessary tools tomorrow. I hope to see you there.", "Hooded Man");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Enter = false;
                };
                
                add_page("...And off he goes.", "");
            }
            
            if (global.Night == 5 && !currently_good() && !currently_evil())
            {
                switch (global.Guard)
                {
                    case 0:
                        add_page("Aww, what a shame... " + (Good ? (Ultimate ? "they both" : "he") : "she") + " seemed so friendly...", "Jeremy");
                        add_page("Oh well, I guess I can't work myself TOO hard. I'd better hurry home!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page(Good ? (Ultimate ? "...That's definitely one way to stop their arguing. It's just..." : "...Man, and I was just getting to know him...") : "...Maybe it's for the best. She was a little creepy.", "Mike");
                        add_page("...Ah, whatever. I made it through the week...I should get some rest.", "Mike");
                        break;
                    
                    case 2:
                        add_page(Good ? (Ultimate ? "I guess I should be happy SHE won't be showing up again...even if it meant taking Michael with her." : "...Sorry, Michael.") : "...Good riddance.", "Vanessa");
                        add_page(Good ? "Well, it is what it is, I guess. I'll do what I can to relax for now..." : "Well, with THAT finally settled...time to enjoy some well-earned rest!", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well. What's one more bridge burnt, hm?", "Fritz");
                        add_page("Oh well...I suppose I could use some time at home after such an exciting week.", "Fritz");
                        add_page("...Oh god, right! I need to move! I'm late for Indifferent Housewives!", "Fritz");
                        break;
                    
                    default:
                        add_page("You can't help but feel a little bad for letting " + (Good ? (Ultimate ? "those two" : "Michael") : "that rabbit") + "down...but you suppose that's just the way the pizza crust crumbles.", "");
                        add_page("You made it through the week. You should be happy about that! Time to go home and get some rest.", "");
                        break;
                }
            }
            else if (global.Night == 5)
            {
                switch (global.Guard)
                {
                    case 0:
                        add_page("Aww, what a shame... " + (Good ? "he" : "she") + " seemed so friendly...", "Jeremy");
                        add_page("Oh well, at least I still have " + (Good ? "that rabbit lady! I wonder what kind of reward she has for me...?" : "Michael to help out! I wonder what he has planned for tomorrow...?"), "Jeremy");
                        break;
                    
                    case 1:
                        add_page(Good ? "...Man, and I was just getting to know him..." : "...Maybe it's for the best. She was a little creepy.", "Mike");
                        add_page("...Well, I might as well figure out what they want from me tomorrow. I already made it this far, after all...", "Mike");
                        break;
                    
                    case 2:
                        add_page(Good ? "...Sorry, Michael." : "...Good riddance.", "Vanessa");
                        add_page(Good ? "Hopefully this'll all be worth it. Tomorrow's the night I finish this." : "Well, with THAT finally settled...I'd better see what Michael needs help with.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well. What's one more bridge burnt, hm?", "Fritz");
                        add_page("Now then...it seems I've a date with a " + (Good ? "brassy lagomorph" : "cryptic vagrant") + ". I'd best get a move on!", "Fritz");
                        break;
                    
                    default:
                        add_page("You can't help but feel a little bad for letting " + (Good ? (Ultimate ? "those two" : "Michael") : "that rabbit") + "down...but you suppose that's just the way the pizza crust crumbles.", "");
                        add_page("...You've got another job to do now. You'd better get ready for tomorrow.", "");
                        break;
                }
            }
            else
            {
                switch (global.Guard)
                {
                    case 0:
                        add_page("Aww, what a shame... " + (Good ? (Ultimate ? "they both" : "he") : "she") + " seemed so friendly...", "Jeremy");
                        add_page("Oh well, I guess the boss needs helping too. I'd better get back to it!", "Jeremy");
                        break;
                    
                    case 1:
                        add_page(Good ? (Ultimate ? "...That's definitely one way to stop their arguing. It's just..." : "...Man, and I was just getting to know him...") : "...Maybe it's for the best. She was a little creepy.", "Mike");
                        break;
                        add_page("...Ah, whatever. I've got a job to do.", "Mike");
                    
                    case 2:
                        add_page(Good ? (Ultimate ? "I guess I should be happy SHE won't be showing up again...even if it meant taking Michael with her." : "...Sorry, Michael.") : "...Good riddance.", "Vanessa");
                        add_page(Good ? "Well, it is what it is, I guess. Better get back to my job." : "Well, with THAT finally settled...I'd better get back to work.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well. What's one more bridge burnt, hm?", "Fritz");
                        add_page("Now...let's see what trouble I can stir up tonight.", "Fritz");
                        break;
                    
                    default:
                        add_page("You can't help but feel a little bad for letting " + (Good ? (Ultimate ? "those two" : "Michael") : "that rabbit") + "down...but you suppose that's just the way the pizza crust crumbles.", "");
                        add_page("You've still got a job to do, so you'd better get back to it.", "");
                        break;
                }
            }
            
            if (global.Night == 5 && array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                money_route_split(has_been_good() && currently_good(), has_been_evil() && currently_evil());
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    if (global.Night == 5 && !currently_good() && !currently_evil())
                    {
                        audio_stop_all();
                        
                        with (instance_create_depth(0, 0, 0, oTransitionMinigame))
                            Destination = Credits;
                    }
                    else
                    {
                        instance_create_depth(0, 0, 0, oTransitionMinigame);
                    }
                };
            }
            
            break;
        
        case "Midnight_Night2_Ultimate":
            var Pronoun = (global.Guard == 2) ? "her" : ((global.Guard <= 3) ? "him" : "them");
            add_page("There's...two people outside?", "");
            add_page("...It seems that they're arguing.", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 5;
                    sprite_index = sTalksprites_Michael;
                }
                
                play_music(musMidnight_MissingChild);
                audio_sound_gain(musMidnight_MissingChild, 1, 0);
            };
            
            add_page(string("If you knew what was good for you, you'd leave {0} to me. Neither of you have any idea what you're getting yourselves into here.", Pronoun), "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    SecondarySprite = sTalksprites_Vanny;
                    switch_chars(6, 1);
                }
            };
            
            add_page(string("What, so YOU can boss {0} around? Fat chance! You REEK of ulterior motives!", Pronoun), "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 7;
            };
            
            add_page("...In fact, you reek in general. Jeez, why do you smell like that?", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Uh...can I...help you two?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Uh, hello?", "Mike");
                    break;
                
                case 2:
                    add_page("...Alright, what's going on here?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Wow, only a day on the job and people are already fighting over me! What a spectacle!", "Fritz");
                    break;
                
                default:
                    add_page("It seems neither of them even noticed that you were there. You decide to speak up.", "");
                    break;
            }
            
            Skip[TextPageNumber] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(1, 0);
            };
            
            add_page("...Ah, there you are! Yes, I was hoping to-", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(1, 1);
            };
            
            add_page("Well hel-LO there, gorgeous! Yes, you're just who I wanted to see!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(5, 0);
            };
            
            add_page("Wha- Hey, I was talking!", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(3, 1);
            };
            
            add_page("Ladies first, stinky! It's not like you had anything worthwhile to say, anyhow...", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...So! Uh, did you...want anything?", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Okay, what's this about, exactly?", "Mike");
                    break;
                
                case 2:
                    add_page("...You do realize I know who you are, right? What are you doing here?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Well, don't keep me waiting! What was it you wanted to tell me?", "Fritz");
                    break;
                
                default:
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 1;
                    };
                    
                    add_page("So, buddy, friend-o, pal-o-mine! You wanna know what I'm doing here?", "Vanny");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Well boy, am I GLAD you asked! See, you've got a little something I want.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("...Well, you got a LOT, actually, but whatever that other stuff you brought home with you was doesn't matter to me right now.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("You know that green, moldy bunny guy you salvaged? See, funny thing...he actually belongs to ME.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(2, 0);
            };
            
            add_page("Under what circumstances!? You know neither of you should be handling that...that thing!", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Listen, er...what was your name?", "Hooded Man");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Oh, I'm Jeremy! Nice to meet you!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Mike.", "Mike");
                    break;
                
                case 2:
                    add_page("...Vanessa. Vanessa Shelley.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Most people call me disturbed, but you can call me Fritz!", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page(string("...Yes, {0}.", guard_nickname()), "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("I apologize if we got off on the wrong foot, but I only want to make one thing clear.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("Certain things at this company are not to be trifled with. That rabbit is very much one of them.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(2, 1);
            };
            
            add_page("...Do you mean Springtrap, or do you mean me?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(0, 0);
            };
            
            add_page(string("I understand that you're new around here.{0} Consider yourself lucky that you still have time to change course.", (global.Guard == 2) ? "..at least compared to myself." : ""), "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("Being around as long as I have, I know I have my fair share of regrets. If I were in your shoes, well...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("...I would've loved to get out while I still had the chance.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(4, 1);
            };
            
            add_page(string("Are you...threatening {0}?", Pronoun), "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(1, 0);
            };
            
            add_page("I am only warning you. Both of you.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("If you continue down this path, touching things that should not be touched...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("...I feel you won't be happy when they come back to bite you.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(5, 1);
            };
            
            add_page("Tch...you would know a thing about bites, wouldn't you?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(0, 0);
            };
            
            add_page("...Excuse me?", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(2, 1);
            };
            
            add_page("Oh, c'mon, what's with that look? It was just a joke...", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page(string("Oh well...you get the picture, don't you, {0}?", guard_nickname()), "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("You've got two choices here! You can go along with me...or you can bore yourself to death with whatever THAT guy's got planned.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("I have a feeling you'll make the right choice in the end.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    sprite_index = sNOTHING;
                    Enter = false;
                }
                
                audio_sound_gain(musMidnight_MissingChild, 0, 1000);
            };
            
            add_page("...And, just like that, the mysterious white rabbit hopped, skipped and jumped back into the darkness.", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 4;
                    image_index = sTalksprites_Michael;
                }
            };
            
            add_page("...Phew. Good riddance.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page(string("Listen, er...{0}, was it?", guard_nickname()), "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("I like to believe you have good intentions with...whatever it is you're doing here, even if I do not fully understand them.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("In fact, I appreciate that you brought that mask back with you. If you happen to find any more, I would love to take them off your hands.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Just...steer clear of that rabbit, will you?", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("You'll be better off if you don't get your hands dirty.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
            };
            
            add_page("...And the hooded man takes his leave as well.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I really wish there was a way I could please both of them...I'd hate to cause another fight.", "Jeremy");
                    add_page("...Though, hey, they were both just looking for something I found, weren't they?", "Jeremy");
                    add_page("Aha, that's it! If I just continue collecting those masks AND those funny-looking robots, I can make them both happy!", "Jeremy");
                    add_page("...I just wonder why they want them so much...?", "Jeremy");
                    add_page("...Ah, shoot, I'm running late! I'd better get a move on!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...I barely processed any of that.", "Mike");
                    add_page("Well, if they show up again, I can only hope they give me more of a straight answer.", "Mike");
                    add_page("I was really only grabbing these things for cash...", "Mike");
                    add_page("If those two want them so bad, maybe they're even more valuable than I took them for...?", "Mike");
                    add_page("...Whatever. I need to get back to work.", "Mike");
                    break;
                
                case 2:
                    add_page("Well, I'm definitely not giving HER what she wants...but I can't say I trust that purple guy either.", "Vanessa");
                    add_page("...He had a point, though. The whole reason I came here was so I wouldn't have to get involved with this stuff...", "Vanessa");
                    add_page("...But it's also a security guard's duty to protect, isn't it?", "Vanessa");
                    add_page("...I'd better keep an eye out for more of these things. I'd hate for them to fall into the wrong hands.", "Vanessa");
                    break;
                
                case 3:
                    add_page("To think there's not only somebody, but TWO somebodies out there who value these trinkets as much as I do...", "Fritz");
                    add_page("Haha, it thrills me! I've REALLY found the right career path!", "Fritz");
                    add_page("And like with any path, I have a duty to follow this one up to its logical extreme.", "Fritz");
                    add_page("...I should see how they react if I do this three more times.", "Fritz");
                    break;
                
                default:
                    add_page("...You're struggling to fully process what you just experienced.", "");
                    add_page("It feels strange having two strangers fight over you. It seems they both value you greatly, for one reason or another.", "");
                    add_page("...Or maybe they just value what you have.", "");
                    add_page("...Either way, you've got a job to do. You'd best get back to it.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night3_Ultimate":
            add_page("...That man from last night is back.", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                    Image = 2;
                
                play_music(musMidnight_Michael, 1);
                audio_sound_gain(musMidnight_Michael, 1, 0);
            };
            
            add_page("You know...I can't help but wonder what it is you're trying to accomplish here.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Is your boss giving you a bonus for these? Are you just...curious what might happen?", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("I just...struggle to see what your motive is here, especially when I doubt you even know what these things even are.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("...The rabbit, for example. Do you know who - or what, exactly - he is?", "Hooded Man");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Well, I...think I can handle him well enough! I've made it this far, after all!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Listen, whatever they are, I've been handling them fine. You don't have to worry about me.", "Mike");
                    break;
                
                case 2:
                    add_page("...Whatever he is, I can handle him. You shouldn't be concerned with what the company does with its own property anyway.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Some manner of effigy for dread and despair...? I don't know, but he's been a pushover so far! Don't worry about me!", "Fritz");
                    break;
                
                default:
                    add_page("You're struggling to come up with a response. Deep down, you know there's a reason you're doing all this...but you can't quite find the words.", "");
                    add_page("...So instead, you reassure Michael that he shouldn't worry.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("I'm more concerned with what consequences freeing him and the others will have.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...Consequences you clearly don't grasp the weight of.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("...Listen. Let me tell you about this...friend I once knew.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("He was a bit rough around the edges, made plenty of mistakes...but he had a good heart.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Always wanted to do the right thing, you know? And I liked that about him.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("...Yet he was also horribly stubborn. He had this hare-brained plan, and he insisted he do it all himself. \"His cross to bear\", so he said.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("He became obsessed. Fully submerged in his work.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("Maybe because he was in over his head, or maybe just to try and drown out his guilt...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("...But soon, he began meddling with forces far outside his control.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Do you want to know what happened to him?", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...He turned up dead. His brains splattered across the walls of his study.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Maybe you won't realize it now, maybe you won't even realize it until after it's too late...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("...But you'll come to realize these things were sealed away for a reason.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
                
                audio_sound_gain(musMidnight_Michael, 0, 1000);
            };
            
            add_page("...And so, the man vanishes back into the darkness yet again. His stare seems to pierce right through you as he walks away...", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Sheesh, that guy needs to relax... Does he not believe me when I say I can handle this...?", "Jeremy");
                    add_page("I guess it's good to be careful...but if you let it get to you, you'll just end up paranoid!", "Jeremy");
                    add_page("If only he stuck around to listen, maybe I could make him see it that way...", "Jeremy");
                    add_page("...", "Jeremy");
                    add_page("...Well, if he doesn't see it now, I'll just have to show him!", "Jeremy");
                    add_page("I'll prove to him that I can handle this myself!", "Jeremy");
                    break;
                
                case 1:
                    add_page("...Creepy. I'm never getting a straight answer from anyone around here, am I?", "Mike");
                    add_page("Who does this guy think he is to tell me what to do? It's not like he's the one who signs my checks.", "Mike");
                    add_page("And acting like I can't handle myself...I'm not THAT incompetent.", "Mike");
                    add_page("...Whatever. If I keep at this, it'll be on my own terms.", "Mike");
                    add_page("If I stick the course long enough...maybe I can finally find out what's going on here.", "Mike");
                    break;
                
                case 2:
                    add_page("...He sure likes being vague, doesn't he?", "Vanessa");
                    add_page("You'd think I'd get a little more respect around here, being around as long as I have...", "Vanessa");
                    add_page("...Whatever. I'm not gonna let any thinly-veiled threats stop me.", "Vanessa");
                    add_page("I've got work to do.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Everything is done for a reason.", "Fritz");
                    add_page("Maybe not reasons he or any reasonable person could reasonably understand...but something BEYOND reason.", "Fritz");
                    add_page("It's the reasoning of the reason we've yet to reason!", "Fritz");
                    add_page("...Good god, I love that word. I wonder the reason why?", "Fritz");
                    break;
                
                default:
                    add_page("You can't help but be a bit offended by how little the hooded man seems to think of you...", "");
                    add_page("...Though you suppose it's an inevitable part of being a newbie around here.", "");
                    add_page("You have your reasons for doing what you do, surely. Maybe if you stick with it long enough, you can make them see that.", "");
                    add_page("...But first, you've got a job to get back to.", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night4_Ultimate":
            add_page("...It's her.", "");
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 7;
                    sprite_index = sTalksprites_Vanny;
                }
                
                play_music(musMidnight_Vanny, 1);
                audio_sound_gain(musMidnight_Vanny, 1, 0);
            };
            
            add_page("Alright you jerk, give it up! What's your angle here!?", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("My, er...angle?", "Jeremy");
                    break;
                
                case 1:
                    add_page("My...what?", "Mike");
                    break;
                
                case 2:
                    add_page("I don't know what you mean, and even if I did, I'm not talking to you.", "Vanessa");
                    break;
                
                case 3:
                    add_page("I wouldn't know, I left my protractor back in the office!", "Fritz");
                    break;
                
                default:
                    Function[TextPageNumber] = function()
                    {
                        with (oTalksprite)
                            Image = 2;
                    };
                    
                    add_page("...C'mon, aren't you gonna say something? ANYTHING?", "White Rabbit");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("Don't play dumb with me! I KNOW you're up to something!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("Do you REALLY expect me to believe the whole newbie schtick? Huh?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page(((global.Guard == 2) ? "You just start working here one day, and suddenly know" : "Some guy just shows up someday, and somehow knows") + " exactly what to grab, and exactly how to deal with it?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page((global.Guard == 2) ? "No! You know more than you should! You're...you're PLANNING something here!" : "No! You're...you're someone else! I dunno who, but I know you are!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("Because if you weren't...", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 7;
            };
            
            add_page("Springtrap would've GUTTED YOU LIKE A FISH by now!", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I-I'm being honest! I didn't even know about this place until a week ago!", "Jeremy");
                    add_page("I'm glad you think I'm doing good at my job, but that doesn't mean I'm some kind of secret agent...", "Jeremy");
                    break;
                
                case 1:
                    add_page("(Just doing my job is considered suspicious? Jeez, I really am a slacker...)", "Mike");
                    add_page("...Listen, lady, I didn't even know about this place until the job counseler pointed me to it.", "Mike");
                    add_page("I'm just...some guy. I've got nothing to hide.", "Mike");
                    break;
                
                case 2:
                    add_page("My job is to protect and maintain company equipment. Nothing more, nothing less.", "Vanessa");
                    add_page("Whatever crazy rumors surround this company are none of my business. I have no idea what goes on during the day shift.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Well, if it would put your mind at ease, I suppose I can tell you a BIT about me...", "Fritz");
                    add_page("Let's see now...my real name isn't Fritz, I discovered a new disease while working here, I know Balloon Boy's account information...", "Fritz");
                    add_page("...And aside from what I've learned about the military-grade steel some of the animatronics' mechanisms use, that's just about it!", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page((global.Guard > 3) ? "...You know that look isn't fooling me. You HAVE to have heard of SOMETHING." : "Oh, reeeeaaaally? So you mean to tell me you don't know ANYTHING about the company's history?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("The bite, the BIG bite, the Freddy Faz-Cola recall, the MCI...NONE of that rings a bell?", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("...I'm sorry, the MCI?", "Jeremy");
                    break;
                
                case 1:
                    add_page("The MC-what?", "Mike");
                    break;
                
                case 2:
                    add_page("...The MCI?", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Em...see...eye, you say?", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...Uh, yeah. The MCI.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("...Surely you've at least heard of THAT, right?", "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I...can't say it rings a bell, no.", "Jeremy");
                    break;
                
                case 1:
                    add_page("Uh...no?", "Mike");
                    break;
                
                case 2:
                    add_page("...", "Vanessa");
                    break;
                
                case 3:
                    add_page("Did you...make that up? You made it up, didn't you?", "Fritz");
                    break;
                
                default:
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...You mean to tell me you haven't heard of the single most infamous event in this company's entire history?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("Tch, I should've figured... After all, if you DID, I doubt you would still be...", "White Rabbit");
            add_page("...", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...You know what?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("Why don't I tell you about it?", "White Rabbit");
            Delay[TextPageNumber] = 240;
            
            Function[TextPageNumber] = function()
            {
                audio_sound_gain(musMidnight_Vanny, 0, 3);
                
                with (oTextBox)
                    depth -= 5;
                
                with (instance_create_depth(x, y, oTextBox.depth + 2, oFadeMachine))
                {
                    FadeSeconds = 3;
                    FadeBox = true;
                    Alpha = 0;
                }
            };
            
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oTextBox)
                    TextBoxSprite = sNOTHING;
                
                with (oFadeMachine)
                    FadeBox = false;
                
                oTalksprite.visible = false;
                oMidnightCutscene.sprite_index = sNOTHING;
                instance_create_depth(0, 0, oTextBox.depth + 1, oMCICutscene);
                play_music(mus_MCICutscene);
            };
            
            add_page("So, this place...", "");
            add_page("Pretty run down these days, huh?", "");
            add_page("...But that wasn't always the case.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.FadeTarget = 1;
            };
            
            add_page("Back in the 80's? Gosh, Freddy's was the place to BE!", "");
            add_page("Everyone and their grandmother wanted to hang out here! If you were a kid, you wouldn't be caught dead anywhere else!", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.FadeTarget = 0;
            };
            
            add_page("...Er, well, you get what I mean. Kids loved this place. I'm sure you can imagine how big the crowds were here.", "");
            add_page("But among those happy crowds, there were a few kids who...weren't so happy.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
                oMCICutscene.FadeTarget = 1;
            };
            
            add_page("The lonely ones. The ones who had trouble making friends.", "");
            add_page("There they sat, far away from the crowds, all on their own, all sad and lonely.", "");
            add_page("Until one day....", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("...A friend came their way.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("A man. One of the place's performers, actually. He loved putting smiles on kids' faces, so he'd seek out the loneliest ones he could find.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("And - hoo boy, was he good at his job! He'd help them beat the arcade games, sneak them toys from behind the prize corner...stuff like that.", "");
            add_page("And the kids absolutely adored him. I mean, who wouldn't?", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.FadeTarget = 0;
            };
            
            add_page("...Eventually, those kids' birthdays would come around.", "");
            add_page("Nobody would show up, of course.", "");
            add_page("...That is, except for the man.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.FadeTarget = 1;
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("\"Why the long face?\", he'd say. \"Did you not like the gift I got for you?\"", "");
            add_page("\"...Oh, silly me! You must not have found it yet. I should've known!\"", "");
            add_page("\"Here, I'll show you to it! Follow me.\"", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("They'd follow along, of course. Who would they be to not trust their best friend?", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.CurrentSlide++;
            };
            
            add_page("He brought them to a back room, in a corner of the pizzeria few ever looked...and fewer ever ventured to.", "");
            add_page("\"Are you ready? Close your eyes!\" he'd say, as he ushered them into the room.", "");
            
            Function[TextPageNumber] = function()
            {
                oMCICutscene.FadeTarget = 0;
                audio_sound_gain(mus_MCICutscene, 0, 2000);
            };
            
            add_page("They went in. He followed behind.", "");
            add_page("And just as they opened their eyes...", "");
            
            Function[TextPageNumber] = function()
            {
                instance_create_depth(0, 0, oMCICutscene.depth - 1, oSpringtrapSlashCutscene);
            };
            
            Delay[TextPageNumber] = 240;
            add_page("...There were four children in total. The police never found any of them.", "");
            add_page("...The police never found the man, either.", "");
            add_page("Do you wanna know the funniest part?", "");
            add_page("That man...", "");
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxSwoosh, 10, false);
                instance_create_depth(0, 0, oMCICutscene.depth - 1, oSpringtrapRevealCutscene);
            };
            
            Delay[TextPageNumber] = 120;
            add_page("He's been right here with you this whole time!", "");
            
            Function[TextPageNumber] = function()
            {
                audio_play_sound(sfxMetalImpact, 10, false);
                audio_stop_sound(mus_MCICutscene);
                instance_destroy(oSpringtrapRevealCutscene);
                instance_destroy(oMCICutscene);
                
                with (oFadeMachine)
                {
                    Alpha = 2;
                    FadeSeconds = -2;
                    FadeBox = true;
                }
                
                with (oTalksprite)
                    Image = 3;
                
                oTalksprite.visible = true;
                oMidnightCutscene.sprite_index = sParkingLotBG;
            };
            
            Delay[TextPageNumber] = 240;
            Skip[TextPageNumber] = true;
            add_page(" ", "");
            Hide[TextPageNumber - 1] = true;
            
            Function[TextPageNumber] = function()
            {
                with (oTextBox)
                    TextBoxSprite = sTextBox;
                
                audio_sound_gain(musMidnight_Vanny, 1, 5000);
                
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Haha, that's right! You've been housing a killer in these walls this ENTIRE time!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            Skip[TextPageNumber] = true;
            add_page("Bet you'll think twice about handling those animatronics now... Because guess what? All of them are ALSO...", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
            };
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Haunted, right?", "Jeremy");
                    break;
                
                case 1:
                    add_page("Haunted? Yeah, uh...I heard.", "Mike");
                    break;
                
                case 2:
                    add_page("Haunted. You're gonna say they were haunted, aren't you?", "Vanessa");
                    break;
                
                case 3:
                    add_page("Haunted by the spirits of those children who died and that's why they've been trying to kill me?", "Fritz");
                    break;
                
                default:
                    add_page("...", "White Rabbit");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("...What?" + ((global.Guard > 3) ? " You knew about all of this already?" : ""), "White Rabbit");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("Yeah, uh...my parents told me about the whole missing children thing when I said I'd be working here.", "Jeremy");
                    break;
                
                case 1:
                    add_page("Yeah, I uh...read an article about those missing kids during my first shift.", "Mike");
                    break;
                
                case 2:
                    add_page("You really think I wouldn't have heard about this whole story? Do you KNOW how long I've been working here?", "Vanessa");
                    break;
                
                case 3:
                    break;
                
                default:
                    break;
            }
            
            if (global.Guard < 3)
            {
                Skip[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("...B-But you said you didn't-", "White Rabbit");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 2;
                };
                
                add_page("...B-But you said you didn't... You KNEW? This ENTIRE TIME!?", "White Rabbit");
            }
            
            switch (global.Guard)
            {
                case 0:
                    add_page("I...didn't know there was a proper name for it. Like I said, I'm new here...", "Jeremy");
                    break;
                
                case 1:
                    add_page("I knew ABOUT it, I just didn't know it was called, uh...whatever the acronym was.", "Mike");
                    break;
                
                case 2:
                    add_page("I've never heard anyone call it the MCI...though, like I said, I don't really get involved with that stuff.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Haha, nope! I was just guessing.", "Fritz");
                
                default:
                    break;
            }
            
            if (global.Guard >= 3)
            {
                Function[TextPageNumber] = function()
                {
                    audio_play_sound(sfxMetalImpact, 10, false);
                    
                    with (oTalksprite)
                        Image = 7;
                };
                
                add_page("Oh, you must think you're FUNNY, DON'T YOU!?", "White Rabbit");
            }
            else
            {
                Function[TextPageNumber] = function()
                {
                    audio_play_sound(sfxMetalImpact, 10, false);
                    
                    with (oTalksprite)
                        Image = 7;
                };
                
                add_page("You total JERK! You really couldn't have LEAD WITH THAT!?", "White Rabbit");
            }
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("Great, so this whole story was for NOTHING! Why did I even bother showing up!?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("...Okay, fine. No more dressing this up. Let me make this simple.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("Keep your hands off those robots. They're not yours to keep.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Enter = false;
            };
            
            add_page("...Deflated, the white rabbit returns to the darkness.", "");
            
            switch (global.Guard)
            {
                case 0:
                    add_page("So...maybe she justs wants these things to keep me safe...?", "Jeremy");
                    add_page("...No, who am I kidding? She's clearly got bad intentions, even I can see that!", "Jeremy");
                    add_page("Jeez, what do I do here? I just wanted to help, but I can't help but feel like that's put me in the middle of something...", "Jeremy");
                    add_page("...Something dangerous.", "Jeremy");
                    add_page("...", "Jeremy");
                    add_page("...I can still make the best out of a bad situation.", "Jeremy");
                    add_page("There's...only one of those robots left, right? And only one more of those masks...", "Jeremy");
                    add_page("...I know how I can turn this around.", "Jeremy");
                    break;
                
                case 1:
                    add_page("...I didn't know THAT thing was the killer, though...", "Mike");
                    add_page("Creepy...but whatever she wants him for could be a hell of a lot creepier.", "Mike");
                    add_page("I hate being in the middle of this...but I guess that's on me for taking the job.", "Mike");
                    add_page("...", "Mike");
                    add_page("...Well, it's too late to stop now, and I'm DEFINITELY not giving these things to her.", "Mike");
                    add_page("There's only...one more of both of these things, right?", "Mike");
                    add_page("...Wouldn't hurt to complete the set, would it?", "Mike");
                    break;
                
                case 2:
                    add_page("...Some nerve. She treats it like it's just some ghost story.", "Vanessa");
                    add_page("It's a tragedy for sure, what happened to those four kids...", "Vanessa");
                    add_page("...But that's all in the past now.", "Vanessa");
                    add_page("...Right?", "Vanessa");
                    add_page("...", "Vanessa");
                    add_page("...No. I'm not about to start believing those rumors.", "Vanessa");
                    add_page("Focus on the here and the now. I have a job to do, and I'm going to do it.", "Vanessa");
                    add_page("...I need to see this through to the end.", "Vanessa");
                    break;
                
                case 3:
                    add_page("Well, I suppose that explains the green thing's odor. I thought it was just me this whole time!", "Fritz");
                    add_page("...In fact, this whole thing stinks to high heaven.", "Fritz");
                    add_page("There's...a piece missing here.", "Fritz");
                    add_page("...", "Fritz");
                    add_page("...Ah, right! There's two, actually!", "Fritz");
                    add_page("I should go grab them.", "Fritz");
                    break;
                
                default:
                    add_page("...Some story, huh? But you know better than to believe in ghosts.", "");
                    add_page("But, still...whatever compelled you to go through with all of this does almost feel supernatural...in a way.", "");
                    add_page("...And who would you be to not see it through to the end?", "");
                    break;
            }
            
            Function[TextPageNumber] = function()
            {
                audio_stop_sound(musMidnight_Vanny);
                instance_create_depth(0, 0, 0, oTransitionMinigame);
            };
            
            break;
        
        case "Midnight_Night5_Ultimate":
            var Pronouns = (global.Guard == 2) ? ["she's", "she"] : ((global.Guard <= 3) ? ["he's", "he"] : ["they're", "they"]);
            
            Function[TextPageNumber] = function()
            {
                with (instance_create_depth(800, 0, 50, oTalksprite))
                {
                    Image = 0;
                    sprite_index = sTalksprites_Michael;
                }
                
                play_music(musMidnight_MissingChild);
                audio_sound_gain(musMidnight_MissingChild, 1, 0);
                audio_sound_gain(musMidnight_TheBoss, 1, 0);
                audio_sound_gain(sfxWindyAmbience, 0, 0);
            };
            
            add_page("Well...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page("It seems that despite our best efforts to warn you...", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                {
                    SecondarySprite = sTalksprites_Vanny;
                    switch_chars(4, 1);
                }
            };
            
            add_page("...You still wound up seeing this thing through to the end.", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 7;
            };
            
            add_page("Seriously, what is your deal!? Are you just doing this for fun!?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 6;
            };
            
            add_page("You didn't make ANYONE happy here! All you did was...TICK US OFF!!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(2, 0);
            };
            
            add_page("For once, I agree with her. This...really accomplished nothing.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Our goals are fundamentally incompatible. If this was your way of finding a compromise between us, I'm afraid it was all in vain.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("If you want to do any good with what you've collected here...you'll need to choose between us.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(5, 1);
            };
            
            add_page(string("Well, {0} not gonna side with YOU, that's for sure.", Pronouns[0]), "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 4;
            };
            
            add_page(string("...Though I also doubt {0}'ll want to side with me either, considering all that stuff I said last night...", Pronouns[1]), "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 5;
            };
            
            add_page("But hey, water under the bridge, eh?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("You've got four LOVELY little animatronics here... Why don't we let bygones be bygones and make the most out of them?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("I'll be sure to reward you HANDSOMELY if you do~!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    switch_chars(4, 0);
            };
            
            add_page("If you're smart, you won't fall for such an obvious bribe.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 1;
            };
            
            add_page("Listen, I understand that we may have gotten off on the wrong foot...but you do still have one last chance to do some good here.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 0;
            };
            
            add_page("Hand over those masks, and you'll never have to hear from either of us again.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 2;
            };
            
            add_page("Then, you'll be free to...do whatever it is you're trying to do here.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oTalksprite)
                    Image = 3;
            };
            
            add_page("Will you make the right choice?", "Hooded Man");
            
            if (!array_contains(global.Upgrades, UnknownEnum.Value_41))
            {
                add_page("Well, it seems no matter what decision you make here...somebody will be left behind. Some loose end will remain untied.", "");
                add_page("Perhaps under different circumstances, in another life...there would be some way to make both of them happy.", "");
                add_page("...But that life isn't the one you're living, so you'll have to choose.", "");
                add_page("Who will you go along with?", "");
                add_option("Michael", "ChoiceConfirmUlt_Good");
                add_option("Vanny", "ChoiceConfirmUlt_Evil");
                break;
            }
            else
            {
                if (global.Guard <= 3)
                    Skip[TextPageNumber] = true;
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Uh...well, I guess I just-.", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...Look, if you would just listen to me, I-.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Listen, you two have to understand that-.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well, I personally think that-.", "Fritz");
                        break;
                    
                    default:
                        add_page("You try to speak up, but before you can say a word...", "");
                        break;
                }
                
                Delay[TextPageNumber] = 120;
                
                Function[TextPageNumber] = function()
                {
                    audio_stop_sound(musMidnight_MissingChild);
                    audio_play_sound(sfxPhoneRing, 10, true);
                };
                
                Skip[TextPageNumber] = true;
                add_page(" ", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(2, 1);
                };
                
                add_page("...Uhh, who's that?", "White Rabbit");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("...Oh, that's my boss! Sorry, I have to take this.", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...It's my boss.", "Mike");
                        break;
                    
                    case 2:
                        add_page("...Give me a sec.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("...Ah! Hold on, let me take this.", "Fritz");
                        break;
                    
                    default:
                        add_page("It's your boss. You'd better pick up.", "");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    audio_stop_sound(sfxPhoneRing);
                    audio_play_sound(sfxPhonePickup, 10, false);
                };
                
                Delay[TextPageNumber] = 120;
                add_page("WAAAAAAAAAAHH!!", "The Boss");
                text_effect(0, 99, "Shake");
                
                Function[TextPageNumber] = function()
                {
                    play_music(musMidnight_TheBoss, 0.25);
                };
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("O-Oh, is everything alright?", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("...Is, uh, is everything alright? (I'm not getting fired, am I?)", "Mike");
                        break;
                    
                    case 2:
                        add_page("Woah, hey, is everything alright?", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Such visceral rage! What's the occasion?", "Fritz");
                        break;
                }
                
                if (global.Guard < 3)
                {
                    add_page("NO! EVERYTHING IS NOT ALRIGHT!", "The Boss");
                    text_effect(0, 2, "Shake");
                    text_effect(18, 20, "Shake");
                }
                else
                {
                    add_page("I've been SCAMMED! SWINDLED! HOODWINKED!", "The Boss");
                }
                
                add_page("When were you gonna tell me about these FILES, huh!?", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(0, 0);
                };
                
                add_page("Files? What files?", "Hooded Man");
                add_page("Eh? Is there another guy with you?", "The Boss");
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("O-Oh, yes, um, there is! Hold on, let me put you on speaker.", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("Uh...yeah. I'll put you on speaker.", "Mike");
                        break;
                    
                    case 2:
                        add_page("...I'll put you on speaker.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Ah, here, I'll put you on speaker so you can say hi!", "Fritz");
                        break;
                    
                    default:
                        add_page("You put your phone on speaker so the boss can talk to the others.", "");
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(0, 1);
                };
                
                add_page("Uh... Hi there, Mr. Bossman!", "White Rabbit");
                add_page("Hey, chump! It's me, the...", "The Boss");
                add_page("...Hey, wait a second! I recognize that voice! You're that creep who's been loitering outside my restaurant!", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(0, 0);
                };
                
                add_page("And you! The other guy! You two are trying to swindle my employees away, aren't you!?", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Ah, so YOU'RE the one who's decided to keep this walking corpse of a brand alive.", "Hooded Man");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 1;
                };
                
                add_page("I have to say, you're certainly living up to everything I expected you to be.", "Hooded Man");
                add_page("Bah, some nerve! Don't think I can't see what you're trying to do here.", "The Boss");
                add_page("You're trying to get my employees to do your dirty work for you...when the only person they do unpaid work for is ME!", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(4, 1);
                };
                
                add_page("Now, get lost before you cost me anymore of my time! My employee needs to get back to what REALLY matters here...", "The Boss");
                add_page("Making. Me. RRRRRRRRRRICH!!", "The Boss");
                text_effect(12, 99, "Shake");
                
                if (global.Guard <= 3)
                    Skip[TextPageNumber] = true;
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Um, well, I-I think that-.", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("If you'd all just quiet down for a second, I-.", "Mike");
                        break;
                    
                    case 2:
                        add_page("Well, I hardly think that-.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well, that's certainly a bit-.", "Fritz");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(1, 0);
                    
                    audio_play_sound(sfxMetalImpact, 10, false, 0.5);
                };
                
                add_page("Oh, what REALLY matters!?", "Hooded Man");
                add_page("...He snatched the phone right out of your hands.", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 3;
                };
                
                add_page("If you cared about what REALLY mattered, you wouldn't have bought this company in the first place!", "Hooded Man");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        Image = 4;
                };
                
                add_page("Dragging on its miserable legacy, all for a couple pennies...you're absolutely despicable!", "Hooded Man");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(5, 1);
                };
                
                add_page("Pssh, yeah, not to mention nowhere NEAR as charming as the old owner.", "White Rabbit");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(5, 0);
                };
                
                add_page("Quiet. You're not part of this.", "Hooded Man");
                
                if (global.Guard <= 3)
                    Skip[TextPageNumber] = true;
                
                switch (global.Guard)
                {
                    case 0:
                        add_page("Well, she is kind of-.", "Jeremy");
                        break;
                    
                    case 1:
                        add_page("For once, just-.", "Mike");
                        break;
                    
                    case 2:
                        add_page("If you two would just-.", "Vanessa");
                        break;
                    
                    case 3:
                        add_page("Well, if I could-.", "Fritz");
                        break;
                }
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(2, 1);
                };
                
                add_page("Come to think of it, I wouldn't exactly call YOU charming either. You're BOTH obnoxious.", "White Rabbit");
                add_page("Oh PLEASE! You wouldn't know the first thing about what makes a good manager!", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(5, 0);
                };
                
                add_page("Do either of you have any idea what kinds of decisions I have to make!? Like just last week!", "The Boss");
                add_page("My favorite pizza place jacked up the price on their garlic powder pizza, so I had to fire half my staff to maintain a profit!", "The Boss");
                
                Function[TextPageNumber] = function()
                {
                    audio_play_sound(sfxWindyAmbience, 10, true);
                    audio_sound_gain(sfxWindyAmbience, 1, 10000);
                    audio_sound_gain(musMidnight_TheBoss, 0, 10000);
                    audio_sound_gain(voc_tsTheBoss, 0, 10000);
                    audio_sound_gain(voc_tsMichael, 0, 10000);
                    audio_sound_gain(voc_tsVanny, 0, 10000);
                    audio_sound_gain(voc_tsDefault, 0, 10000);
                    
                    with (instance_create_depth(x, y, oTextBox.depth + 2, oFadeMachine))
                    {
                        FadeSeconds = 10;
                        FadeBox = true;
                        Alpha = 0;
                    }
                    
                    with (oTalksprite)
                        switch_chars(7, 1);
                };
                
                Skip[TextPageNumber] = true;
                Lock[TextPageNumber] = true;
                add_page("You OWN A PIZZERIA! Can't you just, I dunno, MAKE YOUR OWN!?.", "White Rabbit");
                Skip[TextPageNumber] = true;
                Lock[TextPageNumber] = true;
                add_page("Oh, please! Have you TRIED the pizza here? I've had motor oil that tasted better!.", "The Boss");
                Skip[TextPageNumber] = true;
                Lock[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(5, 0);
                };
                
                add_page("Oh, angels above, both of you, listen! NONE of you have a single clue what you're getting yourselves into!.", "Hooded Man");
                Skip[TextPageNumber] = true;
                Lock[TextPageNumber] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTalksprite)
                        switch_chars(2, 1);
                };
                
                add_page("What did he say about motor oil?.", "White Rabbit");
                Skip[TextPageNumber] = true;
                Lock[TextPageNumber] = true;
                add_page("Like I said, difficult decisions! You have no IDEA how expensive fast food is these days!.", "The Boss");
                Skip[TextPageNumber] = true;
                Delay[TextPageNumber] = 120;
                add_page(" ", "");
                Hide[TextPageNumber - 1] = true;
                
                Function[TextPageNumber] = function()
                {
                    with (oTextBox)
                        TextBoxSprite = sNOTHING;
                    
                    with (oFadeMachine)
                    {
                        FadeBox = false;
                        Alpha = 1;
                    }
                    
                    instance_destroy(oTalksprite);
                    oMidnightCutscene.sprite_index = sNOTHING;
                    audio_sound_gain(sfxWindyAmbience, 0.25, 0);
                    audio_stop_sound(musMidnight_TheBoss);
                    audio_sound_gain(musMidnight_TheBoss, 1, 0);
                    audio_sound_gain(voc_tsTheBoss, 1, 0);
                    audio_sound_gain(voc_tsMichael, 0.64, 0);
                    audio_sound_gain(voc_tsVanny, 0.5, 0);
                    audio_sound_gain(voc_tsDefault, 1, 0);
                };
                
                switch (global.Guard)
                {
                    case 0:
                    default:
                        add_page("You try to speak up, but as they ignore you time and time again, your voice grows quiet.", "");
                        add_page("You want to help all of them. You really, really do. But...", "");
                        add_page("...You can't please everybody, can you?", "");
                        add_page("No matter how hard you try... You can't make them all happy. If you help one of them, you'll just make the others upset.", "");
                        add_page("You don't know what's going on... You're in over your head, aren't you?", "");
                        add_page("But...", "");
                        add_page("...What if there was someone you could help?", "");
                        add_page("What if they were much, much closer than you thought?", "");
                        add_page("Putting a hand to your head, and sticking your other in your pocket, you notice...", "");
                        
                        Function[TextPageNumber] = function()
                        {
                            instance_create_depth(0, 0, depth, oTalbertReveal);
                        };
                        
                        add_page("...Those files you kept around to read later.", "");
                        add_page("Maybe, just maybe, these files can tell you everything you need to help everyone.", "");
                        add_page("And, if that's the case... If you really can make everyone happy...", "");
                        break;
                    
                    case 1:
                        add_page("...You furrow your brow watching the scene unfold in front of you.", "");
                        add_page("Thinking about your actions over the past few days, you wonder why you even went through any of it.", "");
                        add_page("Why? You took on so much unnecessary extra work for this job, and for what?", "");
                        add_page("For people who only care about themselves? So you can just get fired all over again?", "");
                        add_page("...You grit your teeth. Everybody's playing you for a fool, keeping you just enough in the dark so you'll help them.", "");
                        add_page("Why should you help someone who won't tell you everything, right?", "");
                        add_page("...But, maybe... The answers you seek are closer than you realize.", "");
                        add_page("Your hand drifts into your pocket, awkwardly looking for somewhere to put it, and that's when you feel it.", "");
                        
                        Function[TextPageNumber] = function()
                        {
                            instance_create_depth(0, 0, depth, oTalbertReveal);
                        };
                        
                        add_page("...Those files you bought earlier.", "");
                        add_page("You don't know who Talbert is, but...", "");
                        add_page("Without even opening them, you can sense it. The history everyone hid from you...", "");
                        add_page("...Until now.", "");
                        add_page("If you're only a few turns of the page away from the context you seek...", "");
                        break;
                    
                    case 2:
                        add_page("As you realize they've forgotten you're even standing there...", "");
                        add_page("...It dawns on you that you don't matter to them. All they care about is what you provide FOR them.", "");
                        add_page("You are a cog in their machine... but you can't power all three machines. You're not really sure if you even want to.", "");
                        add_page("Despite all the years of hard work, of dedication, of trying to do the right thing...", "");
                        add_page("...All you've done is keep the fire burning.", "");
                        add_page("Is that really it? Does all your life amount to just being means to an end for these people?", "");
                        add_page("...Maybe, though, you're just missing a piece of the puzzle.", "");
                        add_page("...As your hands fidget nervously into your pocket, your hand grazes something.", "");
                        
                        Function[TextPageNumber] = function()
                        {
                            instance_create_depth(0, 0, depth, oTalbertReveal);
                        };
                        
                        add_page("...Those spare files.", "");
                        add_page("Whoever put these together must have done an extensive study on the company, surely. You never read what's inside, but...", "");
                        add_page("...What if they found something you missed?", "");
                        add_page("What if what you've been looking for has been staring you in the face for years?", "");
                        add_page("If that were true... If these files can really, truly, help you bring this all to a close...", "");
                        break;
                    
                    case 3:
                        add_page("What a strange feeling, you think. For once, everybody isn't gawking at you.", "");
                        add_page("You have so much to say, and yet, you can't get anybody's attention.", "");
                        add_page("Your words falling on deaf ears isn't new to you, no... But to not even be heard at all? Paid no mind whatsoever? It's new to you, isn't it?", "");
                        add_page("They don't want to listen to your big breakthrough, your tremendous theory to put all the pieces together!", "");
                        add_page("But without evidence, a theory is just that. A theory.", "");
                        
                        Function[TextPageNumber] = function()
                        {
                            instance_create_depth(0, 0, depth, oTalbertReveal);
                        };
                        
                        add_page("...That's when you feel your hand drifting towards those files you bought earlier.", "");
                        add_page("...Your hand...stops...", "");
                        add_page("...", "");
                        add_page("...You already know, don't you? You're too keen. Too...\"clever.\"", "");
                        add_page("The unseen agent guiding your hand to those files... Invisible to others, but you've seen it from the start.", "");
                        add_page("When you wanted to read them after buying them, they stopped you.", "");
                        add_page("You realize now that whoever they were, they needed that information to stay unknown until the right moment.", "");
                        add_page("Evidently, that would mean the right moment is now. Untold research and scientific breakthroughs are just around the corner...", "");
                        add_page("...All puppeteered to come together by your unseen agent.", "");
                        add_page("But... If there's no reason for them to stay unseen anymore...", "");
                }
                
                add_page("...Then...", "");
                
                Function[TextPageNumber] = function()
                {
                    with (oTalbertReveal)
                        PuppetReveal = true;
                    
                    audio_stop_sound(sfxWindyAmbience);
                };
                
                add_page("...Why don't we read them...together?", "");
                
                if (global.Guard == 3)
                    add_page("...Ah, I KNEW the voice in my head sounded different!", "Fritz");
                
                Function[TextPageNumber] = function()
                {
                    room_goto(TalbertRoom);
                };
                
                break;
            }
            
            break;
        
        case "EndingArgument":
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("What!?", "The Boss");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Let me tell you, if the health department sees how much GARLIC is going into those pizzas-.", "Hooded Man");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Bah, health department, schmealth department! The bots'll deal with the health inspectors before they even get through the door!.", "The Boss");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Oh, there you go again! Do you have ANY concern for your employees? Or ANYONE, for that matter?.", "Hooded Man");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Hey, nobody got anywhere without some sacrifices, eh?.", "The Boss");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("You're- you're letting them DIE here!.", "Hooded Man");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Bah! You act like I'M the one killing them!.", "The Boss");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                    vanny_switch();
            };
            
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("You might as well be!.", "Hooded Man");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Hey, listen, YOUR dad was the one who programmed them to do that, not me!.", "The Boss");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                    vanny_switch();
            };
            
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Guys?.", "White Rabbit");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Oh, and that somehow absolves you?.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                    vanny_switch();
            };
            
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Bah, whatever! Complain all you want! I'm performing a public service here!.", "The Boss");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("The people need pizza, and I'm giving them pizza! You act like that's a BAD thing!.", "The Boss");
            Skip[TextPageNumber] = true;
            Lock[TextPageNumber] = true;
            add_page("Oh, for the love of-.", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                {
                    vanny_switch(0.2);
                    michael_switch();
                }
                
                audio_sound_gain(voc_tsVanny, 1, 0);
                audio_stop_sound(sfxDSAmbience);
                audio_play_sound(sfxMetalImpact, 15, false, 0.5);
            };
            
            add_page("GUYS!!", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                    vanny_switch();
                
                audio_sound_gain(voc_tsVanny, 0.5, 0);
            };
            
            add_page("...Do you see that? Above the pizzeria?", "White Rabbit");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                    michael_switch();
            };
            
            add_page("Huh...?", "Hooded Man");
            
            Function[TextPageNumber] = function()
            {
                with (oEndingArgumentCutscene)
                {
                    Transitioning = true;
                    Timer = 179.5;
                    audio_play_sound(sfxSwoosh, 10, false);
                }
            };
            
            break;
        
        case "Midnight_Night5_Money":
            switch (global.Guard)
            {
                case 0:
                    add_page("Phew...first week in the bag!", "Jeremy");
                    Skip[TextPageNumber] = true;
                    add_page("I could definitely use some rest...Time to go home and-.", "Jeremy");
                    break;
                
                case 1:
                    add_page("Alright, that's it! That's my work week over with.", "Mike");
                    Skip[TextPageNumber] = true;
                    add_page("Now I can finally take a break...If I had to work one more minute at this place I think I'd-.", "Mike");
                    break;
                
                case 2:
                    add_page("First week done and dusted!", "Vanessa");
                    Skip[TextPageNumber] = true;
                    add_page("I'm looking forward to getting some rest...This whole time I've been really hoping I could-.", "Vanessa");
                    break;
                
                case 3:
                    add_page("...Oh, is it over already?", "Fritz");
                    add_page("What a shame! It felt like things were just getting started...", "Fritz");
                    Skip[TextPageNumber] = true;
                    add_page("If only I could work just another day-", "Fritz");
                    break;
            }
            
            money_route_split(false, false);
            break;
        
        default:
            break;
    }
    
    add_page("", "");
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_14 = 14,
    Value_41 = 41
}
