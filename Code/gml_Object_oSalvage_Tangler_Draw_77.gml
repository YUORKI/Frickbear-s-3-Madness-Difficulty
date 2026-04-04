set_target_to_ui();

if (Retreating)
{
    DistSpeed -= 5;
    image_angle -= (Angleness * (-1 + (DistSpeed / 30)));
    
    if (Dist < -800)
        instance_destroy();
}
else
{
    DistSpeed = lerp(DistSpeed, (-80 - Dist) * 0.2, 0.25);
}

Dist += DistSpeed;
image_xscale = 2;
image_yscale = 2;
x = BaseX + lengthdir_x(Dist, image_angle);
y = BaseY + lengthdir_y(Dist, image_angle);
draw_self();
surface_reset_target();
