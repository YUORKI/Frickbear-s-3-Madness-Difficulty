if (character_active(UnknownEnum.Value_38))
{
    sprite_index = sCandyBowl;
    
    if (x < 1000)
        image_index = 0;
    else
        image_index = 1;
    
    if (place_meeting(x, y, o3DMouse))
    {
        image_angle = irandom_range(-2, 2);
        
        if (mouse_check_button_pressed(mb_left))
        {
            with (instance_create_depth(0, 0, 10, oDreadbearCandy))
                Color = other.image_index;
        }
    }
    else
    {
        image_angle = 0;
    }
}
else
{
    sprite_index = sNOTHING;
}

DrawDepth = -5;

enum UnknownEnum
{
    Value_38 = 38
}
