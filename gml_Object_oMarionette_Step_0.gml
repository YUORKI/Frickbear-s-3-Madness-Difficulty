var ID = UnknownEnum.Value_16;
var AI = global.AILevels[ID];
MusicMax = 60 - (global.AILevels[UnknownEnum.Value_16] * 1.5);
MusicTimer = min(MusicTimer, MusicMax);

if (AI > 0)
{
    MusicTimer -= 0.016666666666666666;
    
    if (MusicTimer == 10)
        fuzz_up(UnknownEnum.Value_6);
}

var TimeMultiplier = MusicMax - MusicTimer;

if (MusicTimer <= 10 && MusicTimer > 0 && (floor(TimeMultiplier / (0.333 + (MusicTimer / 15))) % 2) == 0)
    ShowWarning = true;
else
    ShowWarning = false;

if (MusicTimer <= 0)
{
    jumpscare(ID, 0);
    MusicTimer = 999;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_16 = 16
}
