var ID = UnknownEnum.Value_22;
var AI = global.AILevels[ID];
var TempLimit = 30 - AI;
var TimeToKill = 10 - (AI / 4);

if (global.Temperature > TempLimit && AI != 0)
    FredbearLevel += (1 / (60 * TimeToKill));
else
    FredbearLevel = max(FredbearLevel - (1/120), 0);

with (oCamera)
    JawLevel = power(other.FredbearLevel, 1.5);

if (FredbearLevel >= 1)
    jumpscare(ID, 0);

enum UnknownEnum
{
    Value_22 = 22
}
