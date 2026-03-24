draw_set_font(global.FontHanddrawn);

if (keyboard_check(vk_anykey))
    TimeSinceLastInput = 0;
else
    TimeSinceLastInput++;

var i;

for (i = 0; i < array_length(PreviousInputs); i++)
{
    var Col = PreviousInputs[i].LineColor;
    draw_text_color(8, (8 + (i * 32)) - PrompterOffset, "> " + PreviousInputs[i].Text, Col, Col, Col, Col, 1);
}

if (keyboard_check_pressed(vk_enter))
{
    output(CurrentLine, 4210752);
    var SplitLine = string_split(CurrentLine, " ");
    CurrentLine = "";
    
    if (is_array(SplitLine))
    {
        if (SplitLine[0] == "unlock")
        {
            switch (SplitLine[1])
            {
                default:
                    output("ERR: Invalid command.", 255);
                    break;
                
                case "lunaticmode":
                    global.UnlockedAnimatronics[UnknownEnum.Value_68] = true;
                    output("You can now play on Lunatic difficulty!", 65280);
                    break;
                
                case "animatronics":
                    output("All 47 animatronics have been unlocked!", 65280);
                    
                    for (i = 0; i <= UnknownEnum.Value_46; i++)
                        global.UnlockedAnimatronics[i] = true;
                    
                    break;
                
                case "pages":
                    output("All gallery pages unlocked!", 65280);
                    
                    for (i = 0; i < array_length(global.UnlockedAnimatronics); i++)
                        global.UnlockedAnimatronics[i] = true;
                    
                    break;
                
                case "ultimateroute":
                    add_flag("FredbearCloser_Slacker");
                    add_flag("FredbearCloser_Good");
                    add_flag("FredbearCloser_Evil");
                    add_flag("FredbearCloser_Money");
                    global.UnlockedAnimatronics[UnknownEnum.Value_56] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_61] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_63] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_62] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_15] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_31] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_30] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_29] = true;
                    output("Recieved credit for all other endings!", 65280);
                    break;
                
                case "extras":
                    global.UnlockedAnimatronics[UnknownEnum.Value_56] = true;
                    output("You can now access the extras menu!", 65280);
                    break;
                
                case "minigames":
                    global.UnlockedMinigames = array_create(array_length(global.UnlockedMinigames), true);
                    output("You can now access all minigames!", 65280);
                    break;
                
                case "trophies":
                    global.UnlockedTrophies = array_create(array_length(global.UnlockedTrophies), true);
                    output("Got credit for all trophies!", 65280);
                    break;
            }
        }
        else if (SplitLine[0] == "room")
        {
            var Room = asset_get_index(SplitLine[1]);
            
            if (Room != -1)
                room_goto(Room);
            else
                output("ERR: Room does not exist.", 255);
        }
        else if (SplitLine[0] == "devmode")
        {
            if (!global.DevMode)
            {
                global.DevMode = true;
                output("Developer mode enabled.", 65280);
            }
            else
            {
                global.DevMode = false;
                output("Developer mode disabled.", 65280);
            }
        }
        else if (SplitLine[0] == "boss")
        {
            global.Night = 6;
            
            if (SplitLine[1] == "Salvage")
                global.Route = UnknownEnum.Value_3;
            else if (SplitLine[1] == "Nightmare")
                global.Route = UnknownEnum.Value_2;
            
            room_goto(NightOpening);
        }
        else if (SplitLine[0] == "cutscene")
        {
            var Cutscene = SplitLine[1];
            var Night = SplitLine[2];
            global.Night = real(Night);
            global.Upgrades = [];
            global.SalvagedMasks = [false, false, false, false];
            global.SalvagedScraps = [false, false, false, false];
            
            if (Cutscene == "ultimate" || Cutscene == "good")
                global.SalvagedMasks = [true, true, true, true];
            
            if (Cutscene == "ultimate" || Cutscene == "evil")
                global.SalvagedScraps = [true, true, true, true];
            
            if (Cutscene == "failed")
            {
                global.SalvagedMasks = [global.Night > 2, global.Night > 3, global.Night > 4, global.Night > 5];
                global.SalvagedScraps = [global.Night > 2, global.Night > 3, global.Night > 4, global.Night > 5];
            }
            
            if (array_length(SplitLine) > 3)
            {
                if (SplitLine[3] == "talbert")
                    global.Upgrades = [UnknownEnum.Value_41];
            }
            
            room_goto(MidnightCutscnes);
        }
    }
}

if (keyboard_check(vk_backspace))
    BackspaceHeld++;
else
    BackspaceHeld = 0;

if ((keyboard_check_pressed(vk_backspace) || BackspaceHeld >= 30) && string_length(CurrentLine) > 0)
{
    show_debug_message(string("BACKSPACE PRESSED: {0}", CurrentLine));
    CurrentLine = string_copy(CurrentLine, 0, string_length(CurrentLine) - 1);
    keyboard_string = "";
}

if (keyboard_string != "")
{
    CurrentLine += keyboard_string;
    keyboard_string = "";
}

draw_text_color(8, (8 + (i * 32)) - PrompterOffset, "> " + CurrentLine + (((floor(TimeSinceLastInput / 30) % 2) == 0) ? "_" : ""), c_white, c_white, c_white, c_white, 1);
PrompterOffset += ((max((i - 9) * 32, 0) - PrompterOffset) / 10);

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_15 = 15,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_41 = 41,
    Value_46 = 46,
    Value_56 = 56,
    Value_61 = 61,
    Value_62,
    Value_63,
    Value_68 = 68
}
