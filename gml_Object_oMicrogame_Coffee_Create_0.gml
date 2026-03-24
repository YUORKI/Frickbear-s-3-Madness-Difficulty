BallX = 544;
BallY = irandom_range(32, 328);
XSpeed = -4;
YSpeed = 4;
BunnyY = 180;
BunnySpeed = 0;
Frame = 0;
SpriteDraw = 1;
Rallies = 0;
Cleared = false;
ActivationTime = 0;

function bounce(arg0)
{
    audio_play_sound(sfxCoffeeBounce, 15, false, 0.25 + (0.25 * arg0), 0, 1);
}

global.MicrogameWin = true;
