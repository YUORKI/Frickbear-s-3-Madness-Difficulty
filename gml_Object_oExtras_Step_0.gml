var fx_struct = layer_get_fx("Effect_2");
var bg_struct = layer_get_fx("Effect_2");
var MainColor = make_color_rgb(lerp(BGColors[PrevColor][2][0], BGColors[CurColor][2][0], ColorTrans), lerp(BGColors[PrevColor][2][1], BGColors[CurColor][2][1], ColorTrans), lerp(BGColors[PrevColor][2][2], BGColors[CurColor][2][2], ColorTrans));
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, MainColor);

if (fx_struct != undefined)
{
    var LeftColor = [lerp(BGColors[PrevColor][0][0], BGColors[CurColor][0][0], ColorTrans) / 255, lerp(BGColors[PrevColor][0][1], BGColors[CurColor][0][1], ColorTrans) / 255, lerp(BGColors[PrevColor][0][2], BGColors[CurColor][0][2], ColorTrans) / 255, 1];
    var RightColor = [lerp(BGColors[PrevColor][1][0], BGColors[CurColor][1][0], ColorTrans) / 255, lerp(BGColors[PrevColor][1][1], BGColors[CurColor][1][1], ColorTrans) / 255, lerp(BGColors[PrevColor][1][2], BGColors[CurColor][1][2], ColorTrans) / 255, 1];
    fx_set_parameter(fx_struct, "g_GradientColour1", LeftColor);
    fx_set_parameter(fx_struct, "g_GradientColour2", RightColor);
}
