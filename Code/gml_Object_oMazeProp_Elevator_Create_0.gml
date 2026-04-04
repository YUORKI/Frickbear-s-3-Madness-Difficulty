Sides = 16;
Radius = 80;
var Angle = 0;

while (Angle < 360)
{
    if (Angle >= 30 && Angle <= 330)
    {
        with (instance_create_depth(x + lengthdir_x(Radius, Angle + image_angle), y + lengthdir_y(Radius, Angle + image_angle), 0, oMazeWall_Flat))
        {
            image_angle = Angle + 90 + other.image_angle;
            Sprite = sMazeTex_Vent;
        }
    }
    
    Angle += (360 / Sides);
}
