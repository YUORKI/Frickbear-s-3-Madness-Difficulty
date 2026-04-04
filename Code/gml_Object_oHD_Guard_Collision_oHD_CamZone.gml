if (LockZone != other)
{
    LockZone = other;
    oHappiestDayDrawer.LockZone = other;
    
    with (oHappiestDayObject)
        instance_activate_object(self);
    
    if (!place_meeting(x, y, other))
        instance_deactivate_object(self);
}
