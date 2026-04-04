shader_set(TransparencyShader);
draw_3d_square(x1, y1, x2, y2, x3, y3, x4, y4, depth, 0, image_xscale, image_yscale, Texture, Texture, Texture, Texture);
shader_reset();
draw_self();
