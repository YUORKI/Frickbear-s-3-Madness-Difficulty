var H_Texture = Texture;
var V_Texture = Texture;

if (image_xscale < image_yscale)
    H_Texture = undefined;
else if (image_yscale < image_xscale)
    V_Texture = undefined;

shader_set(TransparencyShader);
draw_3d_square(x1, y1, x2, y2, x3, y3, x4, y4, depth, 0, image_xscale, image_yscale, H_Texture, V_Texture, H_Texture, V_Texture);
shader_reset();
draw_self();
