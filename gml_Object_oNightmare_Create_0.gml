FredbearLevel = 0;
RiseRate = lerp(0.3, 0.7, global.Difficulty / 3);
DeathPenalty = lerp(1, 2, global.Difficulty / 3);
Timer = 5;

if (oHappiestDayDrawer.PeacefulMode)
{
    RiseRate = 0;
    DeathPenalty = 0;
}
