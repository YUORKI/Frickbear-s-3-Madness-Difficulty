if (place_meeting(x + (Speed * Direction), y, oHD_WallParent))
{
    while (!place_meeting(x + Direction, y, oHD_WallParent))
        x += Direction;
    
    Direction *= -1;
}

if (!place_meeting(x + sprite_width, y + 1, oHD_WallParent))
{
    while (place_meeting(x + sprite_width, y + 1, oHD_WallParent))
        x += Direction;
    
    Direction *= -1;
}

x += (Direction * Speed);
image_xscale = Direction;
