BaseX = 1344;
BaseY = 736;
Body = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Frame = 0;
SpriteFrame = 0;
LeewayFrames = 0;

with (Body)
    y = other.BaseY + sprite_height;

TargetY = Body.y;
Mode = "Down";
RandomValue = random_range(0.75, 1.25);
