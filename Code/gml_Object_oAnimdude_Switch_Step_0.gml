if (place_meeting(x, y, oAnimdude_Player) && !Activated)
{
    Activated = true;
    audio_play_sound(sfxBitThud, 10, false);
    audio_play_sound(sfxBitKnockout, 10, false);
    
    with (oAnimdude_Dragon)
        Fallspeed = oAnimdude_Player.Speed * 4;
}

image_index = Activated;
