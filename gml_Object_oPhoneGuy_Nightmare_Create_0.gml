CallTimer = 3;
VoiceClip = voc_Michael_Call1;
CurrentSound = sfxNOTHING;

function set_soundclip(arg0)
{
    var Subtitles = subtitle(arg0);
    CurrentSound = arg0;
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SoundPlaying = audio_play_sound(arg0, 5, false);
    SubtitleEntry = 0;
}

if (global.BossPhase > 0)
    CallTimer = 0;

PhoneButtonY = 360;
