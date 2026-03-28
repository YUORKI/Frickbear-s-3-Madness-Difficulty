var Speed = oAnimdude_Player.Speed / 2;

if (y >= 192)
    LavaTimer += Speed;

if (LavaTimer > 60)
{
    YVelocity = Speed * -6;
    LavaTimer = 0;
}

y += YVelocity;
y = min(y, 192);
YVelocity += (0.1 * Speed * Speed);
image_index = sign(round(YVelocity / 2)) + 1;
