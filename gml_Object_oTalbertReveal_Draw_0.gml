if (CurDirection < 90)
{
    if (global.Guard > 3)
        draw_sprite_ext(HandSprites, ((global.Guard - 3) * 3) + (floor(Frame / 20) % 3), 224 + lengthdir_y(480, CurDirection), 0, 1, 1, 0, c_white, Fade);
    else
        draw_sprite_ext(sTalbertHeldFile, floor(Frame / 20) % 3, 224 + lengthdir_y(480, CurDirection), 0, 1, 1, 0, c_white, Fade);
}

if (CurDirection > 90)
{
    draw_sprite_ext(sTalbertPuppet, floor(Frame / 20) % 3, 80 + lengthdir_y(480, CurDirection + 180), 0, 1, 1, 0, c_white, Fade);
    draw_sprite_ext(GuardSprites, global.Guard + 1, 80 + lengthdir_y(480, CurDirection + 180), 0, 1, 1, 0, c_white, Fade);
}

Fade += ((FadeSpeed * sign(FadeTarget - Fade)) / 120);
CurDirection += (((180 * PuppetReveal) - CurDirection) / 10);
Frame++;
show_debug_message(CurDirection);
show_debug_message(lengthdir_y(320, CurDirection));
