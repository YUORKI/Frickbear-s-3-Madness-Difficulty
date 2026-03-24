image_index = 0;

if (Frame == 0)
    jump_origin(Side, SideVertical);

JumpX += ((320 - JumpX) / 5);
JumpY += ((180 - JumpY) / 5);
SizeBody += (((1.25 - SizeBody) / 10) + 0.005);
SizeHead += (((1.5 - SizeHead) / 16) + 0.01);

if (sprite_index == sJumpscare_Fredbear)
{
    if (Frame > 90)
        Alpha -= (1/30);
    
    if (Frame == 120)
        instance_destroy();
}
else
{
    if (Frame > 60)
        Alpha -= (1/30);
    
    if (Frame == 90)
        instance_destroy();
}

Frame++;

if (!(instance_exists(oExtras_AnimatronicGallery) || instance_exists(oMicrogame_Extras)))
    instance_destroy();
