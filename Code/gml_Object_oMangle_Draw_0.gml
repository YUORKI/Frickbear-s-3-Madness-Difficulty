if (global.Cam == CurrentCam)
{
    depth = 4;
    draw_sprite(sCameraAnimatronics, UnknownEnum.Value_18, global.CamX, global.CamY);
    draw_set_alpha(random_range(1.5, 0));
    draw_rectangle_color(global.CamX, global.CamY, global.CamX + 400, global.CamY + 300, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}

enum UnknownEnum
{
    Value_18 = 18
}
