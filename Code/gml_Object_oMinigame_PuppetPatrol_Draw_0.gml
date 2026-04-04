if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

with (oPP_Background)
{
    image_index = 0;
    draw_self();
}

with (oPP_Kids)
    draw_sprite_ext(sprite_index, image_index, round(x), y + YOffset, image_xscale, image_yscale, image_angle, c_white, 1);

surface_reset_target();

if (!surface_exists(Surf))
    Surf = surface_create(160, 144);

surface_set_target(Surf);
draw_clear_alpha(c_white, 0);
draw_rectangle_color(RadarX - 8, 0, RadarX, 144, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, false);
draw_circle_color(80, 56, FlashlightRadius, #E0F8D0, #E0F8D0, false);
gpu_set_colorwriteenable(1, 1, 1, 0);

with (oPP_Background)
{
    image_index = 1;
    draw_self();
}

with (oPP_Kids)
{
    if (!Stunned)
        image_index = (floor(abs(x) / 2) % 2) + (Color * 4);
    
    draw_sprite_ext(sprite_index, image_index, round(x), y + YOffset, image_xscale, image_yscale, image_angle, c_white, 1);
}

gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
surface_set_target(global.MinigameSurface);

if (room == MinigameMaze_2)
    draw_surface_ext(Surf, 0, 144, 1, -1, 0, c_white, 1);
else
    draw_surface(Surf, 0, 0);

draw_sprite(sPP_Background, 2, 0, 0);

if (!(Recharging && (floor(Frame / 8) % 2) == 0))
    draw_rectangle_color(76, 132, 75 + floor(Power / 2), 139, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, false);

draw_set_font(global.FontGameboy);
draw_set_halign(fa_left);
draw_text_color(76, 117, "Score: " + string(Score), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
var PuppetImage = floor(Frame / 16) % 2;

if (Streak >= 5)
    PuppetImage = (floor(Frame / 16) % 2) + 6;

if (DesiredKid == -1)
{
    if (Happy)
        PuppetImage = (floor(Frame / 8) % 2) + 2;
    else
        PuppetImage = (floor(Frame / 8) % 2) + 4;
}

draw_sprite(sPP_Puppet, PuppetImage, 0, 144);
draw_sprite(sPP_SpeechBubble, 0, 32, 144 + SpeechBubbleOffset);

if (DesiredKid != -1)
    draw_sprite(sPP_Kids, (floor(Frame / 8) % 2) + (DesiredKid * 4), 56, 127 + SpeechBubbleOffset);

surface_reset_target();
