var TickUp = 90;
var SecondTickup = 360;
var FadeoutStart = 180;
var FadeoutTime = 60;

if (EndingsFound == 4)
    FadeoutStart = SecondTickup + 180;

draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1 - ((Timer - FadeoutStart) / FadeoutTime));
draw_text(320, y, string("Endings Discovered: {0} / {1}", EndingsFound - (Timer <= TickUp), EndingsTotal));
draw_set_alpha(1);

if (Timer > (FadeoutStart + FadeoutTime + 60))
    room_goto(TitleScreenMap);

if (Timer < TickUp)
{
    y += ((180 - y) / 10);
}
else if (Timer >= TickUp)
{
    SpeedY = lerp(SpeedY, (180 - y) / 5, 0.2);
    y += SpeedY;
    
    if (Timer == TickUp)
    {
        SpeedY = 8;
        audio_play_sound(sfxSparkleImpact, 30, false);
    }
    
    if (Timer == (SecondTickup - 120) && EndingsFound == 4)
        audio_play_sound(sfxFifthEndingReveal, 30, false, 0.25, 0, 0.9);
    
    if (Timer == SecondTickup && EndingsFound == 4)
    {
        SpeedY = 8;
        EndingsTotal++;
        audio_play_sound(sfxSparkleImpact, 30, false, 1, 0, 0.9);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
Timer++;
