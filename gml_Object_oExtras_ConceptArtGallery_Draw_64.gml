var Portrait = ConceptArt[Selected].Image;
sprite_set_offset(Portrait, sprite_get_width(Portrait) / 2, sprite_get_height(Portrait) / 2);
var TargetSize = min(344 / sprite_get_height(Portrait), 404 / sprite_get_width(Portrait), 1);

if (Active)
    ImageSize += ((TargetSize - ImageSize) / 5);
else
    ImageSize -= (ImageSize / 5);

PreviousImageSize -= (PreviousImageSize / 5);
ImageOffsetSize = clamp(ImageOffsetSize, 0, 1 - ImageSize);
var PortraitX = ImageX + ImageOffsetX;
var PortraitY = 180 + ImageOffsetY;
var PortraitSize = ImageSize + ImageOffsetSize;

if ((ImageSize + ImageOffsetSize) != 1)
    gpu_set_texfilter(true);

draw_sprite_ext(PreviousImage, 0, 430, 180, PreviousImageSize, PreviousImageSize, 0, c_white, 1);
draw_sprite_ext(Portrait, Frame / 5, PortraitX, PortraitY, PortraitSize, ImageSize + ImageOffsetSize, 0, c_white, 1);
gpu_set_texfilter(false);
Frame++;
