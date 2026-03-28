Score = 0;
BlinkFrame = irandom_range(60, 120);
AnimFrame = 0;
Shake = 0;

if (!variable_global_exists("CupcakeMeter"))
    global.CupcakeMeter = 0;

CupcakeSize = 1;
CupcakeAngle = 0;
CupcakeYSpeed = 0;
CupcakeY = 0;

if (global.CupcakeMeter >= 1)
    CupcakeSize = 0;
