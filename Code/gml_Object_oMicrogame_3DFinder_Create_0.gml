global.MicrogameWin = false;
var AnimatronicsToSummon = array_shuffle([UnknownEnum.Value_10, UnknownEnum.Value_6, UnknownEnum.Value_32, UnknownEnum.Value_38, UnknownEnum.Value_27, UnknownEnum.Value_4, UnknownEnum.Value_22, 47]);

if (global.MicrogameLevel == 1)
{
    var RandomPick = irandom(UnknownEnum.Value_3);
    AnimatronicsToSummon = array_shuffle([RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, RandomPick, 47]);
}

if (global.MicrogameLevel == 2)
    AnimatronicsToSummon = array_shuffle([UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, irandom(UnknownEnum.Value_3), irandom(UnknownEnum.Value_3), irandom(UnknownEnum.Value_3), 47]);

for (var i = 0; i < array_length(AnimatronicsToSummon); i++)
{
    var XValue = i % 4;
    var YValue = floor(i / 4);
    
    with (instance_create_depth((XValue * 96) + 144, (YValue * 160) + 80, 0, oInteraction_Animatronic))
    {
        AnimatronicID = AnimatronicsToSummon[i];
        Text = (AnimatronicsToSummon[i] == 47) ? "Microgame_Found" : ((AnimatronicsToSummon[i] <= UnknownEnum.Value_3) ? string("Microgame_Fail_{0}", AnimatronicsToSummon[i]) : "Microgame_Fail");
        Height = get_animatronic_height(AnimatronicsToSummon[i]);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_10 = 10,
    Value_22 = 22,
    Value_27 = 27,
    Value_32 = 32,
    Value_38 = 38
}
