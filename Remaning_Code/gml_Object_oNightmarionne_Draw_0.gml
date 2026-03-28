if (Head != undefined)
{
    with (Head)
    {
        sprite_index = sNightmarionneHead;
        image_index = other.HeadState;
        x = other.HeadCoords[0];
        y = other.HeadCoords[1];
        image_angle = other.HeadCoords[2] * -1;
        
        if (other.LookedAt)
            image_index = 2;
        
        DrawDepth = 35;
    }
    
    with (Torso)
    {
        sprite_index = sNightmarionneTorso;
        image_index = 0;
        x = other.TorsoCoords[0];
        y = other.TorsoCoords[1];
        image_angle = other.TorsoCoords[2] * -1;
        DrawDepth = 32;
    }
    
    with (ArmL)
    {
        sprite_index = sNightmarionneArm;
        image_index = 0;
        x = other.ArmLCoords[0];
        y = other.ArmLCoords[1];
        image_xscale = -1;
        image_angle = other.ArmLCoords[2] * -1;
        DrawDepth = 31;
    }
    
    with (ArmR)
    {
        sprite_index = sNightmarionneArm;
        image_index = 0;
        x = other.ArmRCoords[0];
        y = other.ArmRCoords[1];
        image_angle = other.ArmRCoords[2] * -1;
        DrawDepth = 31;
    }
    
    with (HandL)
    {
        sprite_index = sNightmarionneArm;
        image_index = 1;
        x = other.HandLCoords[0];
        y = other.HandLCoords[1];
        image_xscale = -1;
        image_angle = other.HandLCoords[2] * -1;
        DrawDepth = 34;
    }
    
    with (HandR)
    {
        sprite_index = sNightmarionneArm;
        image_index = 1;
        x = other.HandRCoords[0];
        y = other.HandRCoords[1];
        image_angle = other.HandRCoords[2] * -1;
        DrawDepth = 34;
    }
}
