Frame = -580;
Direction = 1;
KillTimer = 0;
Delay = 0;
StepTimer = 40;
ArmFront = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Jaw = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Torso = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
ArmBack = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);

with (ArmFront)
{
    DrawDepth = -1;
    sprite_index = sWitheredFreddy_ArmFront;
}

with (Head)
{
    DrawDepth = -1;
    sprite_index = sWitheredFreddy_Head;
}

with (Jaw)
{
    DrawDepth = -2;
    sprite_index = sWitheredFreddy_Jaw;
}

with (Torso)
{
    DrawDepth = -3;
    sprite_index = sWitheredFreddy_Torso;
}

with (ArmBack)
{
    DrawDepth = -4;
    sprite_index = sWitheredFreddy_ArmBack;
}
