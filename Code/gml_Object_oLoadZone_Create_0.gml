ZoneSet = false;
Instances = -1;
List = -1;
Active = false;
ZoneID = image_index;
UnloadZones = [];

switch (room)
{
    case MinigameMaze_2:
        switch (ZoneID)
        {
            case 0:
                UnloadZones = [2, 3];
                break;
            
            case 1:
                UnloadZones = [4];
                break;
            
            case 2:
                UnloadZones = [0, 4];
                break;
            
            case 3:
                UnloadZones = [0, 2, 4];
                break;
            
            case 4:
                UnloadZones = [1, 2, 3];
                break;
        }
        
        break;
    
    case MinigameMaze_4:
        switch (ZoneID)
        {
            case 0:
                UnloadZones = [2, 3];
                break;
            
            case 1:
                UnloadZones = [2];
                break;
            
            case 2:
                UnloadZones = [0, 1, 3];
                break;
            
            case 3:
                UnloadZones = [0, 2];
                break;
        }
        
        break;
}

function activate_objects(arg0 = false)
{
    if (Instances > 0)
    {
        for (var i = 0; i < Instances; i++)
        {
            if (instance_exists(ds_list_find_value(List, i)))
                ds_list_find_value(List, i).InZone = true;
        }
    }
    
    Active = true;
    
    if (!arg0)
        exit;
    
    with (oLoadZone)
        deactivate_objects();
    
    with (oLoadZone)
    {
        if (!array_contains(other.UnloadZones, ZoneID))
            activate_objects();
    }
}

function deactivate_objects()
{
    if (Instances > 0)
    {
        for (var i = 0; i < Instances; i++)
        {
            if (instance_exists(ds_list_find_value(List, i)))
                ds_list_find_value(List, i).InZone = false;
        }
    }
    
    Active = false;
}
