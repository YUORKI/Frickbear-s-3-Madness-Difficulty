Sides = 16;
Radius = 80;
var Angle = 0;

while (Angle < 360)
{
    with (instance_create_depth(x + lengthdir_x(Radius, Angle), y + lengthdir_y(Radius, Angle), 0, oMazeWall_Flat))
    {
        image_angle = Angle + 90;
        Sprite = sNOTHING;
    }
    
    Angle += (360 / Sides);
}
