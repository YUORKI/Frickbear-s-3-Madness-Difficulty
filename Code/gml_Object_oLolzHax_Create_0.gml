WaitToStart = true;
Delay = 0.5;
Timer = 10;

function generate_summon_list()
{
    var Summonables = [];
    var AmountToSummon = array_length(global.AILevels);
    
    for (var i = 0; i < AmountToSummon; i++)
    {
        if (!(character_active(i) || i == UnknownEnum.Value_47) && instance_exists(get_animatronic_object(i)))
            array_push(Summonables, i);
    }
    
    repeat (min(3, array_length(Summonables)))
    {
        var IDToAdd = irandom(array_length(Summonables) - 1);
        array_push(SummonList, Summonables[IDToAdd]);
        array_delete(Summonables, IDToAdd, 1);
    }
}

Head = undefined;
LTenna = undefined;
RTenna = undefined;
Body = undefined;
LArm = undefined;
RArm = undefined;
Frame = 0;
YOffset = -300;
YOffsetSpeed = 4;
HeadOffset = -360;
HeadOffsetSpeed = 0;
HeadRotation = 180;
HeadRotationSpeed = -90;
WoahMyHeadsSpinning = true;
SelectionMade = false;
y = 720;
CurrentVoiceClip = sfxNOTHING;
ChallengeTimer = 0;
ChallengeArray = [];

for (var i = 0; i <= UnknownEnum.Value_46; i++)
{
    if (global.AILevels[i] == 0)
        array_push(ChallengeArray, i);
}

ChallengeArray = array_shuffle(ChallengeArray);
AmountToSummon = 3;

enum UnknownEnum
{
    Value_46 = 46,
    Value_47
}
