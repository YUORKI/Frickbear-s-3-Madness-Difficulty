BallX = 96;
BallY = 180;
XSpeed = 4;
YSpeed = 4;
BunnyY = 180;
BunnySpeed = 0;
Frame = -3;
SpriteDraw = 0;
Rallies = 0;
Cleared = false;
ActivationTime = irandom_range(5, 270);

function bounce(arg0)
{
    if (global.AILevels[UnknownEnum.Value_40] == 21 && arg0)
    {
        XSpeed = sign(XSpeed) * lerp(4, 10, (global.Timer - 240) / 120);
        YSpeed = sign(YSpeed) * abs(XSpeed) * random_range(0.9, 1.1);
    }
    
    audio_play_sound(sfxCoffeeBounce, 15, false, 0.25 + (0.25 * arg0), 0, 1);
}

enum UnknownEnum
{
    Value_40 = 40
}
