depth = -1;
set_target_to_ui();
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
var Alpha = 1 - min((Frame - 45) / 45, 1);
draw_text_transformed_color(x, y + YOffset, "+$" + string_format(DollarAmount, 1, 2), Size, Size, 0, c_white, c_white, c_white, c_white, Alpha);
YOffset += ((TargetOffset - YOffset) / 10);
Size += ((1 - Size) / 10);
Frame++;

if (Frame >= 90)
    instance_destroy();

surface_reset_target();
