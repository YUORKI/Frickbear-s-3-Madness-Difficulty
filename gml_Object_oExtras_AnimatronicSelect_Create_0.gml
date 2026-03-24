texturegroup_load("Renders");
Timer = 0;
YOffset = 0;
BarDragged = false;
Active = true;
TileSize = 0;
CustomInfo = import_extras();
TileIcons = import_sprites("icon.png", sCustomNightFaces);
IncludeFan = global.UnlockedTrophies[UnknownEnum.Value_40] || global.DevMode;
IncludeHenry = count_up(global.UnlockedTrophies, true, 42) == 42 || global.DevMode;
IncludeWilliam = global.UnlockedTrophies[UnknownEnum.Value_37] || global.DevMode;
UnlockedArray = array_concat(array_concat(global.UnlockedAnimatronics, [IncludeFan, IncludeHenry, IncludeWilliam]), array_create(global.GuardAmount - 4, true));
NamesArray = [];
array_push(NamesArray, ["The Fan", "N/A"]);
array_push(NamesArray, ["Henry Emily", "N/A"]);
array_push(NamesArray, ["William Afton", "N/A"]);
var folders = get_folders();

for (var i = 0; i < array_length(folders); i++)
    array_push(NamesArray, [folders[i], "N/A"]);

NamesArray = array_concat(global.Descriptions, NamesArray);
VanillaNum = UnknownEnum.Value_69 + (IncludeFan + IncludeHenry + IncludeWilliam);

enum UnknownEnum
{
    Value_37 = 37,
    Value_40 = 40,
    Value_69 = 69
}
