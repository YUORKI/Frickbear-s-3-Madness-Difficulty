set_target_to_ui();

if (Delay == 0)
    Scream = bitcrush_sound(sfxJumpscare_Funny_Wega, 0, 0, false, 2, 4);

if (Delay <= 0)
{
    JumpFrames++;
    
    if (JumpFrames >= 15)
    {
        audio_stop_sound(Scream);
        instance_destroy();
    }
}

if (JumpFrames > 0)
    draw_sprite(sBear5Jumpscare, 0, 0, 0);

Delay--;
surface_reset_target();
