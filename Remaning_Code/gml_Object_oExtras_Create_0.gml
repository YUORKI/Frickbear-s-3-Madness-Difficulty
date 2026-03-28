Timer = 0;
TileSize = 0;
Active = true;
TransitionPercent = 1;
OptionTitles = ["Character Gallery", "Concept Art", "Minigames", "Trophies", "Statistics", "Music Player", "Credits", "Boss Rematch", "Building Viewer"];
OptionDescs = ["View artwork, descriptions, jumpscares and voice lines for every character in the game!", "View development materials and concept art for early or scrapped content!", "Play minigames without any distractions!", "Review your accomplishments and the trophies you've earned for them!", "Review stats from your time playing!", "Listen to the game's soundtrack!", "Rewatch the game's credits!", "Replay the game's boss fights!", "Explore the pizzeria!"];
audio_stop_all();
play_music(musExtras);
draw_set_alpha(1);
BGColors = [[[0, 140, 255], [255, 0, 208], [255, 255, 255]], [[204, 0, 88], [0, 16, 76], [0, 0, 0]], [[155, 150, 0], [155, 0, 40], [0, 0, 0]], [[96, 193, 0], [0, 114, 86], [0, 23, 35]], [[124, 0, 0], [30, 0, 13], [0, 0, 0]], [[255, 255, 255], [185, 185, 237], [0, 0, 0]], [[90, 90, 90], [15, 15, 15], [0, 0, 0]], [[0, 140, 255], [255, 0, 208], [255, 255, 255]], [[97, 26, 179], [62, 0, 23], [0, 0, 0]], [[0, 140, 255], [255, 0, 208], [255, 255, 255]]];
PrevColor = 0;
CurColor = 0;
ColorTrans = 0;
WaitToGoBack = false;
BarOffset = 0;
BarDragged = false;
BossMenuUnlocked = global.UnlockedAnimatronics[UnknownEnum.Value_55] || global.DevMode;
BuildingViewerUnlocked = count_up(global.UnlockedTrophies, true, 42) == 42 || global.DevMode;

enum UnknownEnum
{
    Value_55 = 55
}
