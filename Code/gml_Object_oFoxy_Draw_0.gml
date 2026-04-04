var Frame = floor((Phase / WaitTime) * 4);

if (Mode != "Wait")
    Frame = 4;

depth = 50;
draw_on_cam(UnknownEnum.Value_12 + Frame, 3);

enum UnknownEnum
{
    Value_12 = 12
}
