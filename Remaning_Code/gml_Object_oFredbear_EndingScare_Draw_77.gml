global.Timer = 359;
set_target_to_ui();
draw_sprite_ext(sFlashlight, 0, 320, 180, 1, 1, 0, -1, global.Brightness);
image_index = clamp(floor(Frame), 0, 109);

if (Frame >= 0)
{
    draw_self();
}
else if (Frame < -60)
{
    var BrightnessAmount = lerp(1, 0.5, (Frame + 120) / 60);
    global.Brightness = random_range(BrightnessAmount, BrightnessAmount * 2);
}

if (Frame == -60)
    global.Brightness = 1;

if (Frame == 4)
    audio_play_sound(sfxSwoosh, 50, false, 1, 0, 0.5);

if (Frame == 28)
    audio_play_sound(sfxFredbearGrowl_EndScare, 50, false);

if (Frame == 75)
    audio_play_sound(sfxFredbearGrowl_Readying, 50, false);

if (Frame == 90)
    audio_play_sound(sfxFredbearGrowl_Pain, 50, false);

if (Frame < 0)
    Frame++;
else if (Frame < 25)
    Frame += 0.25;
else
    Frame += 0.5;

if (Frame == 109)
{
    audio_stop_all();
    global.Brightness = 0;
    win_night();
    instance_destroy(oPersistentPauser);
}

surface_reset_target();
