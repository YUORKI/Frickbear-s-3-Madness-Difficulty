Ad = irandom(sprite_get_number(sHelpyAd) - 1);
HelpyAnimation = irandom(1);
HelpyFrame = 0;
Direction = 0;
XSpeed = 0;
YSpeed = 0;

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
