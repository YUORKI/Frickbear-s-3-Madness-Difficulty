var Seconds = 15 - (global.AILevels[UnknownEnum.Value_8] / 2);
DeathTimer = Seconds;
OriginalX = x;
OriginalY = y;
Mode = "Wait";
simple_sound(sfxCartoonPop, 0, 0, false, 0.75);
BlinkFrames = 0;
DrawDepth = 10;

enum UnknownEnum
{
    Value_8 = 8
}
