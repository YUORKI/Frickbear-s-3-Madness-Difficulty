draw_sprite_ext(sMCICutscene, (CurrentSlide * 3) + (floor(Frame / 20) % 3), 0, 0, 1, 1, 0, c_white, Fade);
Fade += ((FadeSpeed * sign(FadeTarget - Fade)) / 120);
show_debug_message(Fade);
Frame++;
