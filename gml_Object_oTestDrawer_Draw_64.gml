RFX_init(1, sprite_get_texture(spr_DitherPattern, 0), Spread);
RFX_set_palswap(sprite_get_texture(RFXpalettes_spr, 11));
RFX_draw_surface(global.UISurface, 0, 0, 1, 1, 0, 16777215, 1);
Spread += (input_check(UnknownEnum.Value_2) - input_check(UnknownEnum.Value_4));
window_set_size(800, 800);
show_debug_message(Spread);

enum UnknownEnum
{
    Value_2 = 2,
    Value_4 = 4
}
