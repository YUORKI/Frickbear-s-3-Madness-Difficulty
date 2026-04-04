Ad = irandom(sprite_get_number(sFredbearAd) - 1);
Direction = (irandom(3) * 90) - 45;
XSpeed = lengthdir_x(3, Direction);
YSpeed = lengthdir_y(3, Direction);

function movement()
{
    if ((x + sprite_width + XSpeed) >= 640)
    {
        x = 640 - sprite_width;
        x += XSpeed;
        XSpeed *= -1;
    }
    
    if ((x + XSpeed) < 0)
    {
        x = 0;
        x += XSpeed;
        XSpeed *= -1;
    }
    
    x += XSpeed;
    
    if ((y + sprite_height + YSpeed) >= 360)
    {
        y = 360 - sprite_height;
        y += YSpeed;
        YSpeed *= -1;
    }
    
    if ((y + YSpeed) < 0)
    {
        y = 0;
        y += YSpeed;
        YSpeed *= -1;
    }
    
    y += YSpeed;
}
