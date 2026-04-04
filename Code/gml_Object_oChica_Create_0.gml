Frame = 0;
Stage = "ShowStage";
WaitTime = 90;
EyeSize = 0;
BaseY = 656;
Side = 1;
Eyes = instance_create_layer(1344 + (Side * 512), BaseY, "Behind_Wall", oOfficeSprite);
RandomValue = random_range(0.75, 1.25);
Growl = undefined;

with (Eyes)
{
    sprite_index = sHallwayEyes;
    image_index = 0;
    image_alpha = other.EyeSize;
    y = (other.BaseY - (other.EyeSize * 16)) + 16;
}
