ready = false;

if (!np_initdiscord("1478121103720190195", false, 0))
    instance_destroy();

LineTop = "In Menu";
LineBottom = "";
alarm[0] = room_speed * 2;
CurrentRoom = WarningScreen;
UpdateDelay = 0;

function update_discord()
{
    var Update = true;
    var CurTop = LineTop;
    var CurBottom = LineBottom;
    
    switch (room)
    {
        case Office:
        case NightOpening:
            if (global.Night == "Custom")
            {
                LineTop = "Custom Night";
                
                if (global.ChallengeTitle != "None")
                    LineBottom = global.ChallengeTitle;
                else
                    LineBottom = "";
            }
            else
            {
                LineTop = is_numeric(global.Night) ? string("Night {0}", global.Night) : string("{0} Night", global.Night);
                LineBottom = "In Office";
            }
            
            if (boss_fight_night())
                LineBottom = "Fighting Boss";
            
            break;
        
        case MinigameMaze_1:
        case MinigameMaze_2:
        case MinigameMaze_3:
        case MinigameMaze_4:
        case MinigameMaze_5:
            LineTop = is_numeric(global.Night) ? string("Night {0}", global.Night) : string("{0} Night", global.Night);
            LineBottom = "Salvaging";
            break;
        
        case Extras:
            LineTop = "Browsing Extras";
            LineBottom = "";
            break;
        
        case CustomNightMenu:
        case TitleScreenMap:
            LineTop = "In Menu";
            LineBottom = "";
            break;
        
        default:
            Update = false;
            break;
    }
    
    if (CurTop == LineTop && CurBottom == LineBottom)
        Update = false;
    
    if (Update)
    {
        np_setpresence(LineBottom, LineTop, "astraicon", "");
        UpdateDelay = 600;
        CurrentRoom = room;
    }
    else
    {
        UpdateDelay = 30;
    }
}
