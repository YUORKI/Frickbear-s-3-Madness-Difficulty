var CandyActive = instance_exists(oCandy) && global.AILevels[UnknownEnum.Value_44] > 0;

if (!surface_exists(TVSurf))
    TVSurf = surface_create(128, 128);

surface_set_target(TVSurf);
draw_clear_alpha(c_black, 0);

if (Frame >= 180)
    Frame = 0;

var TVImage = (floor(Frame / 15) % 2) + (CurrentAnimation * 2);

if (TVOn)
{
    draw_sprite(sTVAnimations, TVImage, 10, 12);
    draw_sprite(sTitleTex_TVAlt, 0, 0, 0);
}
else if (CandyActive)
{
    draw_sprite(sTVCandy, floor(Frame / 30) % 2, 10, 12);
    draw_set_font(global.FontHanddrawn);
    draw_set_halign(fa_left);
    draw_text(18, 43, format_as_timer(ceil(oCandy.WaitTime)));
    draw_sprite(sTitleTex_TVAlt, 0, 0, 0);
}
else
{
    draw_sprite(sTitleTex_TV, 0, 0, 0);
}

Frame++;
BobFrame++;
surface_reset_target();
OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.3, 0.2);
HeightOffset += OffsetSpeed;

enum UnknownEnum
{
    Value_44 = 44
}
