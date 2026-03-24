SelectedOption = 0;
ShopInventory = oInteraction_Shop.ShopInventory;
OptionPositions = array_create(array_length(ShopInventory), 0);
OptionYOffset = 0;
WaitForConfirm = false;
ConfirmOption = false;
ConfirmHandY = 0;
ConfirmBoxOffset = 0;
TempMessage = "You can't afford this!";
TempTimer = 0;
FadeIn = 1;

with (oTextBox)
    ExternalPause = true;

function draw_everything()
{
    var DescBoxY = 232;
    draw_set_font(global.FontHanddrawn);
    var TextColor = 3354368;
    var AltColor = 13695200;
    
    if (input_check_pressed(UnknownEnum.Value_4) || input_check_pressed(UnknownEnum.Value_2))
        audio_play_sound(sfxBump, 5, false);
    
    if (WaitForConfirm)
    {
        if (input_check_pressed(UnknownEnum.Value_4) || input_check_pressed(UnknownEnum.Value_2))
            ConfirmOption = !ConfirmOption;
        
        ConfirmBoxOffset += ((0 - ConfirmBoxOffset) / 5);
    }
    else
    {
        SelectedOption += (input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2));
        ConfirmBoxOffset += ((180 - ConfirmBoxOffset) / 5);
    }
    
    if (SelectedOption >= array_length(ShopInventory))
        SelectedOption = 0;
    
    if (SelectedOption < 0)
        SelectedOption = array_length(ShopInventory) - 1;
    
    draw_sprite_ext(sTextBox, 1, -64 - (480 * FadeIn), -32, 7, 6, 0, c_white, 1);
    OptionYOffset += (((32 * (SelectedOption - 3)) - OptionYOffset) / 5);
    
    if (input_check_pressed(UnknownEnum.Value_0))
    {
        audio_play_sound(sfxCamSwitch, 5, false);
        
        if (WaitForConfirm)
        {
            if (!ConfirmOption)
            {
                global.RunEarnings -= ShopInventory[SelectedOption][2];
                
                if (ShopInventory[SelectedOption][0] == "Reroll")
                {
                    var ExclusionList = [];
                    
                    for (var i = 0; i < array_length(ShopInventory); i++)
                    {
                        if (ShopInventory[i][0] == "Reroll")
                            break;
                        
                        array_push(ExclusionList, ShopInventory[i][0]);
                    }
                    
                    with (oInteraction_Shop)
                        generate_inventory(ExclusionList);
                    
                    ShopInventory = oInteraction_Shop.ShopInventory;
                }
                else
                {
                    var CurrentItemID = ShopInventory[SelectedOption][3];
                    global.UpgradeRecord[CurrentItemID]++;
                    var ItemDowngrades = get_upgrades(CurrentItemID).StepDown;
                    
                    for (var i = 0; i < array_length(global.Upgrades); i++)
                    {
                        if (array_contains(ItemDowngrades, global.Upgrades[i]))
                            array_delete(global.Upgrades, i, 1);
                    }
                    
                    array_push(global.Upgrades, CurrentItemID);
                    array_delete(ShopInventory, SelectedOption, 1);
                    
                    if (CurrentItemID == UnknownEnum.Value_31)
                    {
                        with (oInteraction_Shop)
                            generate_inventory([]);
                        
                        ShopInventory = oInteraction_Shop.ShopInventory;
                    }
                    
                    if (CurrentItemID == UnknownEnum.Value_30 && oInteraction_Shop.Rerolls == 0)
                    {
                        oInteraction_Shop.RerollPrice = 0;
                        ShopInventory[array_length(ShopInventory) - 2][2] = 0;
                    }
                }
                
                SelectedOption = 0;
                audio_play_sound(sfxRegister, 10, false);
                var Text = "";
                
                for (var i = 0; i < array_length(global.Upgrades); i++)
                    Text += (get_upgrades(global.Upgrades[i]).Name + ", ");
            }
            
            WaitForConfirm = false;
        }
        else if (global.RunEarnings < ShopInventory[SelectedOption][2] && !(SelectedOption == (array_length(ShopInventory) - 1)))
        {
            audio_play_sound(sfxError, 5, false);
        }
        else
        {
            if (SelectedOption == (array_length(ShopInventory) - 1))
            {
                with (oTextBox)
                    ExternalPause = false;
                
                instance_destroy();
            }
            
            WaitForConfirm = true;
            ConfirmOption = false;
            ConfirmHandY = 0;
        }
    }
    
    var RerollPlacement = max(array_length(ShopInventory) - 2, 0);
    OptionPositions[array_length(ShopInventory) - 1] = 16;
    
    if (ShopInventory[RerollPlacement][0] == "Reroll")
        OptionPositions[RerollPlacement] = 16;
    
    for (var o = 0; o < array_length(ShopInventory); o++)
    {
        var OptionY = (12 + (32 * o)) - OptionYOffset;
        
        if (SelectedOption != o)
            AltColor = 5662772;
        else
            AltColor = 13695200;
        
        draw_set_halign(fa_left);
        draw_text_color(OptionPositions[o] - (480 * FadeIn), OptionY, ShopInventory[o][0], AltColor, AltColor, AltColor, AltColor, 1);
        
        if (o < (array_length(ShopInventory) - 1))
        {
            draw_set_halign(fa_right);
            draw_text_color(368 - (480 * FadeIn), OptionY, "$" + string_format(ShopInventory[o][2], 1, 2), AltColor, AltColor, AltColor, AltColor, 1);
            
            if (ShopInventory[o][0] != "Reroll" && ShopInventory[o][0] != "Back")
                draw_sprite(sShopItemSalvageIcons, ShopInventory[o][3], OptionPositions[0] - 20 - (480 * FadeIn), OptionY + 16);
        }
        
        if (o == (array_length(ShopInventory) - 1))
            OptionPositions[o] += (16 - OptionPositions[o]) / 5;
        else
            OptionPositions[o] += (40 - OptionPositions[o]) / 5;
    }
    
    var DescText = ShopInventory[SelectedOption][1];
    
    if (WaitForConfirm)
    {
        if (ShopInventory[SelectedOption][0] == "Reroll")
            DescText = "Reroll the shop's selection for $" + string_format(ShopInventory[SelectedOption][2], 1, 2) + "?";
        else
            DescText = "Buy this item for $" + string_format(ShopInventory[SelectedOption][2], 1, 2) + "?";
    }
    
    var ConfirmBoxX = 448;
    var ConfirmBoxY = 68 + ConfirmBoxOffset + (360 * FadeIn);
    draw_sprite_ext(sTextBox, 0, ConfirmBoxX, ConfirmBoxY, 2, 1.5, 0, c_white, 1);
    draw_text_color(ConfirmBoxX + 48, ConfirmBoxY + 16, "Yes", TextColor, TextColor, TextColor, TextColor, 1);
    draw_text_color(ConfirmBoxX + 48, ConfirmBoxY + 48, "No", TextColor, TextColor, TextColor, TextColor, 1);
    ConfirmHandY += (((32 * ConfirmOption) - ConfirmHandY) / 2);
    draw_sprite(sSelectionHand, 0, ConfirmBoxX + 28, ConfirmBoxY + 32 + ConfirmHandY);
    draw_set_halign(fa_left);
    draw_sprite_ext(sTextBox, 0, 0, DescBoxY, 10, 2, 0, c_white, 1);
    draw_text_ext_color(16, DescBoxY + 16, DescText, 32, 544, TextColor, TextColor, TextColor, TextColor, 1);
    FadeIn -= (FadeIn / 10);
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4,
    Value_30 = 30,
    Value_31
}
