set_target_to_ui();
var MenuHide = StarAmount == 0;

if (instance_exists(oTitleMenu))
{
    if (oTitleMenu.CurMenu != "Title")
        MenuHide = true;
}
else
{
    MenuHide = true;
}

for (var i = 0; i < (StarAmount + StarEmptyAmount); i++)
{
    var Empty = i >= StarAmount;
    var YOffset = -4 + (DanceOffset * binary_to_sign(i % 2) * 4);
    draw_sprite_ext(sTitleStars, Empty, 27 + (40 * i), 32 + YOffset, 1, 1, 0, (i >= 5) ? #FFB6C6 : c_white, Alpha / ((Empty * 3) + 1));
}

if (Show && !MenuHide)
    Alpha += ((1 - Alpha) / 10);
else
    Alpha += ((0 - Alpha) / 10);

surface_reset_target();
var DanceTarget = floor((DanceFrame * (1/30) * 0.7916666666666666) % 2);
DanceOffset += ((binary_to_sign(DanceTarget) - DanceOffset) / 4);
DanceFrame++;

with (oTitle_SpecialCharacter)
{
    var OwnDanceTarget = (ImageIndex == 0) ? (1 - DanceTarget) : DanceTarget;
    Squish += ((lerp(1.03, 0.97, OwnDanceTarget) - Squish) / 5);
}
