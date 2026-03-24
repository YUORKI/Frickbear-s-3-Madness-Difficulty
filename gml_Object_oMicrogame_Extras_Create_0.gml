texturegroup_load("Renders");
Timer = 0;
YOffset = 0;
BarDragged = false;
Active = true;
TileSize = 0;
UnlockedArray = array_create(50, false);
NamesArray = array_concat(global.Descriptions, []);
FredbearTile = irandom(UnknownEnum.Value_39);
UnlockedArray[FredbearTile] = true;
NamesArray[FredbearTile] = ["Psycho Foe Fredbear", ""];
var AmountToEnable = [4, 19, 35];

repeat (AmountToEnable[global.MicrogameLevel])
{
    var Pick = FredbearTile;
    
    do
        Pick = irandom(UnknownEnum.Value_39);
    until (!UnlockedArray[Pick]);
    
    UnlockedArray[Pick] = true;
}

global.MicrogameWin = false;
PortraitSize = 0;

enum UnknownEnum
{
    Value_39 = 39
}
