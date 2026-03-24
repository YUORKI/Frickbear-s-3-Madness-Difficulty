draw_sprite(sprite_index, 0, 320, 223);
draw_sprite_ext(sprite_index, 1, 320, 223, Squeeze, 1 / Squeeze, 0, c_white, 1);

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
draw_sprite_ext(sprite_index, Expression + 2, 320, 223, Squeeze, 1 / Squeeze, 0, c_white, EyeAlpha);
SqueezeSpeed = lerp(SqueezeSpeed, (1 - Squeeze) / 4, 0.25);
Squeeze += SqueezeSpeed;

if (Timer < -240)
{
    instance_create_depth(320, 380, 0, oEndingPFF_Text);
    instance_destroy();
}
