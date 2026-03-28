image_index = floor(Frame);
Frame += 0.5;

if ((Frame * 2) == 94)
{
    audio_stop_sound(sfxFredbearGrowl2);
    room_goto(Fredbear_GameOver);
    texturegroup_unload("FinalBossJumpscare");
}
