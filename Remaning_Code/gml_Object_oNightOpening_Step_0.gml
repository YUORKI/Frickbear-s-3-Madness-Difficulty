var Floor = 163;

if ((y + YSpeed) >= Floor)
{
    y = Floor;
    YSpeed *= -0.4;
}

if (Frame > 0)
{
    YSpeed += 0.5;
    y += YSpeed;
}

if (abs(YSpeed) < 0.1)
    YSpeed = 0;

var i = ArraySize - 1;

while (i > 0)
{
    PositionY[i] = PositionY[i - 1];
    i--;
}

PositionY[i] = y;
Frame += 1;
