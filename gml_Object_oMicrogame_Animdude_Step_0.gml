if (Completed)
    exit;

if (StartupFrames > 0)
{
    if ((StartupFrames % 60) == 0)
        audio_play_sound(sfxBitCountdown, 10, false);
    
    StartupFrames--;
    
    if (StartupFrames == 0)
    {
        audio_play_sound(sfxBitDash, 10, false);
        bitcrush_sound(mus_Animdude, 0, 0, false, 0.25, 8);
    }
    
    exit;
}

XVelocity = Speed;

if ((input_check_pressed(UnknownEnum.Value_0) || mouse_check_button_pressed(mb_left)) && place_meeting(x, y + 1, oAnimdude_Wall))
{
    YVelocity = -3 * Speed;
    audio_play_sound(sfxBitJump, 5, false);
}

if (place_meeting(x + XVelocity, y, oAnimdude_Wall))
{
    while (!place_meeting(x + sign(XVelocity), y, oAnimdude_Wall))
        x += sign(XVelocity);
    
    XVelocity = 0;
}

x += XVelocity;

if (place_meeting(x, y + YVelocity, oAnimdude_Wall))
{
    while (!place_meeting(x, y + sign(YVelocity), oAnimdude_Wall))
        y += sign(YVelocity);
    
    YVelocity = 0;
}

y += YVelocity;
YVelocity += (0.1 * Speed * Speed);

if (x < -16)
    y = 96;

if (x > 304)
{
    x = -16;
    y = 96;
    Level++;
    generate_level(Level % 5);
    add_tokens(1);
}

if (y > 160 || place_meeting(x, y, oAnimdude_Hazard))
{
    x = -96;
    y = 96;
    YVelocity = 0;
    audio_play_sound(sfxBitPunish, 10, false);
    generate_level(Level);
    Lives--;
    
    if (Lives == 0)
    {
        audio_play_sound(sfxBitFail, 10, false);
        end_microgame();
        instance_destroy();
    }
}

if (place_meeting(x, y, oAnimdude_Trophy))
{
    Completed = true;
    instance_destroy(oAnimdude_Object);
    audio_play_sound(sfxBitBoost, 10, false);
    audio_stop_sound(mus_Animdude);
    block_tokens();
    global.MicrogameWin = true;
    end_microgame();
}

enum UnknownEnum
{
    Value_0
}
