Initialize = true;
PowerDrained = 0;
Tokens = 0;
ActivateBot = false;

function arc_y(arg0, arg1)
{
    return ((arg0 * (arg0 - 112)) / arg1) + 80;
}

function arc_length(arg0)
{
    return 1061.2 * power(arg0, -0.451);
}

function projectile(arg0, arg1, arg2) constructor
{
    IsBomb = arg0;
    ArcHeight = arg1;
    Speed = arg2;
    XPosition = 0;
}

Paused = true;
global.MinigameSurface = -1;
