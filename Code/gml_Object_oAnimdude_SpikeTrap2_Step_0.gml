if (instance_exists(oAnimdude_Player))
{
    if (oAnimdude_Player.x > (x - 96) && !Activated)
    {
        Fallspeed = oAnimdude_Player.Speed * 0.75;
        Activated = true;
        audio_play_sound(sfxBitThud, 10, false);
    }
}

if (place_meeting(x, y + Fallspeed, oAnimdude_Wall))
{
    while (!place_meeting(x, y + (sign(Fallspeed) * 0.1), oAnimdude_Wall))
        y += (sign(Fallspeed) * 0.1);
    
    Fallspeed = 0;
}

y += Fallspeed;

if (y > 192)
    instance_destroy();
