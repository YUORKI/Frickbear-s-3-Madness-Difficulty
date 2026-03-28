function replace_color(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    Color = function(arg0, arg1, arg2) constructor
    {
        red = arg0 / 255;
        green = arg1 / 255;
        blue = arg2 / 255;
    };
    
    shader_set_uniform_f(shader_get_uniform(shRecolor, "range"), 1);
    var colorMatch_A = new Color(color_get_red(arg0), color_get_green(arg0), color_get_blue(arg0));
    var colorReplace_A = new Color(color_get_red(arg4), color_get_green(arg4), color_get_blue(arg4));
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorMatch_A"), colorMatch_A.red, colorMatch_A.green, colorMatch_A.blue);
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorReplace_A"), colorReplace_A.red, colorReplace_A.green, colorReplace_A.blue);
    var colorMatch_B = new Color(color_get_red(arg1), color_get_green(arg1), color_get_blue(arg1));
    var colorReplace_B = new Color(color_get_red(arg5), color_get_green(arg5), color_get_blue(arg5));
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorMatch_B"), colorMatch_B.red, colorMatch_B.green, colorMatch_B.blue);
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorReplace_B"), colorReplace_B.red, colorReplace_B.green, colorReplace_B.blue);
    var colorMatch_C = new Color(color_get_red(arg2), color_get_green(arg2), color_get_blue(arg2));
    var colorReplace_C = new Color(color_get_red(arg6), color_get_green(arg6), color_get_blue(arg6));
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorMatch_C"), colorMatch_C.red, colorMatch_C.green, colorMatch_C.blue);
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorReplace_C"), colorReplace_C.red, colorReplace_C.green, colorReplace_C.blue);
    var colorMatch_D = new Color(color_get_red(arg3), color_get_green(arg3), color_get_blue(arg3));
    var colorReplace_D = new Color(color_get_red(arg7), color_get_green(arg7), color_get_blue(arg7));
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorMatch_D"), colorMatch_D.red, colorMatch_D.green, colorMatch_D.blue);
    shader_set_uniform_f(shader_get_uniform(shRecolor, "colorReplace_D"), colorReplace_D.red, colorReplace_D.green, colorReplace_D.blue);
}
