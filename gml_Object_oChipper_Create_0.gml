LumberPurchased = false;
PicklesConverted = false;
Lumber = undefined;

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (instance_exists(Lumber) && global.AILevels[UnknownEnum.Value_42] > 0)
    {
        jumpscare(UnknownEnum.Value_42);
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_42 = 42
}
