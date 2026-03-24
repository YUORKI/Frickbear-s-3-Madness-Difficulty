y = BaseY + ((dsin(BounceFrame) * 10) / ((floor(BounceFrame / 90) * 2) + 1));
BounceFrame = min(BounceFrame + 45, 900);

if (input_check_pressed(UnknownEnum.Value_0))
    BounceFrame = 0;

enum UnknownEnum
{
    Value_0
}
