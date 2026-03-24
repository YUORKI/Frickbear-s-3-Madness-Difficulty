set_target_to_ui();
draw_sprite_ext(sDanglerTutorial, 2, x, y + ((floor((Timer + 60) / 15) % 2) * 2), Size, Size, 0, c_white, image_alpha);
Size += ((Active - Size) / 10);
Timer--;

if (Timer < 0)
{
    image_alpha -= 0.016666666666666666;
    
    if (image_alpha <= 0)
        instance_destroy();
}

surface_reset_target();
