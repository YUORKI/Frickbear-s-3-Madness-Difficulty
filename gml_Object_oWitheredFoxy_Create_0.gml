Timer = 60;
BodyY = 256;
HeadY = 256;
ArmX = -64;
ArmY = 256;
BodyAngle = 30;
HeadAngle = 0;
Mode = "Reset";
Tolerance = 1;
Exposure = 0;
BaseX = 1336;
BaseY = 750;
Arm = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Body = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);

with (Body)
{
    sprite_index = sNOTHING;
    DrawDepth = 1;
}

with (Head)
{
    sprite_index = sNOTHING;
    DrawDepth = 2;
}

with (Arm)
{
    sprite_index = sNOTHING;
    DrawDepth = 3;
}

Screech = sfxNOTHING;
