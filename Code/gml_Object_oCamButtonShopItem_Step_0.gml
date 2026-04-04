if (global.Cheats[UnknownEnum.Value_3] && Text != "High-Quality Lumber")
{
    Price = 0;
    Stock = 99;
}

AlteredPrice = Price;

if (global.AILevels[UnknownEnum.Value_25] > 0 && instance_exists(oLolbit))
    AlteredPrice += floor(Price * (global.AILevels[UnknownEnum.Value_25] / 20));

AlteredPrice = min(round((AlteredPrice / lerp(1, global.NightSpeedup, 0.5)) * Discount), 999);

if (Text == "High-Quality Lumber")
    AlteredPrice = Price;

if (place_meeting(x, y, oMouseHitbox))
{
    var CheckName = Text;
    
    if (CheckName == "Mimic Ball")
        CheckName = MimicText;
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (Text == "Mimic Ball" && MimicText == "NOTHING")
        {
            error_msg("No item to mimic!");
        }
        else if (Text == "Pickles" && global.Cheats[UnknownEnum.Value_3])
        {
            error_msg("No cheating!");
        }
        else if ((Text == "King's Prize" || MimicText == "King's Prize") && instance_exists(oShopItem_KingsPrize))
        {
            error_msg("Item already active!");
        }
        else if ((global.Tokens - oCamera.MinTokens) < AlteredPrice)
        {
            if (global.Tokens < 0)
                error_msg("Too much debt!");
            else
                error_msg("Not enough tokens!");
        }
        else if (get_item_amount() >= 5 && !array_contains(["Rewind Clock", "Distortion Clock", "Battery Pack", "High-Quality Lumber"], CheckName))
        {
            error_msg("Inventory full!");
        }
        else
        {
            audio_play_sound(sfxRegister, 10, false);
            Stock--;
            global.Tokens -= AlteredPrice;
            
            if (Text == "Mimic Ball")
            {
                spawn_item(MimicText);
            }
            else
            {
                spawn_item(Text);
                
                if (Text != "High-Quality Lumber")
                {
                    with (oCamButtonShopItem)
                    {
                        if (Text == "Mimic Ball")
                        {
                            Price = ceil(other.Price * 1.5);
                            MimicText = other.Text;
                        }
                    }
                }
            }
            
            if (Stock <= 0)
                instance_destroy();
            
            with (oCameraUI)
            {
                ShopkeepFrame = 0;
                ShopkeepAnim = 1;
            }
            
            with (oMendo)
                HappyFrames = MaxHappyFrames;
            
            if (Text != "High-Quality Lumber")
            {
                with (oCamera)
                    Itemless = min(Itemless, 1);
            }
        }
    }
}

if (global.MonitorSystem == "Shop")
    y = BaseY;
else
    y = BaseY + 360;

enum UnknownEnum
{
    Value_3 = 3,
    Value_25 = 25
}
