depth = -99;
x = 400 + XOffset;
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite_ext(sTrophyPopup, 0, x, y, 1, 1, 0, c_white, 0.5);
draw_sprite(sTrophyIcons, TrophyID, x + 4, y + 4);
draw_text(x + 56, y + 9, "TROPHY UNLOCKED!");
draw_text_ext(x + 56, y + 34, Name, 14, 182);
draw_set_valign(fa_top);

if (Timer < 120)
{
    XOffset -= (XOffset / 10);
}
else
{
    XOffset += ((XOffset + 2) * 0.5);
    
    if (XOffset > 240)
        instance_destroy();
}

Timer++;
