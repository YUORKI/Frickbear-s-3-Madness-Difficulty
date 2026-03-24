sprite_set_offset(Portrait, sprite_get_width(Portrait) / 2, sprite_get_height(Portrait) / 2);
var TargetSize = min(344 / sprite_get_height(Portrait), 404 / sprite_get_width(Portrait), 1);
ImageSize += ((TargetSize - ImageSize) / 5);
PreviousImageSize -= (PreviousImageSize / 5);
var PortraitX = 430;
var PortraitY = 180;
var PortraitSize = ImageSize * TileSize;
draw_sprite_ext(PreviousPortrait, 0, 430, 180, PreviousImageSize, PreviousImageSize, dsin(Frame) * 3, c_white, 1);
draw_sprite_ext(Portrait, 0, 430, 180, PortraitSize, PortraitSize, dsin(Frame) * 3, c_white, 1);
