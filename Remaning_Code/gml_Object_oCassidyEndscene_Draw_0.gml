if (Frame == 0)
{
    audio_play_sound(sfxFifthEndingReveal, 30, false, 1, 0, 0.5);
    audio_sound_gain(sfxWindyAmbience, 0, 0);
}

var CassRevealTime = 240;
var OffsetA = MainOffset * binary_to_sign(floor(Frame / 2) % 2);
var OffsetB = SecondaryOffset * binary_to_sign(floor(Frame / 2) % 2);

if (Frame > CassRevealTime)
{
    MainOffset += ((640 - MainOffset) / 10);
    SecondaryOffset -= (SecondaryOffset / 10);
}

if (!VisualMode)
{
    draw_sprite_ext(sCassidyCutscene, (floor(Frame / 20) % 3) + (CurCassidy * 3), 320 + OffsetB, (1 - Squish) * 240, 1 / Squish, Squish, 0, c_white, 1);
    draw_sprite_ext(sFredbear_Fidget, Frame / 2, OffsetA, 0, 1, 1, 0, c_white, Alpha);
}
else
{
    draw_sprite_ext(GuardSprites, floor(Frame / 20) % 3, 328, 2, 1, 1, 0, c_white, 1);
    draw_sprite_ext(GuardSprites, (global.Guard * 2) + CurCassidy + 3, 320, (1 - Squish) * 240, 1 / Squish, Squish, 0, c_white, 1);
}

if (Frame == CassRevealTime)
{
    audio_stop_sound(sfxFifthEndingReveal);
    audio_play_sound(sfxPFFAppear, 10, false);
    audio_play_sound(sfxWindyAmbience, 10, true);
}

if (Frame == (CassRevealTime + 180))
{
    with (instance_create_depth(0, 0, depth - 1, oTextBox))
    {
        game_text("CassidyEndscene");
        TextBoxSprite = sNOTHING;
    }
    
    audio_sound_gain(sfxWindyAmbience, 0.5, 2000);
}

if (Frame >= 0)
    Alpha += (1 / CassRevealTime);

Frame += 1;
Squish += SquishSpeed;
SquishSpeed = lerp(SquishSpeed, (1 - Squish) * 0.2, 0.5);
