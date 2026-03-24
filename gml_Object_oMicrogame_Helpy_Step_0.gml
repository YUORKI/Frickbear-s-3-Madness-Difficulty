if (!instance_exists(oPopupFredbear) && global.MicrogameWin == false)
{
    global.MicrogameWin = true;
    audio_play_sound(sfxBitCollect, 10, false);
    end_microgame();
}
