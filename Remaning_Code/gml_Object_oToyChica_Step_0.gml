var ID = UnknownEnum.Value_8;
var AI = global.AILevels[ID];

if (global.CamUp && CupcakePosition == 0)
{
    CupcakePosition = irandom_range(1, 5);
    
    if (character_active(UnknownEnum.Value_24))
    {
        if (oNightmarionne.Side == 1)
            CupcakePosition = irandom_range(1, 3);
        else
            CupcakePosition = irandom_range(3, 5);
    }
    
    if (character_active(UnknownEnum.Value_32))
    {
        if (oMrHippo.Mode == "Office")
            CupcakePosition = irandom_range(1, 4);
    }
    
    if (AI <= 5)
        CupcakePosition = 3;
    else if (AI <= 10)
        CupcakePosition = clamp(CupcakePosition, 2, 4);
}

if (!global.CamUp && CupcakePosition != 0)
{
    var CupX = 0;
    var CupY = 0;
    
    switch (CupcakePosition)
    {
        case 1:
            CupX = 608;
            CupY = 673;
            break;
        
        case 2:
            CupX = 691;
            CupY = 673;
            break;
        
        case 3:
            CupX = 1321;
            CupY = 750;
            break;
        
        case 4:
            CupX = 1698;
            CupY = 663;
            break;
        
        case 5:
            CupX = 2000;
            CupY = 706;
            break;
    }
    
    if (!instance_exists(oCupcake) && irandom_range(1, 20) <= AI && Cooldown == 0)
    {
        instance_create_layer(CupX, CupY, "InFrontOf_Wall", oCupcake);
        Cooldown = 15;
    }
    
    CupcakePosition = 0;
}

Cooldown = max(Cooldown - 0.016666666666666666, 0);

enum UnknownEnum
{
    Value_8 = 8,
    Value_24 = 24,
    Value_32 = 32
}
