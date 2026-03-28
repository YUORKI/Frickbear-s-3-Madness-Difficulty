if (room != FredbearHome && global.MicrogameWin)
{
    var Portrait = FB_Fredbear;
    sprite_set_offset(Portrait, sprite_get_width(Portrait) / 2, sprite_get_height(Portrait) / 2);
    var TargetSize = min(344 / sprite_get_height(Portrait), 404 / sprite_get_width(Portrait), 1);
    PortraitSize += ((TargetSize - PortraitSize) / 5);
    draw_sprite_ext(Portrait, 0, 320, 180, PortraitSize, PortraitSize, 0, c_white, 1);
}
