if (instance_exists(oAnimdude_Player))
{
    if (oAnimdude_Player.x > (x + 16) && !Activated)
    {
        Activated = true;
        audio_play_sound(sfxBitThud, 10, false);
    }
}

if (Activated)
    FloorOffset = min(FloorOffset + oAnimdude_Player.Speed, 128);
