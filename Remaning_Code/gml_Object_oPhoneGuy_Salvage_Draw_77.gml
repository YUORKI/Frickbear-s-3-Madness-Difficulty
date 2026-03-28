set_target_to_ui();
draw_set_halign(fa_center);

if (CurrentSound == sfxNOTHING && array_length(SoundQueue) > 0)
{
    var Sound = SoundQueue[0];
    var Subtitles = subtitle(Sound);
    CurrentSound = Sound;
    var Gain = array_contains([sfxPhoneRing, sfxPhonePickup, voc_Michael_SalvagePhase1Part1, voc_Michael_SalvagePhase1Part1_Pissed, voc_Michael_SalvagePhase1Part2, voc_Michael_SalvagePhase2, voc_Michael_SalvagePhase3, voc_Michael_SalvagePhase4, voc_Michael_SalvagePhase5], CurrentSound) ? 1 : 0.75;
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    
    if (ReverbQueue[0])
        SoundPlaying = reverb_sound(Sound, 0, 0, false, Gain);
    
    SoundPlaying = simple_sound(Sound, 0, 0, false, Gain);
    SubtitleEntry = 0;
    array_delete(SoundQueue, 0, 1);
    array_delete(ReverbQueue, 0, 1);
}

if (CurrentSound != sfxNOTHING)
{
    draw_set_halign(fa_center);
    var CharName = "";
    
    if (array_contains([voc_Salvage_Phase2, voc_Salvage_Phase3, voc_Salvage_Phase4, voc_Salvage_Phase5], CurrentSound))
        CharName = "SALVAGE: ";
    
    if (array_contains([voc_Michael_SalvagePhase1Part1, voc_Michael_SalvagePhase1Part1_Pissed, voc_Michael_SalvagePhase1Part2, voc_Michael_SalvagePhase2, voc_Michael_SalvagePhase3, voc_Michael_SalvagePhase4, voc_Michael_SalvagePhase5], CurrentSound))
        CharName = MichaelName;
    
    var SubtitleText = CharName + SubtitleList[SubtitleEntry];
    
    if (CharName != "")
    {
        for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
        {
            for (var FontBold = 1; FontBold <= 3; FontBold++)
                draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 300 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 400);
        }
        
        draw_set_font(global.FontW97White);
        draw_text_ext(320, 300, SubtitleText, 15, 400);
        var SubtitleEndpoint = 999;
        
        if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
            SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
        
        if (audio_sound_get_track_position(SoundPlaying) > SubtitleEndpoint)
            SubtitleEntry++;
    }
    
    if (!audio_is_playing(SoundPlaying) || ((CurrentSound == sfxPhonePickup || CurrentSound == sfxPhoneRing) && audio_sound_get_track_position(SoundPlaying) > 1))
        CurrentSound = sfxNOTHING;
    
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
surface_reset_target();

if (instance_exists(oJumpscare))
    instance_destroy();
