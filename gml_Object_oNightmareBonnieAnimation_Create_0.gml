Head = undefined;
Arm = undefined;
UpperEarL = undefined;
LowerEarL = undefined;
UpperEarR = undefined;
LowerEarR = undefined;
Arm = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
UpperEarR = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
LowerEarR = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
UpperEarL = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
LowerEarL = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);

with (UpperEarL)
{
    sprite_index = sNightmareBonnie_UpperEar;
    DrawDepth = 2;
}

with (UpperEarR)
{
    sprite_index = sNightmareBonnie_UpperEar;
    DrawDepth = 2;
}

with (LowerEarL)
{
    sprite_index = sNightmareBonnie_LowerEar;
    DrawDepth = 1;
}

with (LowerEarR)
{
    sprite_index = sNightmareBonnie_LowerEar;
    DrawDepth = 1;
}

with (Arm)
{
    sprite_index = sNightmareBonnie_Arm;
    DrawDepth = 4;
}

with (Head)
{
    sprite_index = sNightmareBonnie_Head;
    DrawDepth = 3;
}

XOffset = 0;
Side = -1;
HeadX = 0;
HeadY = 0;
XSpeed = -12;
