Sides = 16;
Radius = 40;
var Angle = 0;

while (Angle < 360)
{
    break;
    
    with (instance_create_depth(x + lengthdir_x(Radius, Angle), y + lengthdir_y(Radius, Angle), 0, oMazeWall_Flat))
    {
        image_angle = Angle + 90;
        Sprite = sNOTHING;
    }
    
    Angle += (360 / Sides);
}

function ax(arg0, arg1)
{
    return x + lengthdir_x(arg0, arg1 + image_angle);
}

function ay(arg0, arg1)
{
    return y + lengthdir_y(arg0, arg1 + image_angle);
}
