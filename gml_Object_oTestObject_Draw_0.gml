if (!RFistExtended)
{
    FistX = lengthdir_x(8, Timer - 180);
    FistY = lengthdir_y(8, Timer - 180);
    FistAngle = 0;
    FistSprite = 0;
    PunchFrame = 0;
}
else
{
    if (PunchFrame <= 5)
    {
        FistX = irandom_range(-10, 10) / (PunchFrame + 1);
        FistY = irandom_range(-10, 10) / (PunchFrame + 1);
    }
    else
    {
        FistX += ((-16 - FistX) / 5);
        FistY += ((-8 - FistY) / 5);
        FistAngle += ((15 - FistAngle) / 2);
    }
    
    FistSprite = 1;
    PunchFrame++;
}

if (mouse_check_button(mb_right))
    draw_sprite_ext(sFists, FistSprite, 368 + FistX, 360 + FistY, 1, 1, FistAngle, c_white, 1);
else
    draw_sprite_ext(sFists, 0, 368 + lengthdir_x(8, Timer - 180), 360 + lengthdir_y(8, Timer - 180), 1, 1, 0, c_white, 1);

if (mouse_check_button(mb_left))
    draw_sprite_ext(sFists, FistSprite, 272 - FistX, 360 + FistY, -1, 1, 0 - FistAngle, c_white, 1);
else
    draw_sprite_ext(sFists, 0, 272 - lengthdir_x(8, Timer), 360 + lengthdir_y(8, Timer), -1, 1, 0, c_white, 1);

Timer += 3;
RFistExtended = mouse_check_button(mb_right) ^^ mouse_check_button(mb_left);
