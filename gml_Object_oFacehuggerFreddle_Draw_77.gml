set_target_to_ui();
draw_sprite_ext(sNightmareFreddy_FreddleBody_Big, 0, x + lengthdir_x(HeightOffset * 3, (BodyAngle + image_angle) - 90), y + lengthdir_y(HeightOffset * 3, (BodyAngle + image_angle) - 90), 1, 1, BodyAngle + image_angle, c_white, 1);
draw_sprite_ext(sNightmareFreddy_FreddleHead_Big, HeadSprite, x + lengthdir_x((HeightOffset - 56) * 3, (BodyAngle + image_angle) - 90), y + lengthdir_y((HeightOffset - 56) * 3, (BodyAngle + image_angle) - 90), 1, 1, BodyAngle + image_angle + HeadAngle + round(random_range(-0.6, 0.6)), c_white, 1);

if (!Flashed)
{
    OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.5, 0.25);
    HeadTiltFrames--;
    
    if (HeadTiltFrames <= 0)
    {
        HeadAngleTarget = irandom_range(-3, 3) * 10;
        HeadTiltFrames = random_range(30, 120);
    }
}
else
{
    OffsetSpeed += 0.75;
    BodyAngle = HeadAngle / -4;
    
    if (HeightOffset > 256)
        instance_destroy();
}

HeightOffset += OffsetSpeed;
HeadAngle += HeadAngleSpeed;
HeadAngleSpeed = lerp(HeadAngleSpeed, (HeadAngleTarget - HeadAngle) * 0.8, 0.2);
surface_reset_target();
