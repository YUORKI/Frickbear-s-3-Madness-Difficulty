image_index = 0;

with (MinuteHand)
{
    x = other.x;
    y = other.y;
    sprite_index = sSearchesUpFreddyClockForgetsTheL;
    image_index = 2;
    image_angle = floor(global.Timer) * 6;
}

with (HourHand)
{
    x = other.x;
    y = other.y;
    sprite_index = sSearchesUpFreddyClockForgetsTheL;
    image_index = 3;
    image_angle = floor(global.Timer) * 0.5;
}
