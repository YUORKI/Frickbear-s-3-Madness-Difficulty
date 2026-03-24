TileSize = 0;
Active = true;
AnimatronicList = [];

for (var i = 0; i <= UnknownEnum.Value_46; i++)
    array_push(AnimatronicList, i);

array_sort(AnimatronicList, global.SortByLocation);
SelectedAnimatronics = array_create(47, false);
AnimatronicQuota = 6 + ((global.Difficulty + 1) * 4) + ((global.Route == UnknownEnum.Value_4) * 4);

enum UnknownEnum
{
    Value_4 = 4,
    Value_46 = 46
}
