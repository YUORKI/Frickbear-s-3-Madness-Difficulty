Text = " ";
Description = " ";
Price = 0;
Stock = 1;
ErrorTimer = 0;
ErrorMessage = "Not enough tokens!";

function error_msg(arg0)
{
    ErrorTimer = 1;
    ErrorMessage = arg0;
    audio_play_sound(sfxError, 10, false);
}

MimicText = "NOTHING";
BaseY = y;
Discount = 1;

if (array_contains(global.Upgrades, UnknownEnum.Value_7))
    Discount = 0.75;
else if (array_contains(global.Upgrades, UnknownEnum.Value_6))
    Discount = 0.9;

function spawn_item(arg0)
{
    switch (arg0)
    {
        case "Battery Pack":
            global.Power += 10;
            break;
        
        case "Distortion Clock":
            instance_create_depth(0, 0, 0, oShopItem_DistortionClock);
            break;
        
        case "Deathcoin":
            instance_create_depth(0, 0, 0, oShopItem_DeathCoin);
            break;
        
        case "Snowcone":
            instance_create_depth(0, 0, 0, oShopItem_Snowcone);
            break;
        
        case "Golden Cupcake":
            with (instance_create_depth(0, 0, 0, oShopItem_GoldenCupcake))
            {
                Value = other.AlteredPrice;
                OriginalValue = other.AlteredPrice;
            }
            
            break;
        
        case "Beartrap":
            instance_create_depth(0, 0, 0, oShopItem_Beartrap);
            break;
        
        case "Laser Doors":
            instance_create_depth(0, 0, 0, oShopItem_LaserDoors);
            break;
        
        case "King's Prize":
            instance_create_depth(320, -32, 0, oShopItem_KingsPrize);
            break;
        
        case "Rewind Clock":
            instance_create_depth(0, 0, 0, oShopItem_RewindClock);
            break;
        
        case "AR Mask":
            instance_create_depth(0, 0, 0, oShopItem_ARMask);
            break;
        
        case "Pickles":
            with (instance_create_layer(1150 + (48 * instance_number(oPickles)), 750, "OnWall", oPickles))
            {
                sprite_index = sPickles;
                get_trophy(UnknownEnum.Value_19);
                audio_play_sound(sfxChildrenCheering, 10, false);
                OriginalY = 750;
            }
            
            break;
    }
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_7,
    Value_19 = 19
}
