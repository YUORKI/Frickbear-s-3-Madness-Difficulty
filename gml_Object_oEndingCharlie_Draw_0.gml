draw_sprite(sprite_index, 0, 320, 223);
var CassRevealTime = 240;
var OffsetA = MainOffset * binary_to_sign(floor(FadeinFrame / 2) % 2);
var OffsetB = SecondaryOffset * binary_to_sign(floor(FadeinFrame / 2) % 2);

if (FadingIn)
{
    MainOffset += ((640 - MainOffset) / 10);
    SecondaryOffset -= (SecondaryOffset / 10);
    FadeinFrame++;
}

if (MaskOn)
{
    draw_sprite_ext(sprite_index, 1 + Expression, 320 + OffsetA, 223, Squeeze, 1 / Squeeze, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 3, 320 + OffsetB, 223, Squeeze, 1 / Squeeze, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sprite_index, 4, 320, 223, Squeeze, 1 / Squeeze, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 6 + Expression, 320, 223, Squeeze, 1 / Squeeze, 0, c_white, 1);
}

if (Timer <= 30 || Fadeout)
{
    draw_set_alpha(random_range(0.5, 2.5) * lerp(1, 0, Timer / 30));
    draw_rectangle_color(0, 0, 640, 320, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    if (Fadeout)
        Timer--;
    else
        Timer++;
}

var EyeAlpha = 1 + ((Timer + 30) / 120);

if (!MaskOn)
    draw_sprite_ext(sprite_index, 5, 320, 223, Squeeze, 1 / Squeeze, 0, c_white, EyeAlpha / 2);

SqueezeSpeed = lerp(SqueezeSpeed, (1 - Squeeze) / 4, 0.25);
Squeeze += SqueezeSpeed;

if (Timer < -240)
{
    with (instance_create_depth(320, 380, 0, oEndingPFF_Text))
    {
        EndingsFound = 5;
        EndingsTotal = 5;
    }
    
    global.UnlockedAnimatronics[UnknownEnum.Value_65] = true;
    instance_destroy();
}

enum UnknownEnum
{
    Value_65 = 65
}
