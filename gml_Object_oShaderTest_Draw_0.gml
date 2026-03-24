shader_set(shEvilDemonShader);
draw_self();
shader_reset();
draw_set_font(global.FontW97White);
draw_text_ext(16, 16, "Check and see if this text is crunched up. If not, you should be good. Hold shift to switch color modes.", 13, 256);

if (keyboard_check(vk_shift))
    global.ColorMode = 2;
else
    global.ColorMode = 1;
