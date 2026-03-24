event_inherited();
MaxWidth = 8;

function generate_kill_list()
{
    Killables = [];
    
    for (var i = 0; i < array_length(global.AILevels); i++)
    {
        if (global.AILevels[i] > 20)
            continue;
        
        if (character_active(i))
            array_push(Killables, i);
    }
    
    if (instance_exists(oSalvage))
        array_push(Killables, UnknownEnum.Value_49);
}

FadeOut = false;
OriginalX = 0;

enum UnknownEnum
{
    Value_49 = 49
}
