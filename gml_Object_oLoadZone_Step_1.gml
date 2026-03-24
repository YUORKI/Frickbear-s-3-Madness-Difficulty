if (!ZoneSet)
{
    List = ds_list_create();
    Instances = instance_place_list(x, y, oMaze_Object, List, false);
    ZoneSet = true;
    
    if (ZoneID == 0)
        activate_objects();
    else
        deactivate_objects();
}
