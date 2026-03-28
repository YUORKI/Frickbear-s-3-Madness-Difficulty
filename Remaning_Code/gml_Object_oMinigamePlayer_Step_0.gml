Walkspeed = 0.5;
var MoveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
SpeedX += (MoveX * Walkspeed);

if (place_meeting(x + SpeedX, y, oMinigameWall))
{
    while (!place_meeting(x + sign(SpeedX), y, oMinigameWall))
        x += sign(SpeedX);
    
    SpeedX = 0;
}

x += SpeedX;
SpeedX *= 0.7;
var MoveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));
SpeedY += (MoveY * Walkspeed);

if (place_meeting(x, y + SpeedY, oMinigameWall))
{
    while (!place_meeting(x, y + sign(SpeedY), oMinigameWall))
        y += sign(SpeedY);
    
    SpeedY = 0;
}

y += SpeedY;
SpeedY *= 0.7;
AnimationFrame += ((abs(SpeedX) + abs(SpeedY)) / 10);

if (MoveX == -1)
    SpriteDirection = 1;
else if (MoveX == 1)
    SpriteDirection = 3;
else if (MoveY == -1)
    SpriteDirection = 2;
else if (MoveY == 1)
    SpriteDirection = 0;
else
    AnimationFrame = 0;

image_index = (SpriteDirection * 4) + (floor(AnimationFrame) % 4);
x = round(x);
y = round(y);
