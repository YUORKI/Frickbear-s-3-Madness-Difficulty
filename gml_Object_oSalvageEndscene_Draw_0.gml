CamShift = (dcos(ShiftTimer) - 1) / -2;

if (Timer == 1)
    audio_play_sound(sfxBurning, 10, true);

if (Timer >= 1 && Timer < 7)
{
    var BGFrame = floor(Timer * 4) % 7;
    draw_sprite(sMichaelEndscene_BG, BGFrame, lerp(0, 112, CamShift), 0);
    draw_sprite(sMichaelEndscene_Back, 0, lerp(-360, 0, CamShift), 0);
}

if (Timer == 4)
{
    audio_play_sound(FailedUltimate ? voc_Michael_HadToComeToThis : voc_Michael_HadToDoThis, 10, false);
    audio_sound_gain(sfxBurning, 0.5, 1000);
}

if (Timer >= 4 && Timer < 5.5)
    ShiftTimer += 2;

if (Timer == 7.5)
    audio_play_sound(voc_Michael_PlayWithFire, 10, false);

if (Timer > 7 && Timer < 10)
    ShiftTimer++;

if (Timer == 7)
{
    ShiftTimer = 0;
    CamShift = 0;
}

if (Timer >= 7 && Timer < 11)
    draw_sprite(sMichaelEndscene_Front, 0, 0, lerp(-280, 0, CamShift));

if (Timer == 11)
    audio_stop_all();

if (Timer == 11.5)
    audio_play_sound(voc_Michael_GetBurned, 10, false);

if (Timer >= 16)
    room_goto(Credits);

var Text = "";
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if (Timer >= 4 && Timer < 7)
    Text = FailedUltimate ? "I'm sorry it had to come to this." : "I'm sorry I had to do this.";

if (Timer >= 7.5 && Timer < 11)
    Text = "But if you play with fire...";

if (Timer >= 11.5 && Timer < 14.5)
    Text = "You're going to get burned.";

for (var FontDirection = 0; FontDirection < 360; FontDirection += 45)
    draw_text_ext(320 + round(lengthdir_x(1, FontDirection)), 326 + round(lengthdir_y(1, FontDirection)), Text, 15, 400);

draw_set_font(global.FontW97White);
draw_text_ext(320, 326, Text, 15, 400);
draw_set_font(global.FontW97Black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
Timer += 0.016666666666666666;
