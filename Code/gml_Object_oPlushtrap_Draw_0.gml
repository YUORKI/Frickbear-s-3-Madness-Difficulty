var BaseX = 1344;
var BaseY = 640;

if (Side == -1)
    BaseY += 80;

if (Mode == "Door")
    BaseY = 720;

with (Head)
{
    sprite_index = sPlushtrapHead;
    x = BaseX + (other._x * other.Side);
    y = BaseY + (other._y * other.Side);
    image_angle = other._angle * -1 * other.Side;
    
    if (other.Mode == "Door")
        image_index = 1;
    else
        image_index = 0;
    
    DrawDepth = 50;
}

with (EarL)
{
    sprite_index = sPlushtrapEar;
    x = BaseX + (other._x * other.Side) + rot_x(-28, -62, other._angle * other.Side);
    y = BaseY + (other._y * other.Side) + rot_y(-28, -62, other._angle * other.Side);
    image_xscale = -1;
    image_angle = ((other._angle * other.Side) + other.EarAngle) * -1;
    DrawDepth = 50;
}

with (EarR)
{
    sprite_index = sPlushtrapEar;
    x = BaseX + (other._x * other.Side) + rot_x(28, -62, other._angle * other.Side);
    y = BaseY + (other._y * other.Side) + rot_y(28, -62, other._angle * other.Side);
    image_xscale = 1;
    image_angle = ((other._angle * other.Side) - other.EarAngle) * -1;
    DrawDepth = 50;
}
