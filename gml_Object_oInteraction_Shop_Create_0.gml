RerollPrice = 0;
Rerolls = -1;
Randomizer = [];

for (var i = 0; i < 5; i++)
    Randomizer[i] = irandom(1);

if (array_contains(global.Upgrades, UnknownEnum.Value_30))
    RerollPrice = -3;

function calc_price(arg0)
{
    return round(2 * arg0 * (((global.Difficulty - 1) * 0.25) + 1)) / 2;
}

function generate_inventory(arg0)
{
    Rerolls++;
    RerollPrice += 3;
    
    var SortFunction = function(arg0, arg1)
    {
        return arg0[2] - arg1[2];
    };
    
    ShopInventory = [];
    var InventorySpace = 6 + array_contains(global.Upgrades, UnknownEnum.Value_41);
    
    for (var i = 0; i < 5; i++)
        Randomizer[i] = !Randomizer[i];
    
    var UpgradeList = get_upgrades();
    
    for (var i = 0; i < array_length(UpgradeList); i++)
    {
        var Upgrade = UpgradeList[i];
        
        if (array_contains(arg0, Upgrade.Name) || i == UnknownEnum.Value_41)
            continue;
        
        if (array_contains(global.Upgrades, i))
        {
            if (array_length(Upgrade.StepUp) > 0)
            {
                var NextStepID = Upgrade.StepUp[irandom(array_length(Upgrade.StepUp) - 1)];
                var NextStep = UpgradeList[NextStepID];
                array_push(ShopInventory, [NextStep.Name, NextStep.Desc, calc_price(NextStep.Price), NextStepID]);
            }
        }
        else if (array_length(Upgrade.StepDown) == 0)
        {
            var HasUpgradedForm = false;
            var StepUpArray = Upgrade.StepUp;
            
            if (array_length(StepUpArray) > 0)
            {
                for (var n = 0; n < array_length(StepUpArray); n++)
                {
                    var StepUpStepUpArray = UpgradeList[StepUpArray[n]].StepUp;
                    
                    if (array_contains(global.Upgrades, StepUpArray[n]))
                    {
                        HasUpgradedForm = true;
                        break;
                    }
                    else if (array_length(StepUpStepUpArray) > 0)
                    {
                        for (var m = 0; m < array_length(StepUpStepUpArray); m++)
                        {
                            if (array_contains(global.Upgrades, StepUpStepUpArray[m]))
                            {
                                HasUpgradedForm = true;
                                break;
                            }
                        }
                    }
                }
            }
            
            if (!HasUpgradedForm)
                array_push(ShopInventory, [Upgrade.Name, Upgrade.Desc, calc_price(Upgrade.Price), i]);
        }
    }
    
    ShopInventory = array_shuffle(ShopInventory);
    
    for (var i = 0; i < array_length(ShopInventory); i++)
    {
        if (array_length(ShopInventory) <= InventorySpace)
            break;
        
        if (array_contains(arg0, ShopInventory[i][0]))
        {
            array_delete(ShopInventory, i, 1);
            i = max(i - 1, 0);
        }
    }
    
    if (!array_contains(global.Upgrades, UnknownEnum.Value_31))
    {
        repeat (array_length(ShopInventory) - InventorySpace)
            array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
    }
    
    if (!array_contains(global.Upgrades, UnknownEnum.Value_41))
    {
        var Upgrade = UpgradeList[UnknownEnum.Value_41];
        array_push(ShopInventory, [Upgrade.Name, Upgrade.Desc, calc_price(Upgrade.Price), UnknownEnum.Value_41]);
    }
    
    array_sort(ShopInventory, SortFunction);
    
    if (!array_contains(global.Upgrades, UnknownEnum.Value_31))
        array_push(ShopInventory, ["Reroll", "Reset the shop's inventory.", calc_price(RerollPrice)]);
    
    array_push(ShopInventory, ["Back", "", 0]);
}

generate_inventory([]);
event_inherited();
HeardStory = false;

enum UnknownEnum
{
    Value_30 = 30,
    Value_31,
    Value_41 = 41
}
