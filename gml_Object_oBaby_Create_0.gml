Initialize = true;
BidybabsLeft = 0;

if (global.Timer > 348)
    instance_destroy();

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (BidybabsLeft > 0 && global.AILevels[UnknownEnum.Value_26] > 0)
    {
        jumpscare(UnknownEnum.Value_26);
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_26 = 26
}
