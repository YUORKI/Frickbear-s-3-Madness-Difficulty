image_index = 0;
JumpX += ((320 - JumpX) / 5);
JumpY += ((180 - JumpY) / 5);
SizeBody += (((1.25 - SizeBody) / 10) + 0.005);
SizeHead += (((1.5 - SizeHead) / 16) + 0.01);
Frame += 1;

if (Frame >= 60)
{
    JawOffset += ((JawOffset / 4) + 1);
    JawOffset = min(JawOffset, 360);
}

if (Frame == 65)
    audio_play_sound(sfxBiteOf87, 50, false);

if (Frame == 90)
{
    with (oCamera3DMaze)
        CurrentPalette = array_length(Palettes) - 1;
}
