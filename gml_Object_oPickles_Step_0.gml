if (place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left) && !global.CamUp)
{
    audio_play_sound(sfxTaunt, 15, false);
    AngleOffset = 360 * random_sign();
    YSpeed = -7;
}

image_angle = AngleOffset;
AngleOffset *= 0.85;

if ((y + YSpeed) > OriginalY)
{
    y = OriginalY;
    YSpeed *= -0.25;
}
else
{
    y += YSpeed;
    YSpeed += 0.5;
}
