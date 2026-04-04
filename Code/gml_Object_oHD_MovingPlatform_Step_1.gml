var XDif = x;
var YDif = y;
var oPhysicsObject = oHD_PhysicsObject;
var PlatformInteractions = ds_list_create();
var SomeoneIsOnTop = 0;

if (place_meeting(x, y - 1, oPhysicsObject))
    SomeoneIsOnTop = instance_place_list(x, y - 1, oPhysicsObject, PlatformInteractions, false);

x = round(OriginalX + (dsin(MovementDirection) * MovementRange * dsin(Timer + BaseTimer)));
y = round(OriginalY + (dcos(MovementDirection) * MovementRange * dsin(Timer + BaseTimer)));
XDif = x - XDif;
YDif = y - YDif;

if (SomeoneIsOnTop != 0 && YDif >= 0)
{
    for (var i = 0; i < ds_list_size(PlatformInteractions); i++)
    {
        with (ds_list_find_value(PlatformInteractions, i))
        {
            if (place_meeting(x + XDif, y, oHD_WallParent))
            {
                while (!place_meeting(x + sign(XDif), y, oHD_WallParent))
                    x += sign(XDif);
            }
            else
            {
                x += XDif;
            }
            
            if (place_meeting(x, y + YDif, oHD_WallParent))
            {
                while (!place_meeting(x, y + sign(YDif), oHD_WallParent))
                    y += sign(YDif);
            }
            else
            {
                y = other.bbox_top - (bbox_bottom - y);
            }
        }
    }
}

ds_list_clear(PlatformInteractions);

if (place_meeting(x, y, oPhysicsObject))
{
    instance_place_list(x, y, oPhysicsObject, PlatformInteractions, false);
    
    for (var i = 0; i < ds_list_size(PlatformInteractions); i++)
    {
        with (ds_list_find_value(PlatformInteractions, i))
        {
            if (place_meeting(x + XDif, y + YDif, oHD_WallParent) && !place_meeting(x, y + YDif, oHD_WallParent))
            {
                while (!place_meeting(x + sign(XDif), y + YDif, oHD_WallParent))
                    x += sign(XDif);
            }
            else
            {
                x += XDif;
            }
            
            if (place_meeting(x, y, other))
                y += YDif;
            
            while (place_meeting(x, y, other))
            {
                show_debug_message("If this triggers tell Lelo");
                HP = 0;
            }
            
            if (place_meeting(x, y, oHD_WallParent))
                HP = 0;
        }
    }
}

Timer += 1;
ds_list_clear(PlatformInteractions);
ds_list_destroy(PlatformInteractions);
