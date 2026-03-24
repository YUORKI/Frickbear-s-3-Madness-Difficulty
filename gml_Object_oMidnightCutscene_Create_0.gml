application_surface_draw_enable(false);
audio_stop_all();
Frame = 0;
FadeAlpha = 1;
Conversation = "None";

switch (global.Night)
{
    case 1:
        Conversation = "Midnight_Night1";
        break;
    
    case 2:
        if (currently_ultimate())
            Conversation = "Midnight_Night2_Ultimate";
        else if (currently_good())
            Conversation = "Midnight_Night2_Michael";
        else if (currently_evil())
            Conversation = "Midnight_Night2_Vanny";
        else
            room_goto(MinigameStartup);
        
        break;
    
    case 3:
        if (has_been_ultimate())
        {
            if (currently_ultimate())
                Conversation = "Midnight_Night3_Ultimate";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_good())
        {
            if (currently_good())
                Conversation = "Midnight_Night3_Michael";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_evil())
        {
            if (currently_evil())
                Conversation = "Midnight_Night3_Vanny";
            else
                Conversation = "Midnight_Failed";
        }
        else
        {
            room_goto(MinigameStartup);
        }
        
        break;
    
    case 4:
        if (has_been_ultimate())
        {
            if (currently_ultimate())
                Conversation = "Midnight_Night4_Ultimate";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_good())
        {
            if (currently_good())
                Conversation = "Midnight_Night4_Michael";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_evil())
        {
            if (currently_evil())
                Conversation = "Midnight_Night4_Vanny";
            else
                Conversation = "Midnight_Failed";
        }
        else
        {
            room_goto(MinigameStartup);
        }
        
        break;
    
    case 5:
        if (has_been_ultimate())
        {
            if (currently_ultimate())
                Conversation = "Midnight_Night5_Ultimate";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_good())
        {
            if (currently_good())
                Conversation = "Midnight_Night5_Michael";
            else
                Conversation = "Midnight_Failed";
        }
        else if (has_been_evil())
        {
            if (currently_evil())
                Conversation = "Midnight_Night5_Vanny";
            else
                Conversation = "Midnight_Failed";
        }
        else if (array_contains(global.Upgrades, UnknownEnum.Value_41))
        {
            Conversation = "Midnight_Night5_Money";
        }
        else
        {
            room_goto(Credits);
        }
        
        break;
    
    case 6:
        if (global.Route == UnknownEnum.Value_4)
            room_goto(CassidyEnding);
        else
            room_goto(Credits);
        
        break;
}

show_debug_message(Conversation);

if (skip_cutscenes() && global.Night > 2 && global.Night < 5)
    room_goto(MinigameStartup);

enum UnknownEnum
{
    Value_4 = 4,
    Value_41 = 41
}
