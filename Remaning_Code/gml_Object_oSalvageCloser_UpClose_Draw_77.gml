set_target_to_ui();
var FrameVal = 1 - (floor(Frame) % 3);
var Head = 6;
var Body = 0;
var HeadOffset = (dsin(Frame - 30) * 5) + YOffset;
var BodyOffset = dsin(Frame) * 5;
draw_sprite_ext(sFlashlight, 0, 320, 180, 1, 1, 0, -1, global.Brightness);
draw_sprite_ext(sprite_index, Body, JumpX, JumpY + BodyOffset, SizeBody, SizeBody, JumpAngle, -1, Alpha);
draw_sprite_ext(sprite_index, Head, JumpX, JumpY + HeadOffset, SizeHead, SizeHead, JumpAngle, -1, Alpha);
draw_sprite_ext(sBossSalvage_JumpscareFaces, CutsceneQueue[CutscenePosition][1], JumpX, JumpY + HeadOffset, SizeHead, SizeHead, JumpAngle, -1, 1);
draw_sprite_ext(sBossSalvage_JumpscareFaces, CutsceneQueue[CutscenePosition][2] + 8, JumpX, JumpY + HeadOffset, SizeHead, SizeHead, JumpAngle, -1, 1);
var SoundclipDuration = audio_sound_length(SoundPlaying);
var SoundClipPosition = audio_sound_get_track_position(SoundPlaying);

if (Frame == 60)
    audio_play_sound(mus_BossSalvage_Opening, 5, false);

if ((SoundclipDuration - SoundClipPosition) <= 15 && !audio_is_playing(sfxSalvageBurning))
{
    audio_play_sound(sfxSalvageBurning, 5, false);
    audio_sound_gain(sfxSalvageBurning, 0, 0);
    audio_sound_gain(mus_BossSalvage_Opening, 0, 10000);
}

var VignettePercent = max((SoundClipPosition - (SoundclipDuration * (2/3))) / (SoundclipDuration * (1/3)), 0);
audio_sound_gain(sfxSalvageBurning, power(VignettePercent, 4), 0);
draw_sprite_ext(sBurningVignette, 0, 320, 180, 3 - VignettePercent, 3 - VignettePercent, 0, c_white, VignettePercent / 2);

if (SoundClipPosition >= SoundclipDuration)
{
    audio_stop_all();
    global.BossPhase = 0;
    room_goto(SalvageEnding);
}

if (audio_is_playing(SoundPlaying) && subtitles_enabled())
{
    var Text = "";
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    Text += SubtitleQueue[0][CurrentSubtitleLine];
    
    if (CurrentSubtitleLine < (array_length(SubtitleQueue[0]) - 1))
    {
        if (audio_sound_get_track_position(SoundPlaying) > SubtitleQueue[1][CurrentSubtitleLine + 1])
            CurrentSubtitleLine++;
    }
    
    for (var FontDirection = 0; FontDirection < 360; FontDirection += 45)
        draw_text_ext(320 + round(lengthdir_x(1, FontDirection)), 326 + round(lengthdir_y(1, FontDirection)), Text, 15, 400);
    
    draw_set_font(global.FontW97White);
    draw_text_ext(320, 326, Text, 15, 400);
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
surface_reset_target();
