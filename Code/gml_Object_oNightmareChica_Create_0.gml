Head = undefined;
Arm = undefined;
UpperEarL = undefined;
LowerEarL = undefined;
Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Arm = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Torso = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Cupcake = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);

with (Head)
    sprite_index = sNightmareChica_Head;

with (Arm)
    sprite_index = sNightmareChica_FrontArm;

with (Torso)
    sprite_index = sNightmareChica_Torso;

with (Cupcake)
    sprite_index = sNightmareChica_CupcakeArm;

Frame = 0;
Cur_HeadB = 0;
CurSpeed_HeadB = 0;
HeadTurned = false;
HeadTurning = false;
Reset = true;
Freeze = false;
AI = 0;
KillTimer = 0;
Frozen = false;
