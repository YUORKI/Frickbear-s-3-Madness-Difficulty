x = 88 + ((get_item_amount(false) - 1) * 32);
y = -32;
TargetX = x;
Active = false;
TutorialSize = 0;

function check_for_trophy()
{
    var SnowconeActive = false;
    var LasersActive = false;
    var MaskActive = false;
    
    for (var i = 0; i < instance_number(oShopItem); i++)
    {
        var obj = instance_find(oShopItem, i);
        
        if (obj.object_index == oShopItem_ARMask)
        {
            if (obj.Active)
                MaskActive = true;
        }
        
        if (obj.object_index == oShopItem_LaserDoors)
        {
            if (obj.Active)
                LasersActive = true;
        }
        
        if (obj.object_index == oShopItem_Snowcone)
        {
            if (obj.Active)
                SnowconeActive = true;
        }
    }
    
    if (SnowconeActive && LasersActive && MaskActive)
        get_trophy(UnknownEnum.Value_17);
}

if (array_contains([oShopItem_ARMask, oShopItem_DeathCoin, oShopItem_Snowcone, oShopItem_LaserDoors, oShopItem_GoldenCupcake], object_index) && !global.UnlockedAnimatronics[UnknownEnum.Value_57])
{
    instance_create_depth(x + 16, 66, depth, oItemTutorial);
    global.UnlockedAnimatronics[UnknownEnum.Value_57] = true;
}

enum UnknownEnum
{
    Value_17 = 17,
    Value_57 = 57
}
