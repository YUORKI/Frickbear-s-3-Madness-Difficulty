set_target_to_ui();
draw_set_halign(fa_center);

if (CurrentSound != sfxNOTHING)
{
    if (global.BossPhase == 0)
        disable_camera(0.1);
    
    draw_set_halign(fa_center);
    var SubtitleText = "MICHAEL: " + SubtitleList[SubtitleEntry];
    
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
    
    if (!audio_is_playing(SoundPlaying))
    {
        CurrentSound = sfxNOTHING;
        audio_play_sound(sfxPhonePickup, 10, false);
    }
    
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
}

draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (CallTimer == 2)
    audio_play_sound(sfxPhoneRing, 10, false);

if (CallTimer == 1)
{
    audio_stop_sound(sfxPhoneRing);
    audio_play_sound(sfxPhonePickup, 10, false);
}

if (CallTimer > 0)
{
    if (global.BossPhase == 0)
        disable_camera(0.1);
    
    CallTimer -= 0.016666666666666666;
    
    if (CallTimer == 0)
        set_soundclip(VoiceClip);
}

if (CurrentSound != sfxNOTHING || CallTimer > 0)
    PhoneButtonY += ((336 - PhoneButtonY) / 10);
else
    PhoneButtonY += ((360 - PhoneButtonY) / 10);

var PhoneButtonX = 320;
var ButtonWidth = 80;
var ButtonHeight = 24;

if (mouse_in_zone(PhoneButtonX - (ButtonWidth / 2), PhoneButtonY - (ButtonHeight / 2), ButtonWidth, ButtonHeight) && mouse_check_button_pressed(mb_left))
{
    audio_stop_sound(sfxPhoneRing);
    audio_stop_sound(VoiceClip);
    CallTimer = 0;
    CurrentSound = sfxNOTHING;
    audio_play_sound(sfxPhonePickup, 10, false);
    disable_camera(0);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.FontW97Black);
var Text = "Skip";
draw_sprite_stretched(sWindowBase, 0, PhoneButtonX - (ButtonWidth / 2), PhoneButtonY, ButtonWidth, ButtonHeight);
draw_text(PhoneButtonX, (PhoneButtonY + (ButtonHeight / 2)) - 2, Text);
surface_reset_target();
