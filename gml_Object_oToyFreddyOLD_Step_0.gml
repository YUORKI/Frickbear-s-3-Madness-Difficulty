var ID = UnknownEnum.Value_6;
var AI = global.AILevels[ID];

if (AI == 0)
    Frame = 0;

WaitTime = (50 - (AI * 2)) * RandomValue * 60;

if (Frame == 1)
    RandomValue = random_range(0.75, 1.25);

with (OfficeSprite)
{
    y = 575 + other.YOffset;
    sprite_index = sToyFreddyOfficeWindow;
    image_index = floor(other.Aggression);
}

Aggression += (1/120);
Frame += 1;

enum UnknownEnum
{
    Value_6 = 6
}
